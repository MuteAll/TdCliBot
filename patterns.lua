local M = {}
Pattr = {
	en = {
		["956254585"] = "^ping$",
		["475641716"] = "^setlang (.*)",
		["624279613"] = "^edit (.*)",
		["162886781"] = "^stats",
		["276212643"] = "^reload$",
		["468856892"] = "^vardump$",
		["643281463"] = "^groups list$",
		["159436379"] = "^grouppic (.*)", 
		["591154139"] = "^uninstall$", 
		["449858743"] = "^leave group$",
		["414168186"] = "^groupinfo (.*)", 
		["867159132"] = "^config bot$",
		["591941829"] = "^setexpire",
		["913232689"] = "^expire stats$",
		["664956534"] = "^install$",
		["265674748"] = "^panel$",
		["467133497"] = '^restrict option$',
		["777722379"] = "^setrestrict (.*)",
		["518515975"] = "^filter list",
		["595486252"] = "^clean filters",
		["646658211"] = "^filter (%w+) (.*)",
		["123474258"] = "^unfilter (.*)",
		["413862159"] = "^/delete_(.*)",
		["634914543"] = "^#delete (.*)",
		["649262321"] = "^/ban_(.*)",
		["785564618"] = "^#ban (.*)",
		["485947648"] = "^/kick_(.*)",
		["817438836"] = "^#kick (.*)",
		["637471762"] = "^/restrict_(.*)",
		["324393367"] = "^#restrict (.*)",
		["467115738"] = "^/warn_(.*)",
		["873541417"] = "^#warn (.*)",
		["277787632"] = "^/open_(.*)",
		["379528645"] = "^#open (.*)",
		["616716237"] = "^/active_(.*)",
		["979598677"] = "^#active_(.*)",
		["465576464"] = "^/deactive_(.*)",
		["711914144"] = "^#deactive (.*)",
		--["397476697"] = "^warnoption", 
		["666265416"] = "^setwarn",
		--["229521145"] = "^warnexpire",
		["253828899"] = "^warnmode (.*)",
		["527559716"] = "^clean warns",
		--["597426517"] = "^warnlog (.*)",
		["475884228"] = "^silentfrom (%d+):(%d+) until (%d+):(%d+)",
		["972886228"] = "^settings$",
		["752481564"] = "^mute all",
		["539376278"] = "^unmute all",
		["866282173"] = "^id",
		["321188225"] = "^warn",
		["734365625"] = "^unwarn",
		["979242959"] = "^nowarn",
		["932676451"] = "^mute",
		["766782689"] = "^silent",
		["671793632"] = "^unmute",
		["458547564"] = "^ban",
		["171685754"] = "^unban",
		["854962427"] = "^banall",
		["961316288"] = "^unbanall",
		["678127621"] = "^allow",
		["146353318"] = "^disallow",
		["238987648"] = "^kick",
		["383359115"] = "^promote",
		["413932291"] = "^demote",
		["114944985"] = "^owners",
		["874315943"] = "^modlist",
		["637949196"] = "^setowner",
		["653441821"] = "^(owner [+])	",
		["461226567"] = "^remowner",
		["474862984"] = "^(owner [-])",
		["349779449"] = "^settitle (.*)",
		["237945192"] = "^pin$",
		["564711114"] = "^repin$",
		["372417727"] = "^unpin$",
		["665151959"] = "^showpin$",
		["757744182"] = "^setwelcome (.*)",
		["138235145"] = "^getwelcome",
		["674489691"] = "^delwelcome",
		["684331641"] = "^welcome (.*)",
		["158947688"] = "^link$",
		["661856668"] = "^setforceadd (%d+)",
		["741343748"] = "^about admins$",
		["276925989"] = "^delall",
		["298989626"] = "^del$",
		["337827518"] = "^clean all",
		["823657279"] = "^bots list",
		["167213786"] = "^bans list",
		["483632931"] = "^clean bots",
		["721146444"] = "^restricts list",
		["157468561"] = "^warns list",
		["534851678"] = "^me$",
	  --["883867878"] = "",
		--["995414842"] = "",
	},
	fa = {
		["857548549"] = "^تنظیم زبان (.*)",
		["533182389"] = "^لیست گروه ها$",
		["322911149"] = "^حذف ربات$",
		["876483833"] = "^ترک گروه$",
		["491968623"] = "^عکس گروه (.*)",
		["785727771"] = "^اطلاعات گروه (.*)",
		["963947223"] = "تنظیم ربات$",
		["782517243"] = "^تمدید",
		["286695962"] = "^تاریخ انقضا$",
		["418214612"] = "^نصب ربات$",
		["629849296"] = "^پنل مدیریت$",
		["794493464"] = "^تنظیمات محدودیت$",
		["451925647"] = "^(تنظیم محدودیت) (.*)",
		["923753458"] = "^(لیست فیلتر ها$)",
		["358487544"] = "^(حذف فیلتر ها)",
		["646658212"] = "^(فیلتر) (%s+) (.*)",
		["829326195"] = "^(حذف فیلتر) (.*)",
		["633595375"] = "^(پاک کردن) (.*)",
		["485947648"] = "^(مسدود برای) (.*)",
		["227432533"] = "^(اخراج برای) (.*)",
		["367761393"] = "^(محدودیت برای) (.*)",
		["745865175"] = "^(اخطار برای) (.*)",
		["949266295"] = "^(باز کردن) (.*)",
		["272467881"] = "^(فعال کردن) (.*)",
		["353369854"] = "^(غیرفعال کردن) (.*)",
		["728753114"] = "^تنظیمات اخطار",
		["885387995"] = "^تنظیم اخطار",
		["643381417"] = "^(حالت اخطار به) (.*)",
		["476642348"] = "^پاکسازی اخطارها",
		["529297341"] = "^(گزارش گیری اخطار) (.*)",
		["525743677"] = "^تنظیمات$",
		["199545483"] = "^تعطیل",
		["459196152"] = "^افتتاح",
		["934278767"] = "^ایدی",
		["125775142"] = "^اخطار",
		["161491933"] = "^حذف اخطار",
		["742665566"] = "^بدون اخطار",
		["886764275"] = "^سکوت",
		["188723116"] = "^حذف سکوت",
		["855435523"] = "^مسدودیت$",
		["738987392"] = "^رفع مسدودیت$",
		["185691863"] = "^مسدودیت همگانی$",
		["153395625"] = "'^رفع مسدودیت همگانی$",
		["264346885"] = "^مجاز",
		["689264328"] = "^غیرمجاز",
		["862341416"] = "^اخراج",
		["818678572"] = "^تنظیم ناظم",
		["777186715"] = "^حذف ناظم",
		["913296394"] = "^مدیران",
		["722359194"] = "^لیست ناظم ها",
		["182978251"] = "^تنظیم مدیر",
		["724391323"] = "^حذف مدیر",
		["268928669"] = "^تنظیم عنوان (.*)",
		["596266495"] = "^سنجاق$",
		["929646713"] = "^سنجاق دوباره$",
		["346477772"] = "^حذف سنجاق$",
		["167114782"] = "^نمایش سنجاق",
		["214196196"] = "^(تنظیم خوشامد گویی) (.*)",
		["413468182"] = "^(دریافت خوشامد گویی)",
		["659523845"] = "^(حذف خوشامد گویی)",
		["619725797"] = "^خوش امدگویی (.*)",
		["669736357"] = "^لینک$",
		["355977658"] = "^تنظیم ادد (%d+)",
		["792696955"] = "^درمورد ادمین ها$",
		["599232796"] = "^پاک کردن پیام ها",
		["161655192"] = "^بپاک$",
		["612633644"] = "^پاکسازی پیام ها",
		["272558414"] = "^لیست ربات ها",
		["428796657"] = "^لیست مسدود ها",
		["795429851"] = "^پاکسازی ربات ها",
		["871491222"] = "^لیست محدود ها",
		["626677973"] = "^لیست اخطار ها",
		["849722426"] = "^من$",
		["475884228"] = "^تعطیل از (%d+):(%d+) تا (%d+):(%d+)",
		-- ["292432217"] = "",

	}
}
M.Pattr = Pattr
function GetID(text)
	for m,n in pairs(Pattr) do
		for k,v in pairs(n) do
			if string.match(text, v) then
				print("Patterns Matched : "..k.." & "..v.." & "..m)
				return  k , v , m
			end
		end
	end
end
M.GetID = GetID

return M
