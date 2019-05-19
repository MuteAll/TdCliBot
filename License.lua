local R = {}
--[[
برای عملیات موفق :
{
  "result": "true",
  "status": "registered",
  "code": "200",
  reg_info : {
    "ownerid": "215123",
    "license_key": "creed",
    "license_pass": "cn129eu91x28eb19283nn01x381h283",
    "version": "1.0",
    "expire_ttl": 30
  },
  "Your_IP": "Ip Adress"
}

برای عملیات نا موفق :
یه مثال بود حالا ممکنه چند حالت داشته باشه
فقط error code و error name عوض میشه در حالت های مختلف
{
  "result": "false",
  "error_code": "404",
  "error_name": "License Not Found !",
  "Your_IP": "Ip Adress"
}

]]
R.RegisterLicense = function(license_key, botid, owner, Channel, api)
  Func_Res = "failed"
  if not license_key then
    print(colors("%{red}Error Occured ! Your License Have Problem - Call Support : @Creed%{reset}"))
    return Func_Res
  end
  if not owner then
    print(colors("%{red}Error Occured ! Your Owner Id Have Problem - Call Support : @Creed%{reset}"))
    return Func_Res
  end
  if not botid then
    print(colors("%{red}Error Occured ! Your Cli Robtos ID Not Found - Call Support : @Creed%{reset}"))
    return Func_Res
  end
  if not api then
    print(colors("%{red}Error Occured ! API Robots Username Not Found - Call Support : @Creed%{reset}"))
    return Func_Res
  end
  if Channel then
    print(colors("%{red}Error Occured ! Channel Not Found - Call Support : @Creed%{reset}"))
    return Func_Res
  end
  ------
  url = string.format("https://api.bot-dev.org/license/agent24/register.php?license_key=%s&botid=%s&owner=%s&channel=%s&api=%s", license_key, botid, owner, Channel, api)
  local ress, err = https.request(url)
  res = json.decode(ress)
  -----
  if res.error_code then
    print(colors(string.format("Error Occured !\n%{green}Error Code : %s\nError Name : %s %{reset}", res.error_code, res.error_name)))
  else
    time_to_expire = tonumber(res.reg_info.expire_ttl) * 24 * 60 * 60
    redis.setex("bot_activation:"..source_hash, time_to_expire, "online")
    redis.set("ActivateStatus:"..source_hash, true)
    redis.set("license_pass:"..source_hash, res.reg_info.license_pass)
    redis.set("license_key:"..source_hash, res.reg_info.license_key)
    redis.set("bot_version:"..source_hash, res.reg_info.version)
    Func_Res = "done"
  end
  return Func_Res
end

--[[
{
  "result": "true",
  "status": "active", || "status": "hold",
  "botid": "124123",
  "ownerid": "5555",
  "channel": "Channel",
  "info": {
    "license_key": "creed",
    "expire_ttl": "10",
    "version": "1.0",
    "update_status": "available",
    "update_version": "1.2",
  }
}




]]
R.CheckActivation = function(license_key, license_pass, OwnerId, BotId, Version, Channel)
  url = string.format("https://api.bot-dev.org/license/agent24/check.php?license_key=%s&license_pass=%s&botid=%s&ownerid=%s&version=%s&channel=%s", license_key, license_pass, OwnerId, BotId, Version, Channel)
  if not license_key then
    print(colors("%{red}Error Occured ! Your License Have Problem - Call Support : @Creed%{reset}"))
    return false
  end
  if not license_pass then
    print(colors("%{red}Error Occured ! Your License Have Problem - Call Support : @Creed%{reset}"))
    return false
  end
  if not OwnerId then
    print(colors("%{red}Error Occured ! Your Owner Id Have Problem - Call Support : @Creed%{reset}"))
    return false
  end
  if not BotId then
    print(colors("%{red}Error Occured ! Your Cli Robtos ID Not Found - Call Support : @Creed%{reset}"))
    return false
  end
  if not Version then
    print(colors("%{red}Error Occured ! Robots Version Not Found - Call Support : @Creed%{reset}"))
    return false
  end
  if Channel then
    print(colors("%{red}Error Occured ! Channel Not Found - Call Support : @Creed%{reset}"))
    return false
  end
  local ress, err = https.request(url)
  res = json.decode(ress)
  if res.result == "true" then

  else -- result true or not
    sendSudoers()
    redis.del("ActivateStatus:"..source_hash)
    return false
  end

end
return R
