local UpTech = {}
languages = {
	fa = {
		warn = "کاربر \n%s\nشما به دلیل ارسال %s اخطار گرفتید !\nتعداد اخطار های شما : %s از %s",
		kick = "کاربر \n%s\nبه دلیل %s اخراج شد !",
		ban = "کاربر \n%s\nبه دلیل %s از گروه بن شد !",
		restricted = "کاربر \n%s\nشما به دلیل %s محدود شدید !",
		warn_filter = "کاربر \n%s\nشما به دلیل ارسال استفاده از کلمات فیلتر شده اخطار گرفتید !\nتعداد اخطار های شما : %s از %s",
		kick_filter = "کاربر \n%s\nبه دلیل استفاده از کلمات فیلتر شده اخراج شد !",
		ban_filter = "کاربر \n%s\nبه دلیل استفاده از کلمات فیلتر شده از گروه بن شد !",
		restricted_filter = "کاربر \n%s\nشما به دلیل استفاده از کلمات فیلتر شده محدود شدید !",
		filter = "وضعیت : ✅ موفق\nکلمه ی \n\n<b>%s</b>\n\nبا موفقیت به لیست کلمات فیلتر شده اضافه شد \nوضعیته واکنش به این کلمه : <code>%s</code>",
		unfilter = "وضعیت : ✅ موفق\nکلمه ی \n\n<b>%s</b>\n\nبا موفقیت از لیست کلمات فیلتر شده حذف شد",
		isunfilter = "💠 کلمه ی \n\n%s\n\nفیلتر نبود !",
		NFilter_list = "💠 لیست فیلتر ها خالی میباشد !",
		Filter_list = "لیست فیلتر ها : ",
		isfilter = "💠 کلمه ی \n\n%s\n\nاز قبل فیلتر بود!\nواکنش : %s",
		setlang = "<b>انجام شد !</b>\nزبان گروه تنظیم شد به : \n<code>فارسی</code>",
		locks_open = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>باز شدن</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_warn = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>اخطار</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_delete = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>پاک شدن</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_kick = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>اخراج</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_ban = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>مسدودیت</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_restrict = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>محدودیت</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_mute = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>سکوت</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_active = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>فعال</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		locks_deactive = "<code>وضعیت</code> : <b>درست</b>\n<code>عملیات</code> : <b>موفق</b>\n<code>{option} تنظیم شد به</code> : <b>غیرفعال</b>\n<code>دسترسی توسط </code> :\n@{username} [<code> {userid} </code>]",
		stats_open = 'مجاز♻️',
		stats_ban = 'مسدود❌',
		stats_restrict = 'محدود🔕',
		stats_warn = 'اخطار🚨',
		stats_delete  = 'پاک کردن🗑',
		stats_delete  = 'پاک کردن🗑',
		restrict_settings = [[🔕تنظیملت محدودیت افراد :

🕐زمان محدودیت : %s

🌐محدودیت های اعمالی :
ارسال پیام :  مجاز♻️
ارسال رسانه : مجاز♻️
ارسال استیکر : مجاز♻️
ارسال لینک : محدود🔕
]],
		restrict_set  = [[✅با موفقیت تنظیم شد.
زمان محدودیت شما برای %d روز %d ساعت %d دقیقه تنظیم شد.]],
		expire_set  = [[✅با موفقیت تنظیم شد.
این گروه به مدت %d روز %d ساعت %d دقیقه تمدید شد .]],
		restrict_time = '%d روز  %dساعت %d دقیقه.',
		restrict_notime = 'تا همیشه.',
		restrict_set0 = 'زمان محدویت تنظیم شد به صورت همشیه',
		no_time = '⭕️<b>لطفا زمان مورد نظر خود را با فورمت زیر وارد کنید : </b><code>  3روز 2ساعت 7دقیقه </code>',
		warn_remove = 'کاربره \n%s\nاخراج شد.(%d/%d)',
		warn_warn = 'کاربر \n%s\nاخطار گرفت.(%d/%d)',
		kick_text = 'کاربره \n%s\nبا موفقیت از گروه اخراج شد .',
		warnexpire_set_error = '❌عدد ارسال شده صحیح نمی باشد لطفا از حالت درست استفاده کنید.\n• شما نمی توانید بیشتر از 30 اخطار تنظیم کنید.\n•شما نمی توانید کمتر از دو اخطار تنظیم کنید.',
		warn_log = '✅لاگ گرفتن از اخطار ها هم اکنون روشن شد.\n•این دستور تمام اخطار های داده شده یک توضیحات کوچکی ذخیره می شود.',
		warn_logoff = '🔇لاگ گرفتن از اخطار ها هم اکنون غیرفعال شد.',
		warn_clean = '🗑تمامیه اخطار های داده شده توست کاربر %s پاکسازی شد.',
		with_bot = '🙃شما نمی توانید هیچ عملیاتی را با ربات انجام دهید.\n• در صورت وجود هر گونه مشکل در تشخیص افراد با پشتیبانی تماس حاصل کنید.',
		with_me = '•شما نمی توانید بر روی خودتان عملیاتی انجام دهید.',
		with_mod = '💠خطا کاربر مورد نظر شما جزو ناظم های گروه میباشد.\n• اگر فرد مورد نظر از مقام ادمینی خارج شده است لطفا دستور "درمورد ادمین ها" را ارسال کنید.',
		with_sudo = '💠خطا کاربر مورد نظر شما سازنده ی ربات میباشد.\nشما قادر به انجام این عمل درمورد سازنده ربات را ندارید',
		with_admin = '💠خطا کاربر مورد نظر شما ادمین ربات میباشد.\nشما قادر به انجام این عمل درمورد ادمین ربات را ندارید',
		with_support = '💠خطا کاربر مورد نظر شما پشتیبان ربات میباشد.\nشما قادر به انجام این عمل درمورد پشتیبان را ندارید',
		with_owner = '💠خطا کاربر مورد نظر شما جزو مدیران گروه میباشد.\nشما قادر به انجام این عمل درمورد مدیر گروه را ندارید',
		list_admin = '💠لیست ادمین های گروه :\n%s\n📌تعداد افراد :  %d',
		list_bots = '💠لیست ربات های های گروه :\n%s\n📌تعداد افراد :  %d',
		list_restrict = '💠لیست افراد محدود شده گروه :\n%s\n📌تعداد افراد :  %d',
		admin = 'ادمین',
		creator = 'سازنده',
		mute_all = '🔕تمامی پیام های بعدی گروه پاک خواهند شد !\nاز اعضای گروه تقاضا میشود حین تعطیل بودن گروه توسط مدیر از ارسال پیام خودداری نمایند.\n\nزمان دستور : %s',
		unmute_all = '🔕گروه از حالت تعطیلی خارج شد !\nربات پیام های بعدی اعضای غیرمدیر را پاک نخواهد کرد.\n\nزمان دستور : %s',
		clean_bots = '🗑تعداد %d ربات از گروه شما خارج شدند.',
		mute_user = '🔘%s\n به لیست افراد ساکت گروه افزوده شد',
		unmute_user = '🔘%s\n از لیست افراد محدود خارج شده است.',
		ban_user = '🔘%s\n از گروه مسدود شد.',
		unban_user = '🔘%s\n از لیست مدود شدگان گروه خارج شد.',
		nowarn_warn = '🗑تمام اخطار های کاربر \n%s\n پاکسازی شد.',
		unwarn_user = '⚠️یک اخطار از اخطار های کاربر \n%s\n برداشته شد.%s',
		unnowarn_user = '⚔️ کاربر \n%s\n هیچ اخطاری ندارد.',
		ispinned = '💡این پیام از قبل پین شده بود.',
		nopinned = '🛢هیچ پیامی در گروه سنجاق نشده است.',
		replyit = '🖇لطفا بر روی یک پیام ریپلی کنید.',
		haspinned = '✅با موفقیت سنجاق شد.',
		nopindatabase = '📝پیام سنجاق شده گروه یافت نشد.',
		hasunpinned = '✅پیام سنجاق شده گروه پاک شد.',
		imnotadmin = '⚠️ربات دسترسی های لازم را برای ایجاد تغیرات در گروه ندارد لطفا ربات را به صورت کامل ادمین کنید.',
		setwelcome = '✅خوش امدگویی برای کاربران با موفقیت تنظیم شد.',
		setforceadd = '✅مقدار دعوتی که کاربران میبایست در صورت فعال بودن ادد اجباری دعوت نمایند ، تنظیم شد به :  *%s*',
		welcomeon = '✅خوش آمد گویی در گروه هم اکنون فعال شد',
		forceaddon = '✅افزودن اجباری در گروه هم اکنون فعال شد',
		nowelcome = '⚠️هیچ پیام خوش آمدگویی یافت نشد',
		delwelcome = '❌خوش امد گویی گروه شما پاک شد',
		welcomeoff = '❌خوش امدگویی غیرفعال شد.',
		forceaddoff = '❌افزودن اجباری غیرفعال شد',
		errorwelcomeset = [[😕هیچ متنی برای تنظیم یافت نشد.
•شما می توانید بر روی متن ریپلی کنید.
•شما می توانید در اخر دستور متن را اضافه کنید.]],
		link = '🌐لینک برای %s :\n•%s',
		a_owner = '💠%s\n به مقام مدیریت گروه ارتقا یافت.',
		n_owner = '💠%s\n از قبل مدیر گروه بود.',
		de_a_owner = '💠کاربر : \n%s\n از مقام مدیریت گروه حذف شد.',
		de_n_owner = '💠کاربر : \n%s\n از قبل مدیر گروه نبود.',
		error_mode_warn = "خطایی رخ داده است !\nحالتی با نامه %s وجود ندارد.",
		mode_warn = '⚔️<b>حالت واکنش به کاربر اخطار گرفته تنظیم شد به : \n%s</b>',
		gpinfo = [[اطلاعاته گروهه [%s].
 - - - - - - -
•تعداد ادمین ها :
%d
 - - - - - - -
•سازنده ی گروه :
%s
 - - - - - - -
لینک گروه :
%s
 - - - - - - -
•وضعیت ادمینی ربات :
%s
 - - - - - - -
•تاریخ انقضا :
%s
 - - - - - - -
•اسم گروه :
%s
 - - - - - - -
 تعداد ناظم ها : 
 %s 
 - - - - - - -
]],
		install = [[ربات در گروهه [%s] نصب شد .
 - - - - - - -
•تعداد ادمین ها :
%d
 - - - - - - -
•سازنده ی گروه :
%s
 - - - - - - -
لینک گروه :
ثبت نشده
 - - - - - - -
•وضعیت ادمینی ربات :
%s
 - - - - - - -
•تاریخ انقضا :
2 روزه [ ورژن تستی ]
 - - - - - - -
•اسم گروه :
%s]],
		config_gp = [[ربات در گروه
%s
با موفقیت تنظیم شد .
اطلاعات تنظیمات اعمال شده :

📍 <b>تعداد ادمین ها :</b>
%d

📍 <b>مدیر تنظیم شده :</b>
%s

📍 <b>ادمین های تنظیم شده : </b>
%s

📍 <b>لینک گروه :</b>
%s

📍 <b>وضعیت ادمینی ربات :</b>
%s

📍 <b>تاریخ انقضا :</b>
%s

📍 <b>اسم گروه : </b>
%s

📍 <b>قفل های فعال شده اتوماتیک : </b>

🛡 قفل ربات
🛡 قفل لینک]],
		gpnotfound = 'گروه مورد نظر یافت نشد !',
		yes = 'بله',
		no = 'نخیر',
		command_flood = 'سرعت ارسال دستور ها در گروه شما بسیار بالاست',
		chargestats_unlimit = '💠 <b>این گروه به صورت نامحدود شارژ شده است</b> 💠\n\nتاریخ شارژ : <code>%s</code> و ساعت <code>%s</code>',
		charge_unlimit = '💠 <b>این گروه به صورت نامحدود شارژ شد</b> 💠\n\nتاریخ شارژ : <code>%s</code>',
		gp_pic = 'نام گروه : \n%s\nایدی عددی گروه : \n%s',
		installed_before = 'مشکلی پیش آمده است !\nاین گروه از قبل توسط \n%s\nنصب شده بود !',
		leave = '⚠️<b>اخطار</b>⚠️\nربات گروه را با دستور ادمین ترک مینماید ...',
		a_mod = '💠کاربره : \n%s\n به مقام مدیریت گروه ارتقا یافت.',
		n_mod = '💠کاربره : \n%s\n از قبل مدیر گروه بود.',
		de_a_mod = '💠کاربره : \n%s\n از مقام مدیریت گروه عزل شد.',
		de_n_mod = '💠کاربره : \n%s\n از قبل جزو مدیر های گروه نبود.',
		me_command = [[<b> درمورد کاربر </b>
%s :
<b>•پیام های این شخص :</b>  <code>(%s از %s)</code>
<b>•درصد پیام های کاربر :</b>  [%s]
<b>•مقام  :</b>  <code>%s</code>
<b>•لقب کاربر :</b>  <code>%s</code>
<b>•تعداد دفعات اخراج شده :</b>  <code>%s</code>
<b>•تعداد اعضای دعوت کرده :</b>  %s
<b>•دعوت شده توسط :</b>
%s]],
		expirestats = [[⏱تاریخ انقضا گروه شما :

گروه شما تا <code>%s</code> دیگر فعال میباشد.

📅تاریخ رویداد :  %s

📊گروه شما توسط
%s
به صورت پنل <code>%s</code> شارژ شده است.

💳برای پرداخت خودکار از طریق ربات به صورت مستقیم به پیوی ربات مراجعه کنید.

🛍گروه شما دارای [%s] تخفیف برای شارژ دوباره می باشد.]],
		id_command = "🔘 نام شما :\n%s\n🔘 نام کاربری شما :\n%s\n🔘 ایدی شما :\n%s\n🔘 نام گروه :\n%s\n🔘 ایدی گروه :\n%s",
		access_denied = "⛔️ شما دسترسی به این دستور را ندارید !",
		fadd_wrongnum = "⚠️خطا !\nعدد وارد شده باید از 0 بیشتر باشد . لطفا عدد دیگری را امتحان بکنید !",
		owner_list = '👤 لیست مدیران  : \n',
		mod_list = '👤 لیست ناظم ها  : \n',
		no_owner_list = '⚠️ هیچ مدیری برای این گروه تعیین نشده است !',
		no_mod_list = '⚠️ هیچ ناظمی برای این گروه تعیین نشده است !',
		n_unbanall_user = 'کاربر \n%s\nمسدودیت همگانی نبود .',
		unbanall_user = 'کاربر \n%s\nاز مسدودیت همگانی آزاد شد .',
		banall_user = 'کاربر\n%s\nمسدودیت همگانی شد !\nچنان چه ربات مدیریت گروهی را بر عهده داشته باشد که این شخص از اعضای آن گروه باشد ، به طور دائم از گروه مسدود و حذف خواهد شد',
		n_banall_user = 'کاربر\n%s\nاز قبل جزو اعضای مسدود شده های همگانی ربات میباشد.',
		done_inviting = 'کاربر \n%s\n✅ شما تعداد %s نفر به گروه دعوت کردید و محدودیت شما حذف شد و مقدور به ارسال پیام و فعالیت در گروه هستید  ✅. ',
		n_done_inviting = 'کاربر \n%s\nشما باید %s کاربر دیگر به گروه دعوت نمایید تا بتوانید در گروه فعالیت داشته باشید .\nدر غیر اینصورت پیام های شما پاک خواهند شد ❌',
		uninstall = 'گروه مورد نظر شما با موفقیت از لیست گروه های ربات حدف شد !\nچنانچه مشکل یا سوالی داشتید میتوانید به پشتیبانی ربات مراجعه فرمایید.',
		clean_filters = "<b>لیست فیلترینگ کلمات با موفقیت خالی شد !</b>",
		stats = "آمار ربات : \n %s گروه و %s کاربر",
		expire_end = "کاربر :\n%s\n مدیر محترمه گروهه %s , زمان تمدید گروه شما به اتمام رسیده است ! \nلطفا جهت پرداخت هزینه ربات از طریق مراجعه به پیوی @Creed اقدام نمایید.",
		warnex_unlimit = "✅",
	},
	en = {
		expire_end = "کاربر :\n%s\n مدیر محترمه گروهه %s , زمان تمدید گروه شما به اتمام رسیده است ! \nلطفا جهت پرداخت هزینه ربات از طریق مراجعه به پیوی @Creed اقدام نمایید.",
		warn = "User \n%s\nYou have been Get Warn Because of Sending %s !\nYour Warn is %s of %s",
		stats = "Stats For Robot : \n%s Groups and %s Users",
		kick = "User \n%s\nHas been Kicked Because of %s ",
		ban = "User \n%s\nHas been Banned Because of %s ",
		restricted = "User \n%s\nYou have been Get Restricted Because of %s ",
		mute = "User \n%s\nYou have been Get Muted Because of %s ",
		setlang = "<b>Done !</b>\n<b>Group Language Has been Set to</b> : \n<code>English</code>",
		locks_open = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Open</b>\n<code>Accessed by </code> :\n@{username}",
		locks_warn = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Warn</b>\n<code>Accessed by </code> :\n@{username}",
		locks_delete = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Delete</b>\n<code>Accessed by </code> :\n@{username}",
		locks_kick = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Kick</b>\n<code>Accessed by </code> :\n@{username}",
		locks_ban = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Ban</b>\n<code>Accessed by </code> :\n@{username}",
		locks_restrict = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Restrict</b>\n<code>Accessed by </code> :\n@{username}",
		locks_mute = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Mute</b>\n<code>Accessed by </code> :\n@{username}",
		locks_mute = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Active</b>\n<code>Accessed by </code> :\n@{username}",
		locks_mute = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull !</b>\n<code>{option} Set on </code> : <b>Deactive</b>\n<code>Accessed by </code> :\n@{username}",
		stats_open = 'Allowed♻️',
		stats_ban = 'Ban❌',
		stats_restrict = 'Restrict🔕',
		stats_warn = 'Warn🚨',
		stats_active = 'Active🛡',
		stats_delete  = 'Delete🗑',
		warn_list = "📄List of warned users : \n%s\n\n📌Total users count : %d",
		warn_settings = "⚠️Warn settings : \n⌛️Expire Time  :  %s\n🔋Max warns : %d\n💡Warn mode : %s\n🔇Warn mute : %s\n⛔️Warn Log : %s",
		max_warn = '〽️Warning limits set to %d',
		mode_warn = '⚔️<b>Warning mode was set to : </b>\n%s',
		no_warn = '<b>⚠️There are no people in the warn list</b>',
		restrict_settings = [[🔕Settings for Restrict  :

		🕐Limt Time : %s

		🌐Restrict option :
		 Send message :  Allowed♻️
		Send media : Allowed♻️
		Send sticker  :  Allowed♻️
		Send link : Restrict🔕
		]],
		restrict_set = [[✅Successfully Set.
Limit time has been set to %d days %d hours %d minutes.]],
		restrict_set = [[✅Successfully Set.
This group has been Charged for %d days %d hours %d minutes.]],
		restrict_set0 = 'restrict time limt seted to "forever"',
		restrict_time = '%dDay  %dHour %dMin.',
		restrict_notime = 'forever',
		no_time = '⭕️<b>Please input date os : </b><code>9day 5hour 3min</code>',
		warn_remove = 'User \n%s\n has been kicked.(%d/%d)',
		warn_warn = 'User \n%s\n has  warned.(%d/%d)',
		expire_set  = [[✅Has been Set Successfully !
This Group Has been charged for %s Days %s Hours and %s Minutes !]],
		kick_text = 'User \n%s\n Has been Successfully kicked .',
		warnexpire_set_error = '❌The number sent is not correct. Please use the correct mode.\n• You can not set more than 30 warnings.\n• You can not set less than two warnings.',
		warn_log = '✅Logging from alerts is now on.\n• This command stores all warnings given a small description.',
		warn_logoff = '🔇logging from alerts is now disabled',
		warn_clean = '🗑All warns has been cleaned by \n%s',
		with_bot = '🙃You can not do any operations with the robot. \n • If there is any problem in identifying support people, call.',
		with_me = '•You can not operate on your own.',
		with_mod = '💠Error The user you are currently targeting is admin.\n• If the person concerned has left the admin, please send the "about admins" command.',
		with_sudo = '💠Error ! The user is Robot\'s Sudo.\n• You cannot use this command on Sudo users.',
		with_admin = '💠Error ! The user is Robot\'s Admin.\n• You cannot use this command on Sudo users.',
		with_support = '💠Error ! The user is Robot\'s Support.\n• You cannot use this command on Sudo users.',
		with_owner = '💠Error ! The user is from Groups Owners.\n• You cannot use this command on Owners.',
		list_admin = '💠List of groups admins :\n%s\n📌Total users count :  %d',
		list_bots = '💠List of groups roBots :\n%s\n📌Total users count :  %d',
		list_restrict = '💠List of groups restrict :\n%s\n📌Total users count :  %d',
		admin = 'Admin',
		creator = 'Creator',
		mute_all = '🔕Group Messages Will be Deleted By Robot ! \nDear Users Avoid To send Message While Group is Muted By THE Group Moderators/Owner.\n\nCommand Time : %s',
		unmute_all = '🔕The Groups Has been Unmuted By the Moderators/Owner !\nMessages Wont Be Deleted More.\n\nCommand Time : %s',
		clean_bots = '🗑%d of group bots has been cleaned',
		mute_user = '🔘%s\n Has been added to mutelist.',
		unmute_user = '🔘%s\n Has been removed from mutelist.',
		ban_user = '🔘%s\n Has been added to banlist.',
		unban_user = '🔘%s\n Has been removed from banlist.',
		nowarn_warn = '🗑All %s warnings cleared',
		unwarn_user = '⚠️A warning has been removed from \n%s\n user warnings.%s',
		unnowarn_user = '⚔️User \n%s\n has no warning',
		ispinned = '💡 This message is already pinned.',
		nopinned = '🛢The group\'s pinned message was not found',
		replyit = '🖇Please replay a message.',
		haspinned = '✅Successfully pinned.',
		nopindatabase = '📝A pinned group message could not be found.',
		hasunpinned = '✅Successfully unpinned.',
		imnotadmin = '⚠️Robot does not have the necessary access to make changes in the group. Please  admin the robot',
		setwelcome = '✅Welcome was saved',
		setforceadd = '✅The Number of Invites For Members While Force Add is Enabled is :  *%s* ',
		welcomeon = '✅Welcome has been activated',
		forceaddon = '✅forceadd has been activated',
		nowelcome = '⚠️No welcometext found',
		delwelcome = '❌welcome has been deleted',
		welcomeoff = '❌Welcome turned off.',
		locks_active = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull</b>\n<code>%s Has been Set to </code> : <b>Active</b>\n<code>Command By</code> :\n%s",
		locks_deactive = "<code>Status</code> : <b>True</b>\n<code>Operation</code> : <b>Successfull</b>\n<code>%s Has been Set to </code> : <b>De-Active</b>\n<code>Command By</code> :\n%s",
		forceaddoff = 'forceadd turned off.',
		errorwelcomeset = [[No text found.
• You can reply the text.
• You can add the text at the end.]],
		link = '🌐Link for %s :\n•%s',
		a_owner = '💠%s is currently the <b>owner</b> of the group.',
		n_owner = '💠%s was already a <b>owner</b> of the group.',
		de_a_owner = '💠%s Has been Demoted from Ownership of Robot.', -- // inja bayad avaz  beshe
		de_n_owner = '💠%s Already is not Owner of Group.', -- // hamchenin :|
		error_mode_warn = 'Error Occured !\nthere is no Option named %s',
		filter = "Status : ✅ Successfull\nThe Word : \n\n<b>%s</b>\n\nHas been Added to Filtered Words List.\nReaction for Filtered Word : <code>%s</code>",
		unfilter = "Status : ✅ Successfull\nThe Word: \n\n<b>%s</b>\n\nHas been Deleted from Filtered Words List",
		isunfilter = "💠 The Word\n\n%s\n\nWas not Filtered !",
		NFilter_list = "💠 Filters List is Empety !",
		Filter_list = "Filters List : ",
		isfilter = "💠 The Word \n\n%s\n\nis Already Filtered !\n<b>Action :</b> %s ",
		gpinfo = [["<b>Group</b> [%s] <b>has been Installed.</b>"
•Admin Count :
<code>%d</code>
•Creator of group :
<code>%s</code>
•Link :
<code>Not Set</code>
•Bot admin :
<code>%s</code>
•Time of expire :
<code>Test Version [ 2 Days ]</code>
•Title :
<code>%s</code>]],
		install = [["<b>Group</b> [%s] <b>has been Installed.</b>"
•Admin Count :
<code>%d</code>
•Creator of group :
<code>%s</code>
•Link :
<code>Not Set</code>
•Bot admin :
<code>%s</code>
•Time of expire :
<code>Test Version [ 2 Days ]</code>
•Title :
<code>%s</code>]],
config_gp = [[Robot Has been Successfully Configed in %s .
Configuration Information :

📍 <b>Admins Count :</b>
%d

📍 <b>Promoted Owner :</b>
%s

📍 <b>Promoted Moderators : </b>
%s

📍 <b>Group Link :</b>
%s

📍 <b>Robot Promotion Status :</b>
%s

📍 <b>Expire Time :</b>
%s

📍 <b>Group Nick-Name : </b>
%s

📍 <b>Automatically Activated Media Lock : </b>

🛡 Robot's Cleaning
🛡 Link's Cleaning]],
		gpnotfound = 'Group not found !',
		yes = 'Yes',
		no = 'No',
		command_flood = 'You are Using commands So fast , Relax and Reuse after a while .',
		charge_unlimit = '💠 <b>Group Has been Charged Unlimited</b> 💠\n\nCharge Date : <code>%s</code>',
		chargestats_unlimit = '💠 <b>This Group is Charged Unlimited</b> 💠\n\nAt : <code>%s</code>',
		gp_pic = 'Gp Name : %s\nGp id: %s',
		installed_before = '<b>Error Has been Occured </b>!\nThis Group is Already Added by :\n%s',
		leave = '⚠️<b>Warning</b>⚠️\nRobot Leaves The Group By Admins Command ...',
		a_mod = '💠User : \n%s\n Has been promoted as Moderator.',
		n_mod = '💠Uer :\n%s\n is already Moderator.',
		de_a_mod = '💠User  : \n%s\n has been Demoted.',
		de_n_mod = '💠User : \n%s\n is not Moderator.',
		me_command = [[<b>About User : </b>
%s :
•<b>User msgs :</b>  <code>(%d of %d)</code>
•<b>Msgs Percent :</b>  [%s]
•<b>User Rank :</b>  <code>%s</code>
•<b>User Addition :</b>  <code>%s</code>
•<b>Kicked Count :</b>  <code>%s</code>
•<b>Total Users Invited To Gp :</b>  %s
•<b>Has been Invited By :</b>
%s]],
		expirestats = [[⏱Your Groups Expire Stats :

Your Group is Enabled for <code>%s</code> Days Later .

📅Charged Date :  %s

📊Your Group Has been Charged By %s On Panel : <code>%s</code>.

💳For Automatic Payment , Send Message to Robot in Private Chat.

🛍Your Group Have [ %s ] Discount To Charge Again.]],
		id_command = "🔘 Your name :\n%s\n🔘 Your Username :\n%s\n🔘 Your id :\n%s\n🔘 Group Name :\n%s\n🔘 Group id :\n%s",
		access_denied = "⛔️ You Dont Have Access To This Command !",
		fadd_wrongnum = "⚠️Error !\nThe Entered number Should be more than 0 . Try another Number Please !",
		owner_list = '👤 Owners List : \n',
		no_owner_list = "⚠️ There is No Owners promoted in This Group !",
		n_unbanall_user = 'User : $s Was not Globally Banned.',
		unbanall_user = 'User : $s Has been Globally Unbanned .',
		banall_user = 'User %s Has been Globally Banned !\nIf there be a Group Which is moderating By Robot and The banned user Be that members of that Group, He will be banned and kicked by Robot for Unlimited Time .',
		n_banall_user = 'User %s is Already Globally Banned !',
		done_inviting = 'Dear User \n%s\nYou have been Invited %s Members to Group and Now You Are Unlimited and You Can Have Activity in Group .',
		n_done_inviting = 'Dear User \n%s\nYou Have to Invite %s more Users To Group to be Able to Have Activity !',
		uninstall = 'This Group Successfully Removed From Robots Groups !\nIf you Have Suggestions or Questions Ask the Support\'s of Robot !',
		clean_filters = "<b>Filter List Has been Cleaned Successfully !</b>",
		},
}
UpTech.languages = languages
function UpTech.trlocks_to_fa(Input)
	Locks = {
		["links"] = "لینک", -- 1
		["forward"] = "فوروارد", -- 2
		["username"] = "نام کاربری", -- 3
		["location"] = "مکان", -- 4
		["badword"] = "فحش", -- 5
		["tag"] = "هشتگ", -- 6
		["reply"] = "پاسخ", -- 7
		["flood"] = "رگباری", -- 8
		["shortmsg"] = "پیام کوتاه", -- 9
		["spam"] = "پیام طولانی", -- 11
		["mention"] = "فراخوانی", -- 12
		["bot"] = "ربات", -- 13
		["persian"] = "فارسی", -- 15
		["english"] = "انگلیسی", -- 16
		["edit"] = "ویرایش", -- 17
		["caption"] = "زیرنویس", -- 19
		["inline"] = "اینلاین", -- 20
		["emoji"] = "شکلک", -- 21
		["keyboard"] = "کیبورد", -- 22
		["sticker"] = "استیکر", -- 23
		["markdown"] = "زیبانویس", -- 24
		["weblink"] = "لینک سایت", -- 25
		["game"] = "بازی", -- 26
		["gif"] = "گیف", -- 27
		["contact"] = "مخاطب", -- 28
		["photo"] = "عکس", -- 29
		["voice"] = "صدا", -- 30
		["audio"] = "ترانه", -- 31
		["film"] = "فیلم", -- 32
		["file"] = "فایل", -- 33
		["text"] = "متن", -- 34
		["videonote"] = "فیلم سلفی", -- 35
	}
	return Locks[Input:lower()] or Input
end
function UpTech.trlocks_to_en(Input)
	Input = string.gsub(Input, "_", "")
	Locks = {
		["links"] = "لینک", -- 1
		["forward"] = "فوروارد", -- 2
		["username"] = "نام کاربری", -- 3
		["location"] = "مکان", -- 4
		["badword"] = "فحش", -- 5
		["tag"] = "هشتگ", -- 6
		["reply"] = "پاسخ", -- 7
		["flood"] = "رگباری", -- 8
		["shortmsg"] = "پیام کوتاه", -- 9
		["spam"] = "پیام طولانی", -- 11
		["mention"] = "فراخوانی", -- 12
		["bot"] = "ربات", -- 13
		["persian"] = "فارسی", -- 15
		["english"] = "انگلیسی", -- 16
		["edit"] = "ویرایش", -- 17
		["caption"] = "زیرنویس", -- 19
		["inline"] = "اینلاین", -- 20
		["emoji"] = "شکلک", -- 21
		["keyboard"] = "کیبورد", -- 22
		["sticker"] = "استیکر", -- 23
		["markdown"] = "زیبانویس", -- 24
		["weblink"] = "لینک سایت", -- 25
		["game"] = "بازی", -- 26
		["gif"] = "گیف", -- 27
		["contact"] = "مخاطب", -- 28
		["photo"] = "عکس", -- 29
		["voice"] = "صدا", -- 30
		["audio"] = "ترانه", -- 31
		["film"] = "فیلم", -- 32
		["file"] = "فایل", -- 33
		["text"] = "متن", -- 34
		["videonote"] = "فیلم سلفی", -- 35
	}
	for k , v in pairs(Locks) do
		if v == Input then
			return k
		end
	end
	return Input
end
function UpTech.trexlocks_to_fa(Input)
	Locks = {
		["service"] = "سرویس", -- 1
		["autochat"] = "چت خودکار", -- 2
		["forceadd"] = "ادد اجباری", -- 3
	}
	return Locks[Input:lower()] or Input
end
function UpTech.trexlocks_to_en(Input)
	Locks = {
		["service"] = "سرویس", -- 1
		["autochat"] = "چت خودکار", -- 2
		["forceadd"] = "ادد اجباری", -- 3
	}
	for k , v in pairs(Locks) do
		if v == Input then
			return k
		end
	end
	return Input
end
function emoji(str)
	if not str then return nil end
	local emojis = {
		flood = "⚠️",
		shortmsg = "📃",
		spam = "☠️",
		mention = "📎",
		bot = "🤖",
		links = "🌐",
		tag = "#️⃣",
		username = "🖇",
		forward = "⬅️",
		persian = "🇮🇷",
		english = "🇬🇧",
		reply = "🔁",
		badword = "📛",
		edit = "📝",
		location = "🌏",
		caption = "🏷",
		inline = "🖥",
		emoji = "😶",
		keyboard = "⌨️",
		sticker = "🎭",
		markdown = "💢",
		weblink = "🔗",
		game = "🎮",
		gif = "Ⓜ️",
		contact = "📵",
		photo = "🖼",
		voice = "🔇",
		audio = "🔊",
		film = "💻",
		file = "📁",
		text = "🗒",
		videonote = "📹",
	}
	return str:gsub('[a-zA-Z0-9%-_]+', function(word)
		return emojis[word:match('(.+)')] or word
	end)
end
UpTech.emoji = emoji
function TranslateEN(input)
	Words = {
		["اخطار"] = "warn",
		["اخراج"] = "kick",
		["مسدود"] = "ban",
		["سکوت"] = "mute",
		["حذف"] = "delete",
		["محدودیت"] = "restrict"
	}

return Words[input] or input
end
UpTech.TranslateEN = TranslateEN
function TranslateFA(input)
	Words = {
		["warn"] = "اخطار",
		["kick"] = "اخراج",
		["ban"] = "مسدود",
		["mute"] = "سکوت",
		["delete"] = "حذف",
		["restrict"] = "محدودیت"
	}
return Words[input] or input
end
UpTech.TranslateFA = TranslateFA
function is_ingroup(arg , data)
	if data.status._ == "chatMemberStatusBanned" or
	data.status._ == "chatMemberStatusKicked"
	or data.status._ == "chatMemberStatusLeft" then
		sendText(arg.chat_id, 0, 'user is not in group', nil, "html")
	else
		xpcall(arg['function'] , debug.traceback, arg.chat_id , arg.user_id)
		end
	end
	config = {
		realm = -1001138736153
	}
	UpTech.config = config
	function UpTech.warn_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		elseif rank({chat_id = chat_id,sender_user_id=user_id} , 'mod') then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'), nil, "html")
		else
			local number = database:hincrby('warn:'..source_hash..chat_id , user_id , 1)
			local max_warn = database:hget(chat_id , 'warn_max:'..source_hash) or 10
			if tonumber(number) >= tonumber(max_warn) then
				text = Request_Text(chat_id, 'warn_remove'):format(getinfo(user_id) ,number , max_warn)
				tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
				database:incr(chat_id..source_hash..':kicked:times:'..user_id)
			else
				text = Request_Text(chat_id, 'warn_warn'):format(getinfo(user_id) ,number , max_warn)
			end
			sendText(chat_id, 0, text, nil, "html")
		end
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_owner'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'):format(getinfo(user_id)), nil, "html")
				else
					local number = database:hincrby('warn:'..source_hash..chat_id , user_id , 1)
					local max_warn = database:hget(chat_id , 'warn_max:'..source_hash) or 10
					if tonumber(number) >= tonumber(max_warn) then
						--if database:hget(group_chat , 'warn_mode:'..source_hash) == "kick" or database:hget(group_chat , 'warn_mode:'..source_hash) == "اخراج" then
						text = Request_Text(chat_id, 'warn_remove'):format(getinfo(user_id) ,number , max_warn)
						tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
						database:incr(chat_id..source_hash..':kicked:times:'..user_id)
					else
						text = Request_Text(chat_id, 'warn_warn'):format(getinfo(user_id) ,number , max_warn)
					end
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.nowarn_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		elseif rank({chat_id = chat_id,sender_user_id=user_id} , 'mod') then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'), nil, "html")
		else
			local number = database:hdel('warn:'..source_hash..chat_id , user_id)
			text = Request_Text(chat_id, 'nowarn_warn'):format(getinfo(user_id))
			sendText(chat_id, 0, text, nil, "html")
		end
	end
	function UpTech.unwarn_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		elseif rank({chat_id = chat_id,sender_user_id=user_id} , 'mod') then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'), nil, "html")
		else
			if not database:hget('warn:'..source_hash..chat_id , user_id) or tonumber(database:hget('warn:'..source_hash..chat_id , user_id)) <= 0 then
				database:hdel('warn:'..source_hash..chat_id , user_id)
				text = Request_Text(chat_id, 'unnowarn_user'):format(getinfo(user_id))
				return sendText(chat_id, 0, text, nil, "html")
			end
			local number = database:hincrby('warn:'..source_hash..chat_id , user_id , -1)
			local max_warn = database:hget(chat_id , 'warn_max:'..source_hash) or 10
			text = Request_Text(chat_id, 'unwarn_user'):format(getinfo(user_id) , '['..number..'/'..max_warn..']')
			sendText(chat_id, 0, text, nil, "html")
		end
	end
	function UpTech.kick_user(user_id , chat_id , sender , mute)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_owner'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'):format(getinfo(user_id)), nil, "html")
				else
					text = Request_Text(chat_id, 'kick_text'):format(getinfo(user_id))
					tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
					database:incr(chat_id..source_hash..':kicked:times:'..user_id)
					sendText(chat_id, 0, text, nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end

	function UpTech.ban_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_owner'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'):format(getinfo(user_id)), nil, "html")
				else
					tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {0}, dl_cb, nil)
					database:incr(chat_id..source_hash..':kicked:times:'..user_id)
					sendText(chat_id, 0, Request_Text(chat_id , 'ban_user'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.unban_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'):format(getinfo(user_id)), nil, "html")
				else
					tdbot.changeChatMemberStatus(chat_id, user_id, 'Member', {})
					sendText(chat_id, 0, Request_Text(chat_id , 'unban_user'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end


	function UpTech.promote_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank ~= 'mod' then
					tdbot.getChatMember(chat_id , user_id, is_ingroup, {chat_id = chat_id,user_id = user_id,
					['function'] = function(chat_id , user_id)
						_rank({chat_id = chat_id,sender_user_id=user_id} , 'mod')
						sendText(chat_id, 0, Request_Text(chat_id , 'a_mod'):format(getinfo(user_id)), nil, "html")
					end})
				else
					sendText(chat_id, 0, Request_Text(chat_id , 'n_mod'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.demote_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_owner'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					tdbot.getChatMember(chat_id , user_id, is_ingroup, {chat_id = chat_id,user_id = user_id,
					['function'] = function(chat_id , user_id)
						_derank({chat_id = chat_id,sender_user_id=user_id} , 'mod')
						sendText(chat_id, 0, Request_Text(chat_id , 'de_a_mod'):format(getinfo(user_id)), nil, "html")
					end})
				else
					sendText(chat_id, 0, Request_Text(chat_id , 'de_n_mod'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.owner_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank ~= 'owner' then
					tdbot.getChatMember(chat_id , user_id, is_ingroup, {chat_id = chat_id,user_id = user_id,
					['function'] = function(chat_id , user_id)
						_rank({chat_id = chat_id,sender_user_id=user_id} , 'owner')
						sendText(chat_id, 0, Request_Text(chat_id , 'a_owner'):format(getinfo(user_id)), nil, "html")
					end})
				else
					sendText(chat_id, 0, Request_Text(chat_id , 'n_owner'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.deowner_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					tdbot.getChatMember(chat_id , user_id, is_ingroup, {chat_id = chat_id,user_id = user_id,
					['function'] = function(chat_id , user_id)
						_derank({chat_id = chat_id,sender_user_id=user_id} , 'owner')
						sendText(chat_id, 0, Request_Text(chat_id , 'de_a_owner'):format(getinfo(user_id)), nil, "html")
					end})
				else
					sendText(chat_id, 0, Request_Text(chat_id , 'de_n_owner'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.banall_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				else
					if not database:sismember('banalls:'..source_hash , user_id) then
						database:sadd('banalls:'..source_hash , user_id)
						tdbot.changeChatMemberStatus(chat_id, user_id, 'Banned', {1,unix,0,0,0,0})
						database:incr(chat_id..source_hash..':kicked:times:'..user_id)
						sendText(chat_id, 0, Request_Text(chat_id , 'banall_user'):format(getinfo(user_id)), nil, "html")
					else
						sendText(chat_id, 0, Request_Text(chat_id , 'n_banall_user'):format(getinfo(user_id)), nil, "html")
					end
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.unbanall_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				else
					if database:sismember('banalls:'..source_hash , user_id) then
						database:srem('banalls:'..source_hash , user_id)
						sendText(chat_id, 0, Request_Text(chat_id , 'unbanall_user'):format(getinfo(user_id)), nil, "html")
					else
						sendText(chat_id, 0, Request_Text(chat_id , 'n_unbanall_user'):format(getinfo(user_id)), nil, "html")
					end
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.mute_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'owner' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_owner'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'mod' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_mod'):format(getinfo(user_id)), nil, "html")
				else
					local unix = database:hget(chat_id , 'restrict_unix:'..source_hash)
					if not unix then
						unix = 0
					else
						unix = unix + os.time()
					end

					tdbot.changeChatMemberStatus(chat_id, user_id, 'Restricted', {1,unix,0,0,0,0})
					database:sadd("mute_users:"..source_hash..":"..chat_id, user_id)
					sendText(chat_id, 0, Request_Text(chat_id , 'mute_user'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.unmute_user(user_id , chat_id , sender)
		if sender == user_id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_me'), nil, "html")
		elseif user_id == bot.id then
			return sendText(chat_id, 0, Request_Text(chat_id , 'with_bot'), nil, "html")
		else
			if is_sudo(chat_id, sender) or is_admin(chat_id, sender) or is_support(chat_id, sender) or is_owner(chat_id, sender) then
				user_rank = rank({chat_id = chat_id,sender_user_id=user_id})
				if user_rank == 'sudo' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_sudo'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'admin' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_admin'):format(getinfo(user_id)), nil, "html")
				elseif user_rank == 'support' then
					sendText(chat_id, 0, Request_Text(chat_id , 'with_support'):format(getinfo(user_id)), nil, "html")
				else
					tdbot.changeChatMemberStatus(chat_id, user_id, 'Restricted', {1,0,1,1,1,1})
					database:srem("mute_users:"..source_hash..":"..chat_id, user_id)
					sendText(chat_id, 0, Request_Text(chat_id , 'unmute_user'):format(getinfo(user_id)), nil, "html")
				end
			else
				sendText(chat_id, 0, Request_Text(chat_id , 'access_denied'):format(getinfo(user_id)), nil, "html")
			end
		end
	end
	function UpTech.id_command(user_id, chat_id, sender)
		local tg_user = (user_id or sender)
		function id_chatinfo(Extra, Result)
			function id_userinfo(extra, result)
				function id_cb(arg, data)
					if next(data.photos) then
						tdbot.sendPhoto(chat_id, reply_to_message_id, data.photos[0].sizes[0].photo.persistent_id, nil, false, 0, 0, Request_Text(chat_id, 'id_command'):format((result.first_name or ''), ('@'..result.username or ''), tg_user, Result.title, chat_id), 0, 0, false, nil, dl_cb, nil)
					else
						sendText(chat_id, 0, Request_Text(chat_id, 'id_command'):format((result.first_name or ''), ('@'..result.username or ''), tg_user, Result.title, chat_id), nil, "html")
					end
				end
				tdbot.getUserProfilePhotos(tg_user, 0, 1, id_cb, nil)
			end
			tdbot.getUser(tg_user, id_userinfo, nil)
		end
		tdbot.getChat(chat_id, id_chatinfo, nil)
	end



	return UpTech
