
function use_update (data, patternID, PatternSyntax, PatternLang)
	local msg = data.message
	local input_text = (msg.content.text or ''):lower():gsub('^[!#/]' , '')
	local group_chat = msg.chat_id
	local sender_id = msg.sender_user_id
	if sender_id == bot.id then;return;end
	tdbot.openChat(group_chat,function(a , data);tdbot.viewMessages(group_chat, {[0] = msg.id});end) --veiw
	if os.difftime(os.time() , msg.date) > 30 then;return;end
	if patternID == '956254585' then;print("PONG");sendText(group_chat, msg.id,'Pong', nil, 'html');end

	if tostring(group_chat):isgroup() then
		if msg.content._ == "messageText" then
		
			--[[if tonumber((database:get(group_chat .. 'spam:'..source_hash) or 0)) >= 6 and not is_sudo(group_chat, sender_id) then
			if tonumber(database:get(group_chat .. 'spam:'..source_hash)) == 6 then
			sendText(group_chat, msg.id, Request_Text(group_chat, 'command_flood'), nil, 'html')
			database:del(group_chat .. 'spam:'..source_hash)
		end;return
	end]]
	matches = {string.match(input_text, PatternSyntax)}
	tbl = {}
	if matches ~= nil then
		if PatternLang == "fa" then
			for k,j in pairs(matches) do
				tbl[k] = matches[k]
			end
			i = #matches
			while i ~= 1 do
				matches[i - 1] = tbl[i]
				i = i - 1
			end
		end
	end
	-- ============ set lang ==============
	if (patternID == "475641716" or patternID == "857548549") and is_mod(group_chat, sender_id) then
		if matches[1] == "fa" or matches[1] == "فارسی" then
			database:hset(group_chat, 'lang:'..source_hash, "fa")
			sendText(group_chat, msg.id, Request_Text(group_chat, 'setlang') , nil, 'html' , {} ,dl_cb, nil)
		elseif matches[1] == "en" or matches[1] == "انگلیسی" then
			database:hset(group_chat, 'lang:'..source_hash, "en")
			sendText(group_chat, msg.id, Request_Text(group_chat, 'setlang') , nil, 'html' , {} ,dl_cb, nil)
		end
	end
	-- ============ Edit =========================
	if patternID == "624279613" and msg.reply_to_message_id and is_sudo(group_chat, sender_id) then
		tdbot.editMessageText(group_chat, msg.reply_to_message_id, nil, input_text:match("^edit (.*)"), nil,nil, nil, 'html')
	end
	-- ============ Edit =========================
	if patternID == "162886781" and is_sudo(group_chat, sender_id) then
		gp_counts = database:scard("bot:groups:count")
		user_counts = database:scard("bot:users:count")
		sendText(group_chat, msg.id, Request_Text(group_chat, 'stats'):format(gp_counts, user_counts), nil , 'html', {} , dl_cb, nil)
	end
	-- ============ Vardump Message ==============

	if patternID == "468856892" and msg.reply_to_message_id and is_sudo(group_chat, sender_id) then
		function DoVardumpText(ex, res)
			sendText(group_chat, msg.id, serpent.block(res,{comment=false}), nil, 'html')
		end
		tdbot.getMessage(group_chat, msg.reply_to_message_id, DoVardumpText, nil)
	end
	-- =============== reload ================
	if patternID == "276212643" and is_sudo(group_chat, sender_id) then
		local success, result = xpcall(dofile, debug.traceback, 'bot.lua')
		if not success then --if a bug happens
			text = '⚠️ *Error Happened *⚠️ \n*Information of Error :*\n\n`%s`'
			x = debug.traceback()
			sendText(group_chat, msg.id, text:format(debug.traceback()), nil, 'md')
		else
			sendText(group_chat, msg.id, '♻️ <b>Successfully Done</b> ♻️\n\n<i>Robot Has been ReLaunched</i> !', nil, 'html')
		end
	end
	if (patternID == "643281463" or patternID == "533182389") and is_sudo(group_chat, sender_id) then
		local _text = '<code>Groups Which Are Moderating By Robot</code> :\n'
		for b , k in pairs(database:hgetall('active:group:'..source_hash)) do
			_text = _text .. '\n•' .. chash_title(b) .. ' <b>->\n</b> ' .. getinfo(k).."\n"
		end
		sendText(group_chat, msg.id, _text, nil, 'html')
	end

	if (patternID == "591154139" or patternID == "322911149") and is_sudo(group_chat, sender_id) then
		database:hdel('active:group:'..source_hash , group_chat)
		database:del('work:'..source_hash..group_chat)
		database:hdel('charger:'..source_hash..group_chat , sender_id)
		database:del(group_chat)
		database:del('warn:'..source_hash..group_chat)
		sendText(group_chat, msg.id, Request_Text(group_chat , 'uninstall'), nil, 'html')
		--tdbot.changeChatMemberStatus(group_chat, bot.id, 'Left')
	end
	if (patternID == "449858743" or patternID == "876483833") and is_sudo(group_chat, sender_id) then
		tdbot.changeChatMemberStatus(group_chat, bot.id, 'Left')
		sendText(group_chat, msg.id , Request_Text(group_chat, 'leave'), nil ,'html')
	end
	if (patternID == "159436379" or patternID == "491968623") and is_sudo(group_chat, sender_id) then
		local id = string.match(input_text, PatternSyntax)
		tdbot.getChat(id,
		function(arg , data)
			print(serpent.block(data, {comment=false}))
			if data._ == 'error' then
				return sendText(group_chat, msg.id, Request_Text(group_chat, 'gpnotfound'), nil, 'html')
			end
			if data.photo and data.photo.big then
				tdbot.downloadFile(data.photo.big.id, 32 ,
				function(a , res)
					tdbot.getChat(id,
					function(arg , data)
						tdbot.sendPhoto(group_chat, msg.id, data.photo.big.path, nil, 0, 0, 0, Request_Text(group_chat, 'gp_pic'):format(get_title(id), id), 0, false, false, nil, callback, data)
					end)
				end)
			end
		end)
	end
	if (patternID == "414168186" or patternID == "785727771") and is_sudo(group_chat, sender_id) then
		local id = string.match(input_text, PatternSyntax)
		tdbot.getChat(id,
		function(arg , data)
			if data._ == 'error' then
				return sendText(group_chat, msg.id, Request_Text(group_chat, 'gpnotfound'), nil, 'html')
			end
			text = Request_Text(group_chat, 'gpinfo')
			tdbot.getChannelMembers(id, 0, 300, 'Administrators', '',
			function(a , res)
				local botadmin , cretor ,a
				for k ,v in pairs(res.members) do
					a =  (a or 0) + 1
					if v.status._ == 'chatMemberStatusCreator' then
						cretor = getinfo(v.user_id)
					end
					if v.user_id == bot.id then
						botadmin = Request_Text(group_chat , 'yes')
					end
				end
				local text = text:format(chash_title(id),(a or 0),(cretor or '😶'),(botadmin or Request_Text(group_chat , 'no')),(data.title))
				sendText(group_chat, msg.id, text, nil, 'html')
			end)
		end)
	end
	if (patternID == "867159132" or patternID == "963947223") and is_owner(group_chat, sender_id) then
		tdbot.getChat(group_chat,
		function(arg , data)
			if data._ == 'error' then
				return sendText(group_chat, msg.id, Request_Text(group_chat, 'gpnotfound'), nil, 'html')
			end
			text = Request_Text(group_chat, 'config_gp')
			tdbot.getChannelMembers(group_chat, 0, 300, 'Administrators', '',
			function(a , res)
				local botadmin , cretor ,a
				local admin_list = {}
				for k ,v in pairs(res.members) do
					a =  (a or 0) + 1
					if v.status._ == 'chatMemberStatusCreator' then
						cretor = getinfo(v.user_id)
						database:sadd('rank:owner:'..source_hash..':'..group_chat , v.user_id)
					elseif v.user_id == bot.id then
						botadmin = Request_Text(group_chat , 'yes')
					elseif v.status._ == 'chatMemberStatusAdministrator' then
						database:sadd('rank:mod:'..source_hash..':'..group_chat , v.user_id)
						table.insert(admin_list, getinfo(v.user_id))
					end
				end
				local user_id , panl
				adminlist = ''
				if #admin_list == 0 then
					if getlang(group_chat) == 'fa' then
						adminlist = 'هیچ ادمینی وجود نداشت'
					elseif getlang(group_chat) == 'en' then
						adminlist = 'No Admin Has been Found'
					end
				else
					for k,v in pairs(admin_list) do
						adminlist = adminlist ..'\n'.. v
					end
				end
				for k ,v in pairs(database:hgetall('charger:'..source_hash..group_chat)) do
					user_id = k
					if v == 'true' then
						pan1 = Request_Text(group_chat, 'charge_unlimit'):format(Request_time(group_chat))
					else
						panl = export_unix(jdate:unix(v), getlang(group_chat))
					end
					break
				end
				local _time = database:ttl('work:'..source_hash..group_chat)
				local _text = export_unix(jdate:unix(_time), getlang(group_chat))
				if not database:hget(group_chat , 'link:'..source_hash) then
					if getlang(group_chat) == "fa" then
						link = 'لینکی برای گروه ثبت نشده است\nاز دستور \'لینک\' برای دریافت و ثبت لینک استفاده نمایید .'
					elseif getlang(group_chat) == "en" then
						link = 'No Link Has been Save for This Group.\nUse \'Link\' Command to Get and Save The Group link.'
					end
				else
					link = database:hget(group_chat , 'link:'..source_hash)
				end
				local text = text:format(chash_title(group_chat),(a or 0),(cretor or '😶'), adminlist ,link,(botadmin or Request_Text(group_chat , 'no')),_text,(data.title))
				database:hset(group_chat , 'lock_links:'..source_hash, 'delete')
				database:hset(group_chat , 'lock_bot:'..source_hash, 'delete')
				sendText(group_chat, msg.id, text, nil, 'html')
			end)
		end)
	end
	if (patternID == "591941829" or patternID == "782517243") and is_sudo(group_chat, sender_id) then
		if input_text:match('unlimited$') or input_text:match('نامحدود$') then
			sendText(group_chat, msg.id, Request_Text(group_chat, 'charge_unlimit'):format(Request_time(group_chat).." "..Request_date(group_chat)), nil, 'html')
			database:set('work:'..source_hash..group_chat , true)
			database:hset('charger:'..source_hash..group_chat , sender_id, true)
			return
		end
		local days,hour,min,unix = _input_date(input_text)
		if not (days or hour or min ) then
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'no_time'), nil, 'html')
		end
		database:set('work:'..source_hash..group_chat , true)
		database:hset('charger:'..source_hash..group_chat , sender_id, unix)
		database:del("Told:Expire:"..source_hash..group_chat)
		database:expire('work:'..source_hash..group_chat , unix)
		local text = Request_Text(group_chat , 'expire_set'):format((days or 0) , (hour or 0) , (min or 0))
		sendText(group_chat, msg.id, text, nil, 'html')
	end
	if (patternID == "913232689" or patternID == "286695962") and is_mod(group_chat, sender_id) then
		local user_id , panl
		for k ,v in pairs(database:hgetall('charger:'..source_hash..group_chat)) do
			user_id = k
			if v == 'true' then
				return sendText(group_chat, msg.id, Request_Text(group_chat, 'chargestats_unlimit'):format(Request_date(group_chat), Request_time(group_chat)), nil, 'html')
			else
				panl = export_unix(jdate:unix(v), getlang(group_chat))
			end
			break
		end
		local _time = database:ttl('work:'..source_hash..group_chat)
		local brt = jdate:unix_to_date(_time + os.time())
		local _text = export_unix(jdate:unix(_time), getlang(group_chat))
		local matcher = jdate:miladi_to_shamsi(brt.year ,brt.month ,brt.day)
		local __text = '<code>' .. day_of_weak[brt.wday + 1] .. ','.. matcher[3] .. ',' .. jdate:month_to_word(matcher[2]) ..' ' .. matcher[1] ..'</code>'
		sendText(group_chat, msg.id, Request_Text(group_chat, 'expirestats'):format(_text , __text , getinfo(user_id) , panl , '%25'), nil, 'html')
	end

	-- =============== Install ================
	if (patternID == "664956534" or patternID == "418214612") and is_sudo(group_chat, sender_id) then
		if not database:hget('active:group:'..source_hash , group_chat) then
			unix=86400*2
			database:hset('active:group:'..source_hash , group_chat , sender_id)
			database:set('work:'..source_hash..group_chat , true)
			database:hset('charger:'..source_hash..group_chat , 'charger', true)
			database:expire('work:'..source_hash..group_chat , unix)
			tdbot.getChat(group_chat,
			function(arg , data)
				text = Request_Text(group_chat, 'install')
				tdbot.getChannelMembers(group_chat, 0, 300, 'Administrators', '',
				function(a , res)
					local botadmin , creator ,a
					for k ,v in pairs(res.members) do
						a =  (a or 0) + 1
						if v.status._ == 'chatMemberStatusCreator' then
							creator = getinfo(v.user_id)
						end
						if v.user_id == bot.id then
							botadmin = Request_Text(group_chat , 'yes')
						end
					end
					local text = text:format(group_chat,(a or 0),(creator or '😶'),(botadmin or Request_Text(group_chat , 'no')),(data.title))
					sendText(group_chat, msg.id, text, nil, 'html')
				end)
			end)
		else
			sendText(group_chat, msg.id, Request_Text(group_chat, 'installed_before'):format(getinfo(database:hget('active:group:'..source_hash , group_chat))), nil, 'html')
		end
	end
	-- End of sudo cmds
	if not is_active(msg) then
		return
	end
	if (patternID == "265674748" or patternID == "629849296") and is_mod(group_chat, sender_id) then
		tdbot.getInlineQueryResults(config.api, group_chat, 1, 1, 'cpanel ' .. group_chat, 0,
		function(a , data)
			if data._ == "error" then
				return sendText(group_chat, msg.id, '🐞اختلال در سیستم لطفا کمی صبر کنید.', nil, 'html')
			end
			tdbot.sendInlineQueryResultMessage(group_chat, msg.id, 1, 0, data.inline_query_id, 1)
		end)
	end
	-- ================== restrict option ================

	if (patternID == "467133497" or patternID ==  "794493464") and is_mod(group_chat, sender_id) then
		_unix = database:hget(group_chat , 'restrict_unix:'..source_hash)
		text = Request_Text(group_chat , 'restrict_settings')
		if not _unix or _unix == 0  then
			text = text:format(Request_Text(group_chat , 'restrict_notime'))
			sendText(group_chat, msg.id, text, nil, 'html')
		else
			local time = database:hgetall(group_chat)
			text = text:format(Request_Text(group_chat , 'restrict_time'):format((time.restrict_day or 0) , (time.restrict_hour or 0), (time.restrict_min or 0)))
			sendText(group_chat, msg.id, text, nil, 'html')
		end
	end
	-- ==================== restrict settime ==============
	if (input_text:match('^setrestrict 0') or input_text:match('^تنظیم محدودیت 0'))  and is_mod(group_chat, sender_id) then
		local text = Request_Text(group_chat , 'restrict_set0')
		database:hdel(group_chat , 'restrict_unix:'..source_hash) -- databse::restrict_unix
		sendText(group_chat, msg.id, text, nil, 'html')
		return
	end
	if (patternID == "777722379" or patternID == "451925647")  and is_mod(group_chat, sender_id) then
		local days,hour,min,unix = input_date(matches[1])
		if not (days or hour or min ) then
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'no_time'), nil, 'html')
		end
		local text = Request_Text(group_chat , 'restrict_set'):format((days or 0) , (hour or 0) , (min or 0))
		database:hmset(group_chat ,
		'restrict_unix:'..source_hash ,  unix,
		'restrict_min:'..source_hash ,  (min or 0),
		'restrict_hour:'..source_hash ,  (hour or 0),
		'restrict_day:'..source_hash ,  (days or 0)) -- databse::restrict_unix
		sendText(group_chat, msg.id, text, nil, 'html')
		return
	end
	if (patternID == "518515975" or patternID == "923753458") and is_mod(group_chat, sender_id) then
		i = 0
		_text = Request_Text(group_chat, "Filter_list")
		for k ,v in pairs(database:hgetall('filters:' .. group_chat .. source_hash)) do
			i = i + 1
			_text = _text .. '\n• <code>['.. k ..']</code>>' .. v
		end
		if i == 0 then 
			_text = Request_Text(group_chat, "NFilter_list")
		end 
		sendText(group_chat, msg.id, _text, nil, 'html')
	end
	if (patternID == "595486252" or patternID == "358487544") then
		database:del('filters:' .. group_chat .. source_hash)
		sendText(group_chat, msg.id, Request_Text(group_chat, "clean_filters"), nil, 'html')
	end

	if (patternID == "646658211" or patternID == "646658212") and is_mod(group_chat, sender_id) then
		print(matches[1] .. " and ".. matches[2])
		local _type = {['ban']=true,['kick']=true,['warn']=true, ['delete']=true, ['restrict']=true, ['محدودیت']=true, ['حذف']=true, ['اخطار']=true, ['اخراج']=true, ['مسدود']=true}
		if not _type[matches[1]] or not matches[2] then
			return
		end
		matches[1] = utils.TranslateEN(matches[1])
		FilterAction = database:hget('filters:' .. group_chat .. source_hash , matches[2])
		if not FilterAction then
			database:hset('filters:' .. group_chat .. source_hash , matches[2] , matches[1])
			text = Request_Text(group_chat, "filter"):format(matches[2], matches[1])
			if getlang(group_chat) == "fa" then
				text = string.gsub(text, matches[1], utils.TranslateFA(matches[1]))
			end
		else 
			if getlang(group_chat, "fa") then
				text = Request_Text(group_chat, "isfilter"):format(matches[2], TranslateFA(FilterAction))
			elseif getlang(group_chat, "en") then 
				text = Request_Text(group_chat, "isfilter"):format(matches[2], FilterAction)
			end
		end
		sendText(group_chat, msg.id, text, nil, 'html')
	end
	




















-- mamadreza


	if (patternID == "123474258" or patternID == "829326195") and is_mod(group_chat, sender_id) then 
		if database:hget('filters:' .. group_chat .. source_hash , matches[1]) then
			database:hdel('filters:' .. group_chat .. source_hash , matches[1])
			text = Request_Text(group_chat, "unfilter")
			sendText(group_chat, msg.id, text:format(matches[1]), nil, 'html')
		else 
			sendText(group_chat, msg.id, Request_Text(group_chat, "isunfilter"):format(matches[1]), nil, 'html')
		end
	end

	--delete ::locks
	if (patternID == "413862159" or patternID == "634914543" or patternID == "633595375") and is_mod(group_chat, sender_id) then
		doLockMedias(group_chat , sender_id, msg.id, matches[1], 'delete')
	end
	--ban ::locks
	if (patternID == "785564618" or patternID == "649262321" or patternID == "485947648") and is_mod(group_chat, sender_id) then
		doLockMedias(group_chat , sender_id, msg.id, matches[1], 'ban')
	end
	--kick ::locks
	if (patternID == "227432533" or patternID == "485947648" or patternID == "817438836") and is_mod(group_chat, sender_id) then
		doLockMedias(group_chat , sender_id, msg.id, matches[1], 'kick')
	end
	--restrict ::locks
	if (patternID == "367761393" or patternID == "324393367" or patternID == "637471762") and is_mod(group_chat, sender_id) then
		doLockMedias(group_chat , sender_id, msg.id, matches[1], 'restrict')
	end
	--warn ::locks
	if (patternID == "745865175" or patternID == "467115738" or patternID == "873541417") and is_mod(group_chat, sender_id) then
		doLockMedias(group_chat , sender_id, msg.id, matches[1], 'warn')
	end
	--open ::locks
	if (patternID == "379528645" or patternID == "277787632" or patternID == "949266295") and is_mod(group_chat, sender_id) then
		return doLockMedias(group_chat , sender_id, msg.id, matches[1], 'open')
	end

	--active ::locks
	if (patternID == "272467881" or patternID == "616716237" or patternID == "979598677") and is_mod(group_chat, sender_id) then
		return doActiveMedias(group_chat , sender_id, msg.id, matches[1], 'active')
	end

	--deactive ::locks
	if (patternID == "711914144" or patternID == "465576464" or patternID == "353369854") and is_mod(group_chat, sender_id) then
		return doActiveMedias(group_chat , sender_id, msg.id, matches[1], 'deactive')
	end

	--[[ === warn === by behrad

	if (patternID == "397476697" or patternID == "728753114")  and is_mod(group_chat, sender_id) then
		text = 	Request_Text(group_chat , 'warn_settings')
		local time = database:ttl('warn:'..source_hash..group_chat)
		if time <= 0 then
			timer = '#forever'
		elseif tonumber(time) then
			timer = Request_Text(group_chat , 'restrict_time'):format(jdate:unix(time):unix_day(),jdate:unix(time):unix_hour(),jdate:unix(time):unix_min())
		end
		sendText(group_chat, msg.id, text:format(timer,(database:hget(group_chat , 'warn_max:'..source_hash) or 10),
		(database:hget(group_chat , 'warn_mode:'..source_hash) or 'kick'),
		(database:hget(group_chat , 'warn_mute:'..source_hash) or 'off'),
		(database:hget(group_chat , 'warn_log:'..source_hash) or 'on')), nil , 'html') --langer
	end]]

	if patternID == "229521145" and is_mod(group_chat, sender_id)  then -- langer
		local days,hour,min,unix = input_date(input_text)
		if not (days or hour or min ) then
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'no_time'), nil, 'html')
		end
		if matches[1] == "نامحدود" or "unlimited" then 
			database:set('warn:'..source_hash..group_chat , true)
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'warnex_unlimit'):format(days,hour,min), nil, 'html')
		end
		database:expire('warn:'..source_hash..group_chat , unix)
		return sendText(group_chat, msg.id, Request_Text(group_chat , 'restrict_set'):format(days,hour,min), nil, 'html')
	end

	if (patternID == "666265416" or patternID == "885387995") and is_mod(group_chat, sender_id)  then
		local number =  tonumber( matches[1] )
		if number and not(number < 2 or number > 30) then
			database:hset(group_chat , 'warn_max:'..source_hash , number)
			sendText(group_chat, msg.id, Request_Text(group_chat , 'max_warn'):format(number) , nil , 'html') --langer
		else
			sendText(group_chat, msg.id, Request_Text(group_chat , 'warnexpire_set_error') , nil , 'html') --langer
		end
	end

	if (patternID == "253828899" or patternID == "643381417") and is_mod(group_chat, sender_id)  then -- langer
		warn_name = matches[1]
		fa_modes = {
			["kick"] = "اخراج",
			["restrict"] = "محدودیت",
			["ban"] = "مسدود"
		}
		for k,v in pairs(fa_modes) do 
			if v == warn_name then 
				warn_name = k 
			end 
		end
		if  warn_name == ('kick' or 'اخراج' or 'restrict' or 'محدودیت' or 'ban' or 'مسدود') then
			database:hset(group_chat , 'warn_mode:'..source_hash , warn_name)
			text = Request_Text(group_chat , 'mode_warn'):format(warn_name)
			if getlang(group_chat) == "fa" then
				text = text:gsub(warn_name, fa_modes[warn_name])
			end
			sendText(group_chat, msg.id, text , nil , 'html') 
		else
			sendText(group_chat, msg.id, Request_Text(group_chat , 'error_mode_warn'):format(warn_name):gsub("nil",(warn_name or "مورد نظر")) , nil , 'html') --langer
		end
	end

	if (patternID == "527559716" or patternID == "476642348") and is_mod(group_chat, sender_id)  then
		sendText(group_chat, msg.id, Request_Text(group_chat , 'warn_clean'):format(getinfo(sender_id)) , nil , 'html') --langer
		database:del('warn:'..source_hash..group_chat)
	end

	if (patternID == "597426517" or patternID == "529297341") and is_mod(group_chat, sender_id)  then
		if matches[1] == 'on' or 'فعال' then
			database:hset(group_chat , 'warn_log:'..source_hash , true)
			sendText(group_chat, msg.id, Request_Text(group_chat , 'warn_log'), nil , 'html') --langer
		elseif matches[1] == 'off' or 'غیرفعال' then
			sendText(group_chat, msg.id, Request_Text(group_chat , 'warn_logoff'), nil , 'html') --langer
			database:hdel(group_chat , 'warn_log:'..source_hash)
		end
	end


	-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
	if (patternID == "972886228" or patternID =="525743677") and is_mod(group_chat, sender_id) then
		function getSettings(mode)
			if database:hget(group_chat, 'lock_'..mode..':'..source_hash) then
				return languages[group_lang]['stats_' .. database:hget(group_chat, 'lock_'..mode..':'..source_hash)] or 'BUG'
			else
				return languages[group_lang]['stats_open']
			end
		end
		local text = ''
		group_lang = getlang(group_chat)
		for x , y in pairs(locks) do
			if group_lang == "fa" then
				text = ('%s\n%s<b>%s</b> : <code>%s</code>'):format(text ,utils.emoji(y) , utils.trlocks_to_fa(y) , getSettings(y))
			else
				text = ('%s\n%s<b>%s</b> : <code>%s</code>'):format(text , utils.emoji(y) , (y):gsub('^%a' , string.upper), getSettings(y))
			end
		end
		for x , y in pairs(ex_locks) do
			if group_lang == "fa" then
				text = ('%s\n%s<b>%s</b> : <code>%s</code>'):format(text ,utils.emoji(y) , utils.trexlocks_to_fa(y) , getSettings(y))
			else
				
				text = ('%s\n%s<b>%s</b> : <code>%s</code>'):format(text , utils.emoji(y) , (y):gsub('^%a' , string.upper), getSettings(y))
			end
		end
		sendText(group_chat, msg.id, text , nil , 'html')
	end
	
	if (patternID == "534851678" or patternID == "849722426")  then
		function Command_me(ex, result)
			gp_msgs = database:get(group_chat..':gp:msgs:'..source_hash) or 0
			usermsgs = database:get(group_chat..':usermsgs:'..source_hash..result.user_id ) or 0
			msgs_percent = math.ceil((usermsgs/gp_msgs)*100)

			if getlang(group_chat) == 'fa' then
				if database:hget(group_chat, result.user_id..'invited:by:'..source_hash) then
					invited_by = getinfo(tonumber(database:hget(group_chat, result.user_id..'invited:by:'..source_hash)))
				else
					invited_by = 'ثبت نشده !'
				end
				if database:get(sender_id..':laghab:'..source_hash) then
					laghab = database:get(sender_id..':laghab:'..source_hash)
				else
					laghab = 'تنظیم نشده !'
				end
				user_rank = rank({chat_id = group_chat, sender_user_id = sender_id})
				user_rank = string.gsub(user_rank , 'sudo', "سازنده ربات")
				user_rank = string.gsub(user_rank , 'admin', "دمین ربات")
				user_rank = string.gsub(user_rank , 'support', "پشتیبان ربات")
				user_rank = string.gsub(user_rank , 'member', "کاربر عادی")
				user_rank = string.gsub(user_rank , 'owner', "مدیر گروه")
				user_rank = string.gsub(user_rank , 'mod', "ناظم گروه")
			else --if getlang(group_chat) == 'en' then
				if database:hget(group_chat, result.user_id..'invited:by:'..source_hash) then
					invited_by = getinfo(tonumber(database:hget(group_chat, result.user_id..'invited:by:'..source_hash)))
				else
					invited_by = 'Not Saved !'
				end
				if database:get(sender_id..':laghab:'..source_hash) then
					laghab = database:get(sender_id..':laghab:'..source_hash)
				else
					laghab = 'Not Set !'
				end
				user_rank = rank({chat_id = group_chat, sender_user_id = sender_id})
			end
			local text = Request_Text(group_chat, 'me_command')
			local kicked_time = database:get(group_chat..":"..source_hash..':kicked:times:'..msg.sender_user_id) or 0
			local inv_count = database:get(group_chat..":"..source_hash..':user:invited'..sender_id) or 0
			sendText(group_chat, msg.id,text:format(getinfo(result.user_id),usermsgs,gp_msgs,'%' .. msgs_percent,user_rank,laghab,kicked_time, inv_count, invited_by), nil , 'html')

		end
		tdbot.getChatMember(group_chat , sender_id, Command_me, nil)
	end
	-- MUTES --
	if (patternID == "752481564" or patternID == "199545483") and is_mod(group_chat, sender_id)  then
		database:hset(group_chat , 'mute_all:'..source_hash , true)
		sendText(group_chat, msg.id, Request_Text(group_chat , 'mute_all'):format(Request_time(group_chat)..' '..Request_date(group_chat)) , nil , 'html')
	end
	if (patternID == "539376278" or patternID == "459196152") and is_mod(group_chat, sender_id)  then
		database:hdel(group_chat , 'mute_all:'..source_hash)
		sendText(group_chat, msg.id, Request_Text(group_chat , 'unmute_all'):format(Request_time(group_chat)..' '..Request_date(group_chat)) , nil , 'html')
	end
	---- END OF MUTES ----
	if (patternID == "866282173" or patternID == "934278767") then
		if (patternID == "866282173" or patternID == "934278767") and msg.reply_to_message_id == 0 then
			return utils.id_command(sender_id, group_chat, nil)
		else
			return input_match(msg , utils.id_command)
		end
	end
	if (patternID == "321188225" or patternID == "125775142") and is_mod(group_chat, sender_id)  then
		return input_match(msg , utils.warn_user)
	end
	if (patternID == "161491933" or patternID == "734365625") and is_mod(group_chat, sender_id)  then
		return input_match(msg , utils.unwarn_user)
	end
	if (patternID == "979242959" or patternID == "742665566") and is_mod(group_chat, sender_id)  then
		return input_match(msg , utils.nowarn_user)
	end
	if (patternID == "886764275" or patternID == "766782689" or patternID == "932676451") and is_mod(group_chat, sender_id)  then
		return input_match(msg , utils.mute_user)
	end
	if (patternID == "671793632" or patternID == "188723116") and is_mod(group_chat, sender_id) then
		return input_match(msg , utils.unmute_user)
	end
	if (patternID == "458547564" or patternID == "855435523") and is_mod(group_chat, sender_id) then
		return input_match(msg , utils.ban_user)
	end
	if (patternID == "171685754" or patternID == "738987392") and is_mod(group_chat, sender_id) then
		return input_match(msg , utils.unban_user)
	end
	if (patternID == "854962427" or patternID == "185691863") and is_sudo(group_chat, sender_id) then
		return input_match(msg , utils.banall_user)
	end
	if (patternID == "961316288" or patternID == "153395625") and is_sudo(group_chat, sender_id) then
		return input_match(msg , utils.unbanall_user)
	end
	if (patternID == "678127621" or patternID == "264346885") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.allow_user)
	end
	if (patternID == "146353318" or patternID == "689264328") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.disallow_user)
	end
	if (patternID == "238987648" or patternID == "862341416") and is_mod(group_chat, sender_id) then
		return input_match(msg , utils.kick_user)
	end
	if (patternID == "383359115" or patternID == "818678572") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.promote_user)
	end
	if (patternID == "413932291" or patternID == "777186715") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.demote_user)
	end
	if (patternID == "114944985" or patternID == "913296394") then
		if database:scard('rank:owner:'..source_hash..':'..group_chat) ~= 0 then
			text = Request_Text(group_chat , 'owner_list')
		else
			text = Request_Text(group_chat , 'no_owner_list')
		end
		for k , v in pairs(database:smembers('rank:owner:'..source_hash..':'..group_chat)) do
			text = text..'<b>'..k..' -</b>'..getinfo(v)..'\n'
		end
		sendText(group_chat, msg.id, text, nil, 'html')
	end
	if (patternID == "874315943" or patternID == "722359194") then
		if database:scard('rank:mod:'..source_hash..':'..group_chat) ~= 0 then
			text = Request_Text(group_chat , 'mod_list')
		else
			text = Request_Text(group_chat , 'no_mod_list')
		end
		for k , v in pairs(database:smembers('rank:mod:'..source_hash..':'..group_chat)) do
			text = text..'<b>'..k..' -</b>'..getinfo(v)..'\n'
		end
		sendText(group_chat, msg.id, text, nil, 'html')
	end
	if (patternID == "637949196" or patternID == "653441821" or patternID == "182978251") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.owner_user)
	end
	if (patternID == "461226567" or patternID == "474862984" or patternID == "724391323") and is_owner(group_chat, sender_id) then
		return input_match(msg , utils.deowner_user)
	end

	if (patternID == "349779449" or patternID == "268928669") and is_owner(group_chat, sender_id)  then
		title = matches[1]
		tdbot.changeChatTitle(group_chat, title)
	end
	-- PIN --
	if (patternID == "237945192" or patternID == "596266495") and is_mod(group_chat, sender_id)  then
		if tonumber(msg.reply_to_message_id) <= 0 then
			return	sendText(group_chat, msg.id, Request_Text(group_chat , 'replyit'), nil, 'html')
		end
		tdbot.pinChannelMessage(group_chat, msg.reply_to_message_id, false,
		function(x , data)
			if data._ == 'error' then
				if data.code == 6 then
					sendText(group_chat, msg.id, Request_Text(group_chat , 'imnotadmin'), nil, 'html')
				elseif data.code == 400 then
					sendText(group_chat, msg.reply_to_message_id, Request_Text(group_chat , 'ispinned'), nil, 'html')
				end
				return
			end
			database:hset(group_chat ,'pin:'..source_hash,msg.reply_to_message_id)
			sendText(group_chat, msg.reply_to_message_id, Request_Text(group_chat , 'haspinned'), nil, 'html')
		end)
	end
	if (patternID == "564711114" or patternID == "929646713") and is_mod(group_chat, sender_id)  then
		if not database:hget(group_chat ,'pin:'..source_hash) then
			return	sendText(group_chat, msg.id, Request_Text(group_chat , 'nopindatabase'), nil, 'html')
		end
		tdbot.pinChannelMessage(group_chat, database:hget(group_chat ,'pin:'..source_hash), false,
		function(x , data)
			if data._ == 'error' then
				if data.code == 6 then
					sendText(group_chat, msg.id, Request_Text(group_chat , 'imnotadmin'), nil, 'html')
				elseif data.code == 400 then
					if data.message == "MESSAGE_ID_INVALID" then
						database:hdel(group_chat ,'pin:'..source_hash)
						return sendText(group_chat, msg.id, Request_Text(group_chat , 'nopindatabase'), nil, 'html')
					end
					sendText(group_chat, database:hget(group_chat ,'pin:'..source_hash), Request_Text(group_chat , 'ispinned'), nil, 'html')
				end
				return
			end
			sendText(group_chat, database:hget(group_chat ,'pin:'..source_hash), Request_Text(group_chat , 'haspinned'), nil, 'html')
		end)
	end
	if (patternID == "372417727" or patternID == "346477772")  and is_mod(group_chat, sender_id)  then
		tdbot.unpinChannelMessage(group_chat,
		function(a , data)
			if data._ == 'error' then
				if data.code == 6 then
					sendText(group_chat, msg.id, Request_Text(group_chat , 'imnotadmin'), nil, 'html')
				elseif data.code == 400 then
					sendText(group_chat, msg.reply_to_message_id, Request_Text(group_chat , 'nopinned'), nil, 'html')
				end
				return
			end
			sendText(group_chat, msg.reply_to_message_id, Request_Text(group_chat , 'hasunpinned'), nil, 'html')
		end)
	end
	if (patternID == "665151959" or patternID == "167114782") and is_mod(group_chat, sender_id)  then
		tdbot.getChannelFull(group_chat,
		function(a , data)
			if tonumber(data.pinned_message_id) <= 0 then
				return sendText(group_chat, msg.id, Request_Text(group_chat , 'nopindatabase'), nil, 'html')
			end
			sendText(group_chat, data.pinned_message_id, Request_Text(group_chat , 'ispinned'), nil, 'html')
		end)
	end

	if (patternID == "757744182" or patternID == "214196196")  and is_mod(group_chat, sender_id)  then
		local text = matches[1]
		if not text and tonumber(msg.reply_to_message_id) <= 0 then
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'errorwelcomeset'), nil, 'html')
		end
		if tonumber(msg.reply_to_message_id) ~= 0 then
			tdbot.getMessage(group_chat, msg.reply_to_message_id,
			function(b , data)
				if data.content._ ~= 'messageText' then
					return
				end
				local text = data.content.text
				welcome(group_chat , text)
			end)
		else
			welcome(group_chat , text)
		end
	end
	if (patternID == "138235145" or patternID == "413468182") and is_mod(group_chat, sender_id)  then
		return sendText(group_chat, msg.id, database:hget(group_chat , 'welcome:'..source_hash) or Request_Text(group_chat ,'nowelcome'), nil, 'html')
	end
	if (patternID == "674489691" or patternID == "659523845") and is_mod(group_chat, sender_id)  then
		database:hdel(group_chat , 'welcome:'..source_hash)
		return sendText(group_chat, msg.id, Request_Text(group_chat ,'delwelcome'), nil, 'html')
	end
	if (patternID == "684331641" or patternID == "619725797") and is_mod(group_chat, sender_id)  then
		if matches[1]  == ('on' or 'فعال') then
			database:hset(group_chat , '_welcome:'..source_hash , true)
			sendText(group_chat, msg.id, Request_Text(group_chat ,'welcomeon'), nil, 'html')
		elseif matches[1] == ('off' or 'غیرفعال') then
			database:hdel(group_chat , '_welcome:'..source_hash)
			sendText(group_chat, msg.id, Request_Text(group_chat ,'welcomeoff'), nil, 'html')
		end
	end

	if (patternID == "158947688" or patternID == "669736357") and is_mod(group_chat, sender_id)  then
		tdbot.exportChatInviteLink(group_chat,
		function(a ,data)
			if data._ == "error" then
				return sendText(group_chat, msg.id, Request_Text(group_chat ,'imnotadmin'), nil, 'html')
			else
				database:hset(group_chat , 'link:'..source_hash , data.invite_link)
				sendText(group_chat, msg.id, Request_Text(group_chat ,'link'):format(chash_title(group_chat) , data.invite_link), nil, 'html')
			end
		end)
	end

	if (patternID == "661856668" or patternID == "355977658") then
		local number = matches[1]
		if number == 0 then
			return sendText(group_chat, msg.id, Request_Text(group_chat , 'fadd_wrongnum'), nil, 'html')
		end
		database:hset(group_chat , 'forceadd:'..source_hash , number)
		sendText(group_chat, msg.id, Request_Text(group_chat , 'setforceadd'):format(number), nil, 'md')
	end

	-- list
	if (patternID == "741343748" or patternID == "792696955") and is_mod(group_chat, sender_id)   then
		tdbot.getChannelMembers(group_chat, 0, 300, 'Administrators', '', function(a , data)
			local text = Request_Text(group_chat , 'list_admin')
			local _text = ''
			for k ,v in pairs(data.members) do
				_text = _text .. '\n• ' .. getinfo(v.user_id)
				if v.status._ == 'chatMemberStatusCreator' then
					_text = _text .. '>> <b>' .. Request_Text(group_chat ,'creator') .. '</b>'
				else
					_text = _text .. '>> <b>' .. Request_Text(group_chat ,'admin') .. '</b>'
				end
			end
			sendText(group_chat, msg.id, text:format(_text , data.total_count), nil, 'html')
		end)
	end
	if (input_text:match('276925989') or patternID == "599232796") and is_mod(group_chat, sender_id)  then
		return input_match(msg , function(a , b);tdbot.deleteMessagesFromUser(b, a);end)
	end

	if (patternID == "298989626" or patternID == "161655192") and is_mod(group_chat, sender_id) and msg.reply_to_message_id then
		deleteMessages(group_chat, msg.reply_to_message_id)
		deleteMessages(group_chat, msg.id)
	end
	if (patternID == "337827518" or patternID == "612633644") and is_mod(group_chat, sender_id)  then
		function clean_msgs(arg , data)
			if not next(data.messages) then
				return
			end
			for x , y in pairs(data.messages) do
				tdbot.deleteMessagesFromUser(msg.chat_id, y.sender_user_id)
				last_id = y.id
			end
			tdbot.getChatHistory(group_chat, last_id, 0, 999999999, false , clean_msgs)
		end
		deleteMessages(group_chat, msg.id)
		tdbot.getChatHistory(group_chat, msg.id, 0, 999999999, false , clean_msgs)
	end
	if (patternID == "823657279" or patternID == "272558414") and is_mod(group_chat, sender_id)  then
		tdbot.getChannelMembers(group_chat, 0, 300, 'Bots', '', function(a , data)
			local text = Request_Text(group_chat , 'list_bots')
			local _text = ''
			for k ,v in pairs(data.members) do
				_text = _text .. '\n• ' .. getinfo(v.user_id)
			end
			sendText(group_chat, msg.id, text:format(_text , data.total_count), nil, 'html')
		end)
	end

	if (patternID == "167213786" or patternID == "428796657") and is_mod(group_chat, sender_id)  then
		tdbot.getChannelMembers(group_chat, 0, 300, 'Banned', '', function(a , data)
			local text = Request_Text(group_chat , 'list_bots')
			local _text = ''
			for k ,v in pairs(data.members) do
				_text = _text .. '\n• ' .. getinfo(v.user_id)
			end
			sendText(group_chat, msg.id, text:format(_text , data.total_count), nil, 'html')
		end)
	end

	if (patternID == "483632931" or patternID == "795429851") and is_mod(group_chat, sender_id)  then
		tdbot.getChannelMembers(group_chat, 0, 300, 'Bots', '', function(a , data)
			local text = Request_Text(group_chat , 'clean_bots')
			for k ,v in pairs(data.members) do
				tdbot.changeChatMemberStatus(msg.chat_id, v.user_id, 'Banned', {0}, dl_cb, nil)
			end
			sendText(group_chat, msg.id, text:format(data.total_count), nil, 'html')
		end)
	end
	if (patternID == "721146444" or patternID == "871491222") and is_mod(group_chat, sender_id) then
		tdbot.getChannelMembers(group_chat, 0, 300, 'Restricted', '', function(a , data)
			local text = Request_Text(group_chat , 'list_restrict')
			local _text = ''
			for k ,v in pairs(data.members) do
				_text = _text .. '\n• ' .. getinfo(v.user_id)
			end
			sendText(group_chat, msg.id, text:format(_text , data.total_count), nil, 'html')
		end)
	end

	if (patternID == "157468561" or patternID == "626677973") and is_mod(group_chat, sender_id) then
		tab = database:hgetall('warn:'..source_hash..group_chat)
		if not next(tab) then
			return sendText(group_chat, msg.id, Request_Text(group_chat, 'no_warn') , nil , 'html') --langer
		end
		text = ''
		local i
		for k ,v in pairs(tab) do
			i = (i or 0) + 1
			text = text ..'\n•' .. getinfo(k)		.. '-' .. v
		end
		sendText(group_chat, msg.id, Request_Text(group_chat, 'warn_list'):format(text , i) , nil , 'html')
	end


	-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =

	-- = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
end


end

end
