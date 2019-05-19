#copy right 2017 behrad

od = os.date
tm = tonumber
jdate = {}

g_d_m_i = {0,31,59,90,120,151,181,212,243,273,304,334}
g_d_m_i_i = {[31]='',[59]='',[90]='',[120]='',[151]='',[181]='',[212]='',[243]='',[273]='',[304]='',[334]='',}
j_d_m = {31 , 31 , 31 ,31 ,31 ,31 ,30 ,30 ,30 ,30 , 29}
g_d_m = {0,
31 , 28 ,31 ,
30 ,31 ,30 ,
31 ,31 ,30 ,
31 , 30 , 31}
day_of_weak = {'شنبه','یکشنبه', 'دوشنبه', 'سه شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه' }
qarn = {[12] = 'هزار دویست ',[13] = 'هزار سیصد ',[14] = 'هزار چهار صد ',[15] = 'هزار پانصد ',[16] = 'هزار شصدو ',[17] = 'هزار هفصد ',[18] = 'هزار هشتصد ',[19] = 'هزار نهصد ',[20] = 'دوهزارو ',[21] = 'دو هزارو صد ',}
one_ta_20 = {[0] = '','یک','دو','سه','چهار','پنچ','شیش','هفت','هشت','نه','ده','یازده','دوازده','سیزده','چهارده','پانزده','شانزده','هیفتده','هیشتده','نوزده','بیست',}
ten_gan = {'ده','بیست','سی','چهل','پنجاه','شصت','هفتاد','هشتاد','نود',}
sad_gan = {'صد','دویست','سیصد','چهارصد','پانصد','شصد','هفصد','هشتصد','نهصد',}
fasls = {'بهار','تابستان','پاییز','زمستان'}
ir_month = {
'فروردین',
'اردیبهشت',
'خرداد',
'تیر',
'مرداد',
'شهریور',
'مهر', -- شروع مدرسه ها :(
'ابان',
'اذر',
'دی',
'بهمن',
'اسفند'
}

setmetatable(jdate , {
	  __call = function (cls, ...)
		return cls.new(...)
	  end,
  })
  
function jdate_def()
	local gy , gm , gd = tm (od '%Y'),tm (od '%m'),tm (od '%d')			
	local jy ,jm ,jd = 0 , 0 , 0
	if gy<=1600 then
		jy = 0
		gy = gy - 621
	else
		jy = 979
		gy = gy - 1600
	end
		local gy2 = 0
	if gm > 2 then
		gy2 = gy + 1
	else
		gy2 = gy
	end
	local days = gy * 365 + math.floor((gy2 + 3)/4) - math.floor((gy2+99)/100) + math.floor((gy2+399)/400) - 80 + gd + g_d_m_i[gm]
	jy = jy + 33 * math.floor(days/12053)
	days = days % 12053
	jy = jy + math.floor(days/1461) * 4 
	days = days % 1461
	jy = jy + math.floor((days-1)/365)
	if days > 365 then
		days = (days-1) % 365
	end
	if days < 186 then
		jm = 1 + math.floor(days/31)
		jd = 1 + days%31
	else
		jm = 7 + math.floor((days-186)/30)
		jd = 1 + (days-186)%30
	end
	return {
	jy ,jm ,jd
	}
end

function jdate:month_to_word(jm) 
	if jm < 0 or jm > 12 then
		return
	end
		return ir_month[jm]
end


local function _word_date()
	data = jdate_def()
		return jdate:year_to_word(data[1]) .. ', ' .. jdate:number_to_word(data[3]) .. ' , ' .. jdate:month_to_word (data[2])
end

function jdate:new()
	local tb = {
	get_unix = (function()
				return os.time{	
				year=od '%Y',
				month=od '%m',
				day=od '%d',
				hour=od ('%H'),
				min=od ('%M'),
				sec=od ('%S')
				}
				end),
	jdate = jdate_def,
	word_date = _word_date,
	}
	return tb
	end

function jdate:miladi_to_shamsi(gy ,gm ,gd)
local jy ,jm ,jd = 0
if gy<=1600 then
jy = 0
gy = gy - 621
else
jy = 979
gy = gy - 1600
end
local gy2 = 0
if gm > 2 then
gy2 = gy + 1
else
gy2 = gy
end
local days = gy * 365 + math.floor((gy2 + 3)/4) - math.floor((gy2+99)/100) + math.floor((gy2+399)/400) - 80 + gd + g_d_m_i[gm]
jy = jy + 33 * math.floor(days/12053)
days = days % 12053
jy = jy + math.floor(days/1461) * 4 
days = days % 1461
jy = jy + math.floor((days-1)/365)
if days > 365 then
days = (days-1) % 365
end
if days < 186 then
jm = 1 + math.floor(days/31)
jd = 1 + days%31
else
jm = 7 + math.floor((days-186)/30)
jd = 1 + (days-186)%30
end
return {
jy ,jm ,jd
}
end
function jdate:shamsi_to_miladi(jy ,jm ,jd)
	local gy ,gm ,gd = 0 , 0 ,0
		if (jm <=10) and not ( jm == 10 and jd >= 11) then
			gy = jy + 621
		else
			gy = jy + 622
		end
		days = 0
		for i=1 ,jm do
			if i == jm then
				days = days + jd
			else
				days = days + j_d_m[i]
			end
		end
		days = days + 79
			a = 1
			while days > g_d_m[a] do
			a = a + 1
				days = days - g_d_m[a]
			end
			return {gy , a  , days}
	end
	
function jdate:year_to_word(year)
		if not tonumber(year) then
			return
		elseif year > 2100 or year < 1200 then
			return
		end

		y = tostring(year)
		for i , v in pairs(qarn) do 
			if y:match('^' .. i) then
				year_text = v
				number = year - (i * 100)
			end
		end
		if number == 0 then 
			return year_text
		else
			if one_ta_20[number] then
				return year_text .. one_ta_20[number]
			end
			local matches = {tostring(number):match('(%d)(%d)')}
				return year_text .. ten_gan[tonumber(matches[1])] .. ' ' .. one_ta_20[tonumber(matches[2])]
		end
end

function jdate:number_to_word(jm)
jm = math.floor(tonumber(jm))
	if jm < 0 or jm > 999 then
		return 
	end
			if jm == 0 then
				return 'صفر'
			end
			if one_ta_20[jm] then
			return one_ta_20[jm]
			elseif tostring(jm):match('%d%d') then
				return ten_gan[tonumber(tostring(jm):match('^(%d)'))]..'  '..one_ta_20[tonumber(tostring(jm):match('(%d)$'))]
			elseif tostring(jm):match('^(%d)(%d)(%d)$') then
			local matches = {tostring(jm):match('^(%d)(%d)(%d)$')}
			return sad_gan[tonumber(matches[1])] ..' ' .. ten_gan[tonumber(matches[2])]..' '..one_ta_20[tonumber(matches[3])]
	end
end

function jdate:unix_to_date(unix_time)
	return os.date("*t", unix_time)
end

function jdate:unix(unix_time)

unix_time = unix_time;
	return {
		__call = function (cls, ...)
		return cls.new(...)
		end,
		unix_year = (function()
			return math.floor((unix_time/31556926))
		end),	
		unix_min = (function()
				cm = (unix_time/60)
				while cm > 60 do
					cm = cm - 60
				end
				cm = math.floor (cm)
				return cm
		end),
		unix_hour = (function()
				cm = math.floor ( (unix_time/3600) )
				while cm > 24 do
					cm = cm - 24
				end
				cm = math.floor (cm)
				return cm
		end),
		unix_day = (function()
			cm = (unix_time/86400)
			while cm >= 365.24 do
				cm = cm - 365.24
			end
			d_y = math.floor(cm) 
			p = 0
			for k , v in pairs(g_d_m_i) do
				if p <= d_y and d_y <= v then
					m_d = d_y - p
					return m_d
				end
				p = v
			end
			return 0
		end),
		unix_month = (function()
				cm = (unix_time/2629743)
				while cm >= 12 do
					cm = math.ceil(cm) - 12
				end
				return math.floor(cm)
		end),
		unix_week_of_year = (function()
				cm = (unix_time/86400)
				while cm >= 365.24 do
					cm = cm - 365.24
				end
				return  math.ceil(cm / 7) 
		end),
		unix_day_of_year = (function()
				cm = (unix_time/86400)
				while cm >= 365.24 do
					cm = cm - 365.24
				end
				return  math.floor(cm) 
		end),
	}

end

return jdate

