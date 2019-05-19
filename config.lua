package.path = package.path .. ';.luarocks/share/lua/5.2/?.lua'.. ';.luarocks/share/lua/5.2/?/init.lua'
package.cpath = package.cpath .. ';.luarocks/lib/lua/5.2/?.so'
colors=require'./libs/ansicolors'
database=(loadfile"./libs/redis.lua")()
serpent=require('serpent')
tdbot=dofile('./libs/tdbot.lua')
serp=require'serpent'.block
socket=require("socket")
json=require('dkjson')
clr=require'term.colors'
http=require('socket.http')
https=require('ssl.https')
patterns = dofile('./patterns.lua')
URL=require('socket.url')
clr=require'term.colors'
utils=dofile('utils.lua')
jdate=dofile'jdate.lua'
function vardump(value)
	print(serpent.block(value ,  {comment=false}))
end

function dl_cb (arg, data) end
print(os.execute("clear"))
local data_config = io.open('configs/config.json')
if not data_config then
	print(colors("%{blackbg}%{red}>file configs/config.json not found.%{reset}\n\n"))
	os.exit()
end
local data_config = data_config:read('*all')
config = json.decode(data_config)
source_hash = config.source_hash
database:select(tonumber(config.database))
tdbot.getMe(
function(a , data)
	bot = data;
	if config.cli ~= bot.id then
		config.cli = bot.id;
		io.open('configs/config.json', 'w'):write(json.encode(config)):close();
	end
end )


locks = {
	"flood", -- 1
	"shortmsg", -- 2
	"spam", -- 4
	"mention", -- 5
	"bot", -- 6
	"links", -- 7
	"tag", -- 9
	"username", -- 10
	"forward", -- 11
	"persian", -- 12
	"english", -- 13
	"reply", -- 14
	"badword", -- 15
	"edit", -- 16
	"location", -- 18
	"caption", -- 19
	"inline", -- 20
	"emoji", -- 21
	"keyboard", -- 22
	"sticker", -- 23
	"markdown", -- 24
	"weblink", -- 25
	"game", -- 26
	"gif", -- 27
	"contact", -- 28
	"photo", -- 29
	"voice", -- 30
	"audio", -- 31
	"film", -- 32
	"file", -- 33
	"text", -- 34
	"videonote", -- 35
}
ex_locks = {
	"service", -- 1
	"autochat", -- 2
	"forceadd", -- 35
}
os.execute("clear")
launch_text = [[
%{green} ______    ____       ____       _____       ______   %{reset}
%{green}/\__  _\  /\  _`\    /\  _`\    /\  __`\    /\__  _\  %{reset}
%{green}\/_/\ \/  \ \ \/\ \  \ \ \L\ \  \ \ \/\ \   \/_/\ \/  %{reset}
%{green}   \ \ \   \ \ \ \ \  \ \  _ <'  \ \ \ \ \     \ \ \  %{reset}
%{green}    \ \ \   \ \ \_\ \  \ \ \L\ \  \ \ \_\ \     \ \ \ %{reset}
%{green}     \ \_\   \ \____/   \ \____/   \ \_____\     \ \_\%{reset}
%{green}      \/_/    \/___/     \/___/     \/_____/      \/_/%{reset}

%{cyan} ____       ____        ____       ____       ____      %{reset}
%{cyan}/\  _`\    /\  _`\     /\  _`\    /\  _`\    /\  _`\    %{reset}
%{cyan}\ \ \/\_\  \ \ \L\ \   \ \ \L\_\  \ \ \L\_\  \ \ \/\ \  %{reset}
%{cyan} \ \ \/_/_  \ \ ,  /    \ \  _\L   \ \  _\L   \ \ \ \ \ %{reset}
%{cyan}  \ \ \L\ \  \ \ \\ \    \ \ \L\ \  \ \ \L\ \  \ \ \_\ \%{reset}
%{cyan}   \ \____/   \ \_\ \_\   \ \____/   \ \____/   \ \____/%{reset}
%{cyan}    \/___/     \/_/\/ /    \/___/     \/___/     \/___/ %{reset}


]]
print(colors(launch_text))
print(colors("                 %{whitebg}%{black}Robot Has been Launched !%{reset}\n\n"))
function getParseMode(parse_mode)
	local P = {}
	if parse_mode then
		local mode = parse_mode:lower()
		if mode == 'markdown' or mode == 'md' then
			P._ = 'textParseModeMarkdown'
		elseif mode == 'html' then
			P._ = 'textParseModeHTML'
		end
	end

	return P
end
function is_sudo(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	return value
end
function is_admin(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	if database:sismember('rank:admin:'..source_hash , senderid) then
		value = true
	end
	return value
end
function is_owner(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	if database:sismember('rank:owner:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:support:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:admin:'..source_hash , senderid) then
		value = true
	end

	return value
end
function is_mod(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	if database:sismember('rank:owner:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:mod:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:support:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:admin:'..source_hash , senderid) then
		value = true
	end
	return value
end
function is_support(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	if database:sismember('rank:support:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:admin:'..source_hash , senderid) then
		value = true
	end
	return value
end
function is_allowed(gpid , senderid)
	value = false
	for k,v in pairs(config.sudo_users) do
		if senderid == v then
			value = true
		end
	end
	if database:sismember('rank:owner:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:mod:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:allow:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:support:'..source_hash..':'..gpid , senderid) then
		value = true
	end
	if database:sismember('rank:admin:'..source_hash , senderid) then
		value = true
	end
	return value
end
function getVector(str)
	local v = {}
	local i = 1

	for k in string.gmatch(str, '(%d%d%d+)') do
		v[i] = '[' .. i-1 .. ']="' .. k .. '"'
		i = i+1
	end
	v = table.concat(v, ',')
	return load('return {' .. v .. '}')()
end
function deleteMessages(chatid, messageids, revok, callback, data)
	print(colors("%{redbg}%{white}👇 MESSAGE DELETED 👇%{reset}"))
	assert (tdbot_function ({
		_ = 'deleteMessages',
		chat_id = chatid,
		message_ids = getVector(messageids),
		revoke = revok
	}, callback or dl_cb, data))
end

function autodelete(arg , data)
print(serpent.block(data, {comment=false}))
	for k ,v in pairs(database:hgetall('autodelet:'..source_hash .. data.chat_id)) do
		if tonumber(v) < os.time() - 5 then
			database:hdel('autodelet:'..source_hash .. data.chat_id , k)
			deleteMessages(data.chat_id, k)
		end
		print("K :"..k.." and V : "..v)
	end
	database:hset('autodelet:'..source_hash .. data.chat_id , data.id , data.date)
end
function sendMessage(chatid, replytomessageid, InputMessageContent, disablenotification, frombackground, replymarkup, callback, data)
	assert (tdbot_function ({
		_ = 'sendMessage',
		chat_id = chatid,
		reply_to_message_id = replytomessageid,
		disable_notification = disablenotification or 0,
		from_background = frombackground or 1,
		reply_markup = replymarkup,
		input_message_content = InputMessageContent
	}, callback or dl_cb, data))
end
function sendText(chat_id, reply_to_message_id, text, reply_markup, parsemode, entity, callback, data)
	database:setex(chat_id .. 'spam:'..source_hash , 60 , (database:get(chat_id .. 'spam:'..source_hash) or 0) + 1)
	tdbot.sendChatAction(chat_id, 'Typing')
	local input_message_content = {
		_ = 'inputMessageText',
		text = text,
		disable_web_page_preview = true,
		parse_mode = getParseMode(parsemode),
		clear_draft = false,
		entities = entity
	}
	sendMessage(chat_id, reply_to_message_id, input_message_content, false, true, reply_markup, callback, data)
end
function _rank(msg , _type)
	return true,database:sadd('rank:'.._type..':'..source_hash..':'..msg.chat_id , msg.sender_user_id)
end
function _derank(msg, _type)
	return true,database:srem('rank:'.._type..':'..source_hash..':'..msg.chat_id , msg.sender_user_id)
end
function rank(msg)
	local Var = "member"
	if is_sudo(msg.chat_id, msg.sender_user_id) then
		Var = "sudo" , 'صاحب ربات'
	elseif is_admin(msg.chat_id, msg.sender_user_id) then
		Var = "admin" , 'ادمین ربات'
	elseif 	is_support(msg.chat_id, msg.sender_user_id) then
		Var = "support" , 'پشتیبان ربات'
	elseif is_owner(msg.chat_id, msg.sender_user_id) then
		Var = "owner" , 'مدیر گروه'
	elseif is_mod(msg.chat_id, msg.sender_user_id) then
		Var = "mod" , 'ناظم گروه'
	elseif is_allowed(msg.chat_id, msg.sender_user_id) then
		Var = "allowed" , 'مجاز'
	end
	return Var
end
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = '[%d%A]'
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end
function getlang(chatid)
	return database:hget(chatid, 'lang:'..source_hash) or 'fa'
end
function Request_time(gpid)
	time_stats = io.popen("curl https://api.bot-dev.org/time/"):read("*all")
	if getlang(gpid) == "en" then
		Time = json.decode(time_stats).ENtime
	elseif getlang(gpid) == "fa" then
		Time = json.decode(time_stats).FAtime
	end
	return Time
end
function Request_date(gpid)
	time_stats = io.popen("curl https://api.bot-dev.org/time/"):read("*all")
	if getlang(gpid) == "en" then
		Date = json.decode(time_stats).ENdate
	elseif getlang(gpid) == "fa" then
		Date = json.decode(time_stats).FAdate
	end
	return Date
end
function Request_Text(chatid, Address)
	return  utils.languages[getlang(chatid)][Address] or '{#Text_vb}'
end

function SendMention(chat_id, userid, msg_id, text, ofset, mention_length)
	assert (tdbot_function ({
		_ = "sendMessage",
		chat_id = chat_id,
		reply_to_message_id = msg_id,
		disable_notification = 0,
		from_background = true,
		reply_markup = nil,
		input_message_content = {
			_ = "inputMessageText",
			text = text,
			disable_web_page_preview = 1,
			clear_draft = false,
			entities = {
				[0] = {offset =  ofset,length = mention_length,_ = "textEntity",type = {user_id = userid, _ = "textEntityTypeMentionName"}},
			}
		}
	}, dl_cb, nil))
end
function sendPhoto(chat_id, reply_to_message_id, photo, caption , cb)
	assert (tdbot_function ({
		_= "sendMessage",
		chat_id = chat_id,
		reply_to_message_id = reply_to_message_id,
		disable_notification = false,
		from_background = false,
		reply_markup = nil,
		input_message_content = {
			_ = "inputMessagePhoto",
			photo = photo,
			added_sticker_file_ids = {},
			width = 0,
			height = 0,
			caption = caption
		},
	}, cb or dl_cb, nil))
end
function getinfo(user_id)
	tdbot.getUser(tonumber(user_id) , function(a , data)
		if data.username and data.username ~= "" then
			database:hset('username:chash:'..source_hash , user_id , data.username)
		elseif data.first_name then
			database:hset('name:chash:'..source_hash , user_id , data.first_name)
			database:hdel('username:chash:'..source_hash , user_id)
		end
	end)
	if database:hget('username:chash:'..source_hash , user_id) then
		return ('@%s [ <code>%d</code> ]'):format(database:hget('username:chash:'..source_hash , user_id):gsub('^%a' , string.upper) , user_id)
	elseif database:hget('name:chash:'..source_hash , user_id) then
		return ('%s [ <code>%d</code> ]'):format(database:hget('name:chash:'..source_hash , user_id):gsub('^%a' , string.upper) , user_id)
	else
		return '[ <code>' ..  user_id .. '</code> ]'
	end
end
function get_title(gpid)
	tdbot.getChat(gpid , function(a , data)
		--print(serpent.block(data,{comment=false}))
		if data.title then
			database:hset('gptitile:chash:'..source_hash , gpid , data.title)
		end
	end)
	if database:hget('gptitile:chash:'..source_hash , gpid) then
		return database:hget('gptitile:chash:'..source_hash , gpid)
	else
		return gpid
	end
end

function doLockMedias(chat_id , usersid, msgid, matches, mode_lock)
	for k,v in pairs(locks) do
		if utils.trlocks_to_en(matches) == v or matches == v then
			function Do_DeleteExceptions(extra, result)
				text = string.gsub(Request_Text(chat_id, 'locks_'..mode_lock), '{username}', result.username)
				text = string.gsub(text, '{userid}', usersid)
				if getlang(chat_id) == "fa" then
					text = string.gsub(text, '{option}', utils.trlocks_to_fa(matches))
				else
					text = string.gsub(text, '{option}', v)
				end
				sendText(chat_id, msgid, text, nil, "html" , {} ,dl_cb, nil)
				if mode_lock == "restrict" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'restrict')
				elseif mode_lock == "ban" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'ban')
				elseif mode_lock == "warn" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'warn')
				elseif mode_lock == "kick" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'kick')
				elseif mode_lock == "mute" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'mute')
				elseif mode_lock == "delete" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'delete')
				else
					database:hdel(chat_id , 'lock_'..v..':'..source_hash)
				end
			end
			tdbot.getUser(usersid, Do_DeleteExceptions, nil)
			break
		end
	end
end
function doActiveMedias(chat_id , usersid, msgid, matches, mode_lock)
	for k,v in pairs(ex_locks) do
		if utils.trexlocks_to_en(matches) == v then
			function Do_DeleteExceptions(extra, result)
				sendText(chat_id, msgid, Request_Text(chat_id, 'locks_'..mode_lock):format(matches,getinfo(userid)), nil, "html" , {} ,dl_cb, nil)
				if mode_lock == "active" then
					database:hset(chat_id , 'lock_'..v..':'..source_hash, 'active')
				elseif mode_lock == "deactive" then
					database:hdel(chat_id , 'lock_'..v..':'..source_hash)
				end
			end
			tdbot.getUser(usersid, Do_DeleteExceptions, nil)
			break
		end
	end
end
function get_chat_link(group_chat)

	
end
function NumChange(number)
	number = number:gsub("۱", "1")
	number = number:gsub("۲", "2")
	number = number:gsub("۳", "3")
	number = number:gsub("۴", "4")
	number = number:gsub("۵", "5")
	number = number:gsub("۶", "6")
	number = number:gsub("۷", "7")
	number = number:gsub("۸", "8")
	number = number:gsub("۹", "9")
	number = number:gsub("۰", "0")
	return number
end 
function setAlarm(sec, callback, data)
  assert (tdbot_function ({
    _ = 'setAlarm',
    seconds = sec
  }, callback or dl_cb, data))
end
function input_match(msg , _function)
	local input_text = (msg.content.text or ''):lower()
	local group_chat = msg.chat_id
	local sender_id = msg.sender_user_id
	if input_text:match('@(.*)') then
		tdbot.searchPublicChat(input_text:match('@(.*)') , function(a , data)
			if not data.id then;return;end;_function(data.id , group_chat , sender_id);end)
		elseif next(msg.content.entities) then
			for k , v in pairs(msg.content.entities) do
				if v.type and v.type.user_id then
					_function(v.type.user_id ,  group_chat , sender_id)
				end
			end
		elseif msg.reply_to_message_id ~= 0 then
			tdbot.getMessage(group_chat ,  msg.reply_to_message_id , function(a , data)
				_function(data.sender_user_id  ,  group_chat , sender_id)
			end)
		elseif input_text:match('(%d+)') then
			tdbot.getUser(input_text:match('(%d+)') , function(a , data)
				if not data.id then;return ;end
				_function(data.id , group_chat , sender_id)
			end)
		end
	end
	function input_date(input_text)
		local days = tonumber(input_text:match'(%d+)day' or input_text:match'(%d+)روز')
		local hour = tonumber(input_text:match'(%d+)hour' or input_text:match'(%d+)ساعت')
		local min =  tonumber(input_text:match'(%d+)min' or input_text:match'(%d+)دقیقه')
		if not hour or (hour > 24 or hour < 0) then
			hour = 0
		end
		if not days or (days > 30 or days < 0) then
			days = 0
		end
		if not min or (min > 60 or min < 0) then
			min = 0
		end
		if not (days or hour or min) or  ((days or 0) + (hour or 0) + (min or 0)) == 0  then
			return false,false,false,false
		end
		return days,hour,min,(((days or 0) * 86400) + ((hour or 0) * 3600 ) + ((min or 0) * 60))
	end
	function welcome(group_chat , text)
		database:hset(group_chat , 'welcome:'..source_hash , text)
		database:hset(group_chat , '_welcome:'..source_hash , true)
		sendText(group_chat, 0, Request_Text(group_chat, 'setwelcome') , nil, "html" , {} ,dl_cb, nil)
	end
	function is_active(msg)
		return database:hget('active:group:'..source_hash , msg.chat_id) or false
	end
	function chash_title(id)
		return (database:hget('chash:title:'..source_hash , id) or '') .. '<code>['..id..']</code>'
	end
	function export_unix(bv, lang)
		local _text = ''
		if lang == "fa" then
			if bv:unix_year() ~= 0 then
				_text = _text .. bv:unix_year() ..' سال '
			end
			if bv:unix_month() ~= 0 then
				_text = _text .. bv:unix_month() ..' ماه '
			end
			if bv:unix_day() ~= 0 then
				_text = _text .. bv:unix_day() ..' روز '
			end
			if bv:unix_hour() ~= 0 and bv:unix_hour() ~= 24 then
				_text = _text .. bv:unix_hour() ..' ساعت '
			end
			if bv:unix_min() ~= 0 and bv:unix_min() ~= 60 then
				_text = _text .. bv:unix_min() ..' دقیقه '
			end
		elseif lang == "en" then
			if bv:unix_year() ~= 0 then
				_text = _text .. bv:unix_year() ..' Year '
			end
			if bv:unix_month() ~= 0 then
				_text = _text .. bv:unix_month() ..' Month '
			end
			if bv:unix_day() ~= 0 then
				_text = _text .. bv:unix_day() ..' Day '
			end
			if bv:unix_hour() ~= 0 and bv:unix_hour() ~= 24 then
				_text = _text .. bv:unix_hour() ..' Hour '
			end
			if bv:unix_min() ~= 0 and bv:unix_min() ~= 60 then
				_text = _text .. bv:unix_min() ..' Minute '
			end
		end
		return _text
	end
	Badwords = {
		"کیر",
		"کون",
		"کص ننت",
		"کص",
		"حرومزاده",
		"fuck",
		"bitch",
		"shit",
		"kir",
		"kos",
		"ks nnt",
		"kose nanat",
		"kirm",
		"kiram",
		"jnde",
		"jende",
		"hrumi",
		"harumi",
		"kharkosde",
		"zena",
		"tokhm",
		"تخم",
		"gaedam",
		"gayidam",
		"gaeedam",
		"nagayidm",
		"nagayidam",
		"gayesh",
		"نگاییدم",
		"گایید",
		"اوبی",
		"obi",
		"dudul",
		"دودول",
		"dul",
		"dool",
		"دول",
		"شومبول",
		"کونی",
		"کون",
		"koon",
		"kun",
		"fucker"
	}
	function SendForceaddTxt(group_chat, sender_id, msg_id, mdd)
		if mdd == 'first' then
			if not database:hget(group_chat , 'forceadd:'..source_hash) then 
				database:hset(group_chat , 'forceadd:'..source_hash, 3)
			end
			database:setnx(group_chat..":"..source_hash..':user:invited'..sender_id, 0)
			text = Request_Text(group_chat ,'n_done_inviting'):format(getinfo(sender_id), tonumber(database:hget(group_chat , 'forceadd:'..source_hash)) - tonumber(database:get(group_chat..":"..source_hash..':user:invited'..sender_id)))
			sendText(group_chat, 0, text, nil, "html" , nil , autodelete)
		elseif mdd == 'second' then
			text = Request_Text(group_chat ,'done_inviting'):format(getinfo(sender_id), database:get(group_chat..":"..source_hash..':user:invited'..sender_id))
			sendText(group_chat, 0, text, nil, "html" , nil , autodelete)
		end
	end
	function lock(msg , _type)
		local mode = database:hget(msg.chat_id , 'lock_'.._type..':'..source_hash)
		if mode == 'delete' then
			deleteMessages(msg.chat_id, msg.id)
		elseif mode == 'restrict' then
			deleteMessages(msg.chat_id, msg.id)
			local unix = database:hget(msg.chat_id , 'restrict_unix:'..source_hash)
			if not unix then
				unix = 0
			else
				unix = unix + os.time()
			end
			tdbot.changeChatMemberStatus(msg.chat_id, msg.sender_user_id, 'Restricted', {1,unix,0,0,0,0})
			sendText(msg.chat_id, 0, Request_Text(msg.chat_id, 'restricted'):format(getinfo(msg.sender_user_id) , _type), nil, "html" , nil , autodelete)
		elseif mode == 'warn' then
			deleteMessages(msg.chat_id, msg.id)
			local number = database:hincrby('warn:'..source_hash..msg.chat_id , msg.sender_user_id , 1)
			local max_warn = database:hget(msg.chat_id , 'warn_max:'..source_hash) or 10
			if tonumber(number) >= tonumber(max_warn) then
				database:hdel('warn:'..source_hash..msg.chat_id , msg.sender_user_id)
				text = Request_Text(msg.chat_id, 'warn_remove'):format(getinfo(msg.sender_user_id) ,number , max_warn)
				tdbot.changeChatMemberStatus(msg.chat_id, msg.sender_user_id, 'Banned', {0}, dl_cb, nil)
				database:incr(msg.chat_id..source_hash..':kicked:times:'..msg.sender_user_id)
			else
				text = Request_Text(msg.chat_id, 'warn'):format(getinfo(msg.sender_user_id) ,_type , number , max_warn)
			end
			if not database:hget(msg.chat_id , 'warn_mute:'..source_hash) then
				sendText(msg.chat_id, 0, text, nil, "html" , nil , autodelete)
			end
		elseif mode == 'kick' then
			deleteMessages(msg.chat_id, msg.id)
			tdbot.changeChatMemberStatus(msg.chat_id, msg.sender_user_id, 'Left', {0}, dl_cb, nil)
			sendText(msg.chat_id, 0, Request_Text(msg.chat_id, 'kick'):format(getinfo(msg.sender_user_id) , _type), nil, "html" , nil , autodelete)
		elseif mode == 'ban' then
			deleteMessages(msg.chat_id, msg.id)
			tdbot.changeChatMemberStatus(msg.chat_id, msg.sender_user_id, 'Banned', {0}, dl_cb, nil)
			database:incr(msg.chat_id..source_hash..':kicked:times:'..msg.sender_user_id)
			sendText(msg.chat_id, 0, Request_Text(msg.chat_id, 'ban'):format(getinfo(msg.sender_user_id) , _type), nil, "html" , nil , autodelete)
		end
	end
