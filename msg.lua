
function msg_rvc(data)
	local msg = data
	local input_text = (msg.content.text or ''):lower()
	local group_chat = msg.chat_id
	local sender_id = msg.sender_user_id
	if msg.content._ then
		msg.type = msg.content._:lower()
	end
	if not database:sismember("bot:groups:count", group_chat) then 
		database:sadd("bot:groups:count", group_chat)
	end 
	if not database:sismember("bot:users:count", sender_id) then 
		database:sadd("bot:users:count", sender_id)
	end 
	
	if database:hget('active:group:'..source_hash , group_chat) then --- chek group is installed to bot or not
	
	
	if not database:get('work:'..source_hash..group_chat) and tostring(group_chat):isgroup() then 
		if not database:get("Told:Expire:"..source_hash..group_chat) then
			database:set("Told:Expire:"..source_hash..group_chat, true)
			database:expire("Told:Expire:"..source_hash..group_chat, 86400)
			sendText(group_chat, 0, Request_Text(group_chat, 'expire_end'):format(getinfo(sender_id), get_title(group_chat)), nil, 'html')
		end	
		if not is_sudo(group_chat, sender_id) and not is_admin(group_chat, sender_id) then 
			return
		end
	end
	database:incrby(group_chat..':gp:msgs:'..source_hash , 1)
	database:incrby(group_chat..':usermsgs:'..source_hash..sender_id , 1)
	if sender_id == bot.id or is_sudo(group_chat , sender_id) or is_admin(group_chat , sender_id) or is_support(group_chat , sender_id) or is_owner(group_chat , sender_id) or is_mod(group_chat , sender_id) or is_allowed(group_chat , sender_id) then
		return
	end
	if database:hget(group_chat , 'mute_all:'..source_hash) then
		deleteMessages(group_chat, msg.id)
	end
	if database:sismember("mute_users:"..source_hash..":"..group_chat, sender_id) then
		print("Muted User")
		deleteMessages(group_chat, msg.id)
	end
	if database:hget(group_chat, 'lock_forceadd:'..source_hash) then
		if database:sismember(group_chat..":"..source_hash..":done:invite:", sender_id) then
			-- nothing
		else
			if msg.type ~= "messagechataddmembers" then
				deleteMessages(group_chat, msg.id)
				SendForceaddTxt(group_chat, sender_id, msg.id, 'first')
			end
		end
	end
	if database:hget(group_chat , 'lock_flood:'..source_hash) then
		msg_max = tonumber(database:get('floodnum:'..source_hash..group_chat)) or 7
		time_check = tonumber(database:get('floodtime:'..source_hash..group_chat)) or 10
		msgs = tonumber(database:get('flood:'..sender_id..':'..group_chat..':msg-num')) or 0
		database:setex('flood:'..sender_id..':'..group_chat..':msg-num', time_check, msgs+1)
		if tonumber(msgs) > msg_max then
			lock(msg , 'flood')
		end
	end


	if msg.forward_info then
		lock(msg , 'forward')
	end

	if msg.type == 'messagevoice' then
		lock(msg , 'voice')
	elseif msg.type == "messagephoto" then
		lock(msg , 'photo')
	elseif msg.type == "messagesticker" then
		lock(msg , 'sticker')
	elseif msg.type == "messageaudio" then
		lock(msg , 'audio')
	elseif msg.type == "messagedocument" then
		lock(msg , 'document')
	elseif msg.type == "messagevideonote" then
		lock(msg , 'videonote')
	elseif msg.type == "messagevideo" then
		lock(msg , 'video')
	elseif msg.type == "messageanimation" then
		lock(msg , 'gif')
	elseif msg.type == "messagelocation" then
		lock(msg , 'location')
	end
	if input_text:match('t.me') or input_text:match('telegram.me') then
		lock(msg , 'links')
	end
	if input_text:match('#')  then
		lock(msg , 'tag')
	end
	if input_text:match('@')  then
		lock(msg , 'username')
	end
	ICT = msg.content.text or msg.content.caption
	if ICT ~= nil then
		FilterAction = database:hget('filters:' .. group_chat .. source_hash , ICT)
		if FilterAction ~= (nil or false) then 
			if FilterAction == "ban" then 
				deleteMessages(group_chat, msg.id)
				tdbot.changeChatMemberStatus(group_chat, msg.sender_user_id, 'Banned', {0}, dl_cb, nil)
				database:incr(group_chat..source_hash..':kicked:times:'..msg.sender_user_id)
				sendText(group_chat, 0, Request_Text(group_chat, 'ban_filter'):format(getinfo(msg.sender_user_id)), nil, "html" , nil , autodelete)
			elseif FilterAction == "kick" then 
				deleteMessages(group_chat, msg.id)
				tdbot.changeChatMemberStatus(group_chat, msg.sender_user_id, 'Left', {0}, dl_cb, nil)
				sendText(group_chat, 0, Request_Text(group_chat, 'kick_filter'):format(getinfo(msg.sender_user_id)), nil, "html" , nil , autodelete)
			elseif FilterAction == "warn" then
				deleteMessages(group_chat, msg.id)
				local number = database:hincrby('warn:'..source_hash..group_chat , msg.sender_user_id , 1)
				local max_warn = database:hget(group_chat , 'warn_max:'..source_hash) or 10
				if tonumber(number) >= tonumber(max_warn) then
					database:hdel('warn:'..source_hash..group_chat , msg.sender_user_id)
					text = Request_Text(group_chat, 'warn_remove'):format(getinfo(msg.sender_user_id) ,number , max_warn)
					tdbot.changeChatMemberStatus(group_chat, msg.sender_user_id, 'Banned', {0}, dl_cb, nil)
					database:incr(group_chat..source_hash..':kicked:times:'..msg.sender_user_id)
				else
					text = Request_Text(group_chat, 'warn_filter'):format(getinfo(msg.sender_user_id) , number , max_warn)
				end
				sendText(group_chat, 0, text, nil, "html" , nil , autodelete)
			elseif FilterAction == "delete" then 
				deleteMessages(group_chat, msg.id)
			elseif FilterAction == 'restrict' then 
				deleteMessages(group_chat, msg.id)
				local unix = database:hget(group_chat , 'restrict_unix:'..source_hash)
				if not unix then
					unix = 0
				else
					unix = unix + os.time()
				end
				tdbot.changeChatMemberStatus(group_chat, msg.sender_user_id, 'Restricted', {1,unix,0,0,0,0})
				sendText(group_chat, 0, Request_Text(group_chat, 'restricted_filter'):format(getinfo(msg.sender_user_id) ), nil, "html" , nil , autodelete)
			end
		end 
	end
	if database:hget(group_chat , 'lock_badword:'..source_hash) then
		for k,v in pairs(Badwords) do
			if input_text:find(v) then
				lock(msg, "badword")
				break;
			end
		end
	end
	if msg.type ==  "messagechatdeletemember" then
		if database:hget(group_chat, 'lock_service:'..source_hash) then
			deleteMessages(group_chat, msg.id)
		end
	end
	if msg.type == "messagechatjoinbylink" then
		if database:hget(group_chat, 'lock_service:'..source_hash) then
			deleteMessages(group_chat, msg.id)
		end
	end
	if msg.type == "messagechataddmembers" then
		for k , v in pairs(msg.content.member_user_ids) do -- Start {for} loop
			tdbot.getUser(v , function(a , data)
				if data.type._ == "userTypeBot"  then
					if database:hget(group_chat, 'lock_bot:'..source_hash)  then
						if sender_id == bot.id or is_sudo(group_chat , sender_id) or is_admin(group_chat , sender_id) or is_support(group_chat , sender_id) or is_owner(group_chat , sender_id) or is_mod(group_chat , sender_id) or is_allowed(group_chat , sender_id) then
							return
						end
						lock(msg , 'bots')
						tdbot.changeChatMemberStatus(group_chat, data.id, 'Banned', {0}, dl_cb, nil)
						database:incr(group_chat..":"..source_hash..':kicked:times:'..data.id)
					end
				else
					database:hset(group_chat, data.id..'invited:by:'..source_hash, sender_id)
					database:incr(group_chat..":"..source_hash..':user:invited'..sender_id)
					if database:hget(group_chat , 'forceadd:'..source_hash) then
						if tonumber(database:get(group_chat..":"..source_hash..':user:invited'..sender_id)) >= tonumber(database:hget(group_chat , 'forceadd:'..source_hash)) then
							if not database:sismember(group_chat..":"..source_hash..":done:invite:", sender_id) then
								database:sadd(group_chat..":"..source_hash..":done:invite:", sender_id)
								SendForceaddTxt(group_chat, sender_id, msg.id ,'second')
							end
						else
							SendForceaddTxt(group_chat, sender_id, msg.id ,'first')
						end
					end
				end
			end)
		end -- end {FOR} loop
		if database:hget(group_chat, 'lock_service:'..source_hash) then
			deleteMessages(group_chat, msg.id)
		end
	end
	
	end--- end for check group is from bot groups or not
	
	
	if msg.type ~= 'messagetext' then
		
		function getCH(Extra, Result)
			function StartShell(ex, res)
				print(colors("Chat Name : %{cyan}"..(Result.title or '').."%{reset} | %{red}"..(group_chat or '').."%{reset} %{blue}"..os.date().."%{reset} %{yellow}>>>%{reset} %{green}"..(res.first_name or '').." "..(res.last_name or '').."%{reset}%{red}"..(msg.sender_user_id or '').."%{reset} :   %{bright}"..msg.type.."%{reset}\n"))
			end
			tdbot.getUser(sender_id, StartShell, nil)
		end
		tdbot.getChat(group_chat, getCH, nil)

		
	end
end
