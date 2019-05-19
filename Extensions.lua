local M = {}
--[[ 

################# You Can Add Your Personal Codes In This File !  #################


---------------------------------------------------------------------------------
|   |   |  Request_text(chat_id, text_patter) |   |   |

if you want to use Request_text(chat_id, text_patter) command , you have to use the command name in utils.lua file ! Ex : 
`````
	languages = {
		en = { 
			hi = "Hello boy"
		}
	}
	print(Request_text(chat_id, "hi"))
`````
will resutl ----> Hello boy
---------------------------------------------------------------------------------
|   |   |  Request_time(chat_id)  |   |   |
you can request time infromation suitable by groups language ! Ex :
`````
	languages = {
		en = { 
			charge_unlimit = "Group Charged Unlimited ! charge time is : %s"
		}
	}
	Request_Text(group_chat, 'charge_unlimit'):format(Request_time(group_chat))
`````
will return ----> Group Charged Unlimited ! charge time is : 04:36:01
---------------------------------------------------------------------------------
|   |   |  Request_date(chat_id)  |   |   |
you can request date infromation suitable by groups language ! Ex :
`````
	languages = {
		en = { 
			charge_unlimit = "Group Charged Unlimited ! charge date is : %s"
		}
	}
	Request_Text(group_chat, 'charge_unlimit'):format(Request_date(group_chat))
`````
will return ----> Group Charged Unlimited ! charge date is : Friday 25 May 2018
]]
function run(data)
	local msg = data.message
	local input_text = (msg.content.text or ''):lower():gsub('^[!#/]' , '')
	local group_chat = msg.chat_id
	local sender_id = msg.sender_user_id
		if input_text:match("^test") then 
			sendText(group_chat, 0, 'HI', nil, "html" , nil)
			print("IS ALRIGHT")
			setAlarm(5, function(ext, res)
				print(serpent.block(res, {comment=false}))
				sendText(group_chat, 0, 'HI 2', nil, "html" , nil)
			end)
			tdbot.exportChatInviteLink(group_chat,
				function(arg,res)
					print(serpent.block(res,{comment=false}))
			end)
		end
end
M.run = run 
return M 
