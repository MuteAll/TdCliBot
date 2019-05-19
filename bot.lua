dofile('./config.lua')
dofile('./msg.lua')
dofile('./base.lua')
Extensions = dofile('./Extensions.lua')
patterns = dofile('./patterns.lua')
function string:isgroup()
	return self:match('-100(%d+)') or false
end
function PreProccess(data)
	if (data._ == "updateNewMessage") then
		local msg = data.message
		local input_text = (msg.content.text or ''):lower():gsub('^[!#/]' , '')
		local group_chat = msg.chat_id
		local sender_id = msg.sender_user_id
		local pid , text , plang = patterns.GetID(input_text)
		if sender_id == 777000 then 
			tdbot.forwardMessages(config.sudo_users[0], fromchatid, msg.id, 0, nil, dl_cb)
		end 
		function getCH(Extra, Result)
			function StartShell(ex, res)
				if tostring(group_chat):isgroup() then
					if not database:hget('chash:title:'..source_hash , group_chat) then 
						database:hset('chash:title:'..source_hash , group_chat , Result.title)
					end
					if database:hget('active:group:'..source_hash , group_chat) then --- chek group is installed to bot or not
						if not database:get('work:'..source_hash..group_chat) then
							print(colors("%{red}%{whitebg}GROUP EXPIRE END%{reset}"))
						end
					end
				end
				print(colors("Chat Name : %{cyan}"..(Result.title or '').."%{reset} | %{red}"..(group_chat or '').."%{reset} %{blue}"..os.date().."%{reset} %{yellow}>>>%{reset} %{green}"..(res.first_name or '').." "..(res.last_name or '').."%{reset}%{red}"..(msg.sender_user_id or '').."%{reset} :   %{bright}"..input_text.."%{reset}\n"))
			end
			tdbot.getUser(sender_id, StartShell, nil)
		end
		tdbot.getChat(group_chat, getCH, nil)
		Extensions.run(data)
		msg_rvc (msg)
		if pid and text and plang then
			use_update(data , pid, text, plang)
		end
		--[[elseif (data._ == "updateMessageEdited") then
		local msg = data
		local group_chat = msg.chat_id
		local sender_id = msg.sender_user_id
		function DoEditCallback(agent24h, msg)
		tdbot_update_callback (msg)
	end
	tdbot.getMessage(group_chat, data.message_id, DoEditCallback, nil)]]
	end
end
function tdbot_update_callback(data)
	local ok , result =  xpcall(PreProccess , debug.traceback , data)
	if not ok then --if a bug happens
		print(result)
		sendText(328977214, 0, result, nil, "html" , nil , autodelete)
		sendText(data.message.chat_id, 0, '🐞 اختلال در سیستم لطفا بعدا تلاش کنید', nil, "html" , nil , autodelete)
	end
end
