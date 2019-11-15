require("TSLib")
init(0)
local w, h = getScreenSize()
local sz = require("sz")
local socket = require ("szocket")
local cjson = sz.json
local http = require("szocket.http")
local ts = require("ts")
os.execute("input keyevent 按键编码")
mSleep(2000)

--time = getNetTime();         
--timeH = tonumber(os.date("%H",time))      --或这样
--timeM = tonumber(os.date("%M",time))
--timeS = tonumber(os.date("%S",time))
--befortime = timeH/60/60 + timeM/60 + timeS
befortime = socket.gettime()

function click(x,y)
	touchDown(x, y)
	mSleep(30)
	touchUp(x, y)
	mSleep(1000)
end

function clicktwo(x,y)
	touchDown( x, y)
	mSleep(30)
	touchUp( x, y)
	mSleep(30)
end

function clickleft(x,y)
	touchDown(36,   75)
	mSleep(30)
	touchUp(36,   75)
	mSleep(1000)
end

function CZjb()
--	time = getNetTime();         
--	timeH = tonumber(os.date("%H",time))      --或这样
--	timeM = tonumber(os.date("%M",time))
--	timeS = tonumber(os.date("%S",time))
--	nowtime = timeH/60/60 + timeM/60 + timeS
	nowtime = socket.gettime()
	runtime = nowtime - befortime--单位是秒
	if runtime >= jbcztime*60 then
		closeApp("com.amazon.Amazon")
		mSleep(3000)
		lua_restart()
	end
end

--slh = "FNNSD106G5MN,FFMPQTCRG5MD,F17Q3BR1G5MN,F4RPQBC4G5MN,F73P3C7BG5MT,DNPQ10X4G5MG,F18Q2G2ZG5MR,C38NRDZFG5MV,DNPNM9J4G5MQ,DNQPNWRLG5MF,C37NLNC0G5MV,F78PKNF8G5MR,C39NCUGGG5MV,C7KNQY9XG5MT"
--bk = ts.system.serialnumber()--获取设备的序列号，安卓不同的手机可能返回空值
--if string.find(slh,bk) then
--	mSleep(1000)
--else
--	dialog("您的手机无法运行这个脚本")
--	lua_exit(); 
--end

f = io.open(userPath().."/res/amazon任务.txt","r+")
data = f:read("*L")
alldatao = f:read("*a")--获取剩下的
writeFileString(userPath().."/res/amazon任务.txt",alldatao,"w")--重写入data
kga = strSplit(data,"|")[1]
kgb = strSplit(data,"|")[2]
kgc = strSplit(data,"|")[3]
kgd = strSplit(data,"|")[4]
kge = strSplit(data,"|")[5]
kgf = strSplit(data,"|")[6]--脚本运行时间

function onepage()
	MyTable = {
		["style"] = "custom",
		["width"] = w,
		["height"] = h,
		["timer"] = 60,
		["orient"] = 0,
		["pagetype"] = "multi",
		["title"]   =  "Amazon流程",
		["cancelname"] =  "不运行",
		["okname"]  =  "配置好了",
		["rettype"] = "table",
		["selpage"] = 1,
		pages = 
		{
			{				
				{ 
					["type"] = "Label",
					["text"] = "搜索关键词:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,40,500,60",
				},	
				{	
					["type"] = "Edit",                 
					-- 必填，控件类型，输入框
					["id"] = "searchgood",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kga,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,120,630,60",
				},
				----
				{ 
					["type"] = "Label",
					["text"] = "匹配不点击的商品:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,200,500,60",
				},	
				{
					["type"] = "TextArea",                 
					-- 必填，控件类型，输入框
					["id"] = "pipeigoodnoclick",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kgb,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,280,630,70",-- 选填，0，默认选中项 id,    
				},
				----
				{ 
					["type"] = "Label",
					["text"] = "匹配点击的商品:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,370,500,60",
				},	
				{
					["type"] = "TextArea",                 
					-- 必填，控件类型，输入框
					["id"] = "pipeigoodclick",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kgc,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,450,630,70",-- 选填，0，默认选中项 id,    
				},
				----
				{ 
					["type"] = "Label",
					["text"] = "点击次数:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,530,500,60",
				},	
				{	
					["type"] = "Edit",                 
					-- 必填，控件类型，输入框
					["id"] = "clicknum",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kgd,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,600,630,60",
				},
				----
				{ 
					["type"] = "Label",
					["text"] = "脚本次数:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,680,500,60",
				},	
				{	
					["type"] = "Edit",                 
					-- 必填，控件类型，输入框
					["id"] = "jbclicknum",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kge,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,760,630,60",
				},	
				----
				{ 
					["type"] = "Label",
					["text"] = "选择国家:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,840,500,60",
				},
				{
					["type"] = "RadioGroup",              
					-- 必填，控件类型，单选框
					["id"] = "selectGJ",
					["size"] = 20,
					["align"] = "center",
					-- 选填，无，控件 ID，以 table 格式返回返回值时必填，否则无法获取返回值
					["list"] = "美国,德国,英国",      -- 必填，无，单选框内容
					["select"] = "0",                     -- 选填，0，默认选中项 id,   
					["rect"]= "200,920,630,200",
				},	
				---
				{ 
					["type"] = "Label",
					["text"] = "脚本重置时间:",
					["size"] = 18,
					["align"] = "center",
					["color"] = "0,0,0",
					["rect"]= "100,1160,500,60",
				},	
				{	
					["type"] = "Edit",                 
					-- 必填，控件类型，输入框
					["id"] = "jbcztime",                  
					-- 选填，无，控件 ID 以 table 格式返回返回值时必填，否则无法获取返回值
					["prompt"] = "必填",                 -- 选填，无，提示文字
					["text"] = kgf,                  -- 选填，无，默认文字
					["kbtype"] = "ascii",              -- 选填，标准键盘，键盘类型
					["color"] = "0,0,0",              -- 选填，黑色，字体颜色
					["size"] = 15,                      -- 选填，15，字体大小
					["align"] = "center",
					["rect"]= "25,1240,630,60",
				},
			}
		},
	}

	local MyJsonString = cjson.encode(MyTable);
	UIret,values = showUI(MyJsonString)
	if UIret == 1 then
		searchgood = values.searchgood
		searchgood = tostring(searchgood)	

		pipeigoodnoclick = values.pipeigoodnoclick
		pipeigoodnoclick = tostring(pipeigoodnoclick)

		pipeigoodclick = values.pipeigoodclick
		pipeigoodclick = tostring(pipeigoodclick)

		clicknum = values.clicknum
		clicknum = tonumber(clicknum)

		jbclicknum = values.jbclicknum
		jbclicknum = tonumber(jbclicknum)

		selectGJ = values.selectGJ
		selectGJ = tonumber(selectGJ)

		jbcztime = values.jbcztime
		jbcztime = tonumber(jbcztime)
	else
		lua_exit()
	end
end

function Changejexpress()
	mSleep(3000)
	runApp("com.expressvpn.vpn")
	mSleep(5000)

	--打开
	x,y = findMultiColorInRegionFuzzy( 0x15d075, "-112|116|0x15d075,-5|92|0x6d6d6d,102|117|0x15d075,-14|210|0x15d075", 90, 208,  232, 492,  502)
	if x ~= -1 and y ~= -1 then
		toast("1",1)
		mSleep(500)
		click(353,  373)--关
		mSleep(3000)
	else
		mSleep(3000)
	end

	nnnnn = 0
	while (true) do
		--打开中
		x,y = findMultiColorInRegionFuzzy( 0xdddddd, "-9|-70|0xe0e0e0,7|-77|0xdddddd,-20|205|0x6d6d6d,-66|195|0x6d6d6d,13|205|0x6d6d6d", 90,  181,  226,502,  608)
		if x ~= -1 and y ~= -1 then
			toast("等待",1)
			mSleep(3000)
		else
			mSleep(3000)
			CZjb()
			nnnnn = nnnnn + 1
			if nnnnn == 30 then
				mSleep(200)
				closeApp("com.expressvpn.vpn")
				mSleep(2000)
				runing()
			end
			--出现unable to connect
			x,y = findMultiColorInRegionFuzzy( 0xc8252c, "98|-3|0xc8252c,79|33|0xffffff,69|43|0xf0c3c5,69|49|0xc8252c,156|47|0xe38e92", 90,237, 1027,470, 1141)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(364, 1092)
				break
			end
			--打开
			x,y = findMultiColorInRegionFuzzy( 0x15d075, "-6|211|0x15d075,11|151|0x6d6d6d,2|86|0x6d6d6d,105|118|0x15d075,-107|108|0x15d075", 90,  184,  223,522,  508)
			if x ~= -1 and y ~= -1 then
				mSleep(500)
				break
			end
			--不成功
			x,y = findMultiColorInRegionFuzzy( 0xf55347, "-13|216|0xf55347,-1|159|0x6d6d6d,0|93|0x6d6d6d,111|108|0xf55347,-111|102|0xf55347", 90,188,  239, 509,  505)
			if x ~= -1 and y ~= -1 then
				mSleep(2000)
				click( 353,  366)
				mSleep(3000)
			end
		end
	end
	mSleep(2000)
end

function selectGJym()
	if selectGJ == 0 then--美国
		mSleep(100)
	elseif selectGJ == 1 then--德国
		mSleep(500)
		click( 575,  448)--更改国家	
		while (true) do
			--选择国家页面
			x,y = findMultiColorInRegionFuzzy( 0x378ed4, "25|-3|0x378ed4,31|19|0x378ed4,-2|16|0x378ed4,6|10|0x7db6e3,27|11|0x91c1e7", 90,49,  400,121,  459)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(636,  801)--德国
				break
			else
				CZjb()
				toast("等待选择国家",1)
				mSleep(3000)
			end
		end		
	else
		--英国
		mSleep(500)
		click( 575,  448)--更改国家	
		while (true) do
			--选择国家页面
			x,y = findMultiColorInRegionFuzzy( 0x378ed4, "25|-3|0x378ed4,31|19|0x378ed4,-2|16|0x378ed4,6|10|0x7db6e3,27|11|0x91c1e7", 90,49,  400,121,  459)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(637, 1178)--英国
				break
			else
				CZjb()
				toast("等待选择国家",1)
				mSleep(3000)
			end
		end
	end

	--到了设置短的成功页面
	while (true) do
		--到选择短的国家语言的界面done1
		x,y = findMultiColorInRegionFuzzy( 0xf5d78e, "49|8|0xf5d587,7|28|0xf3cf76,18|51|0xf2c861,83|34|0xf3cd70,76|57|0xf1c75c", 90, 394,  827,692,  950)
		if x ~= -1 and y ~= -1 then
			mSleep(500)
			click( 365,  885)--done
			break
		else
			CZjb()
			--Done2
			x,y = findMultiColorInRegionFuzzy( 0xa88734, "-9|37|0xf5d485,57|49|0xf4d17b,10|64|0xf3cd6e,11|106|0x846a29,63|106|0x846a29", 90,386,  974, 703, 1116)
			if x ~= -1 and y ~= -1 then
				mSleep(500)
				click( 370, 1043)--done
				break
			end
			toast("等待设置成功",1)
			mSleep(3000)
		end
	end
end

function zhmmyh()
	math.randomseed(tostring(os.clock()):reverse():sub(1, 6))
	--随机姓名
	name = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
	f = math.random(1,26)--随机一个字母
	name = name[f]--首字母
	aaaa = math.random(97,122)--随机一个字母
	bbbb = math.random(97,122)--随机一个字母
	cccc = math.random(97,122)--随机一个字母
	dddd = math.random(97,122)--随机一个字母
	eeee = math.random(97,122)--随机一个字母
	ffff = math.random(97,122)--随机一个字母
	aaaa = string.char(aaaa)
	bbbb = string.char(bbbb)
	cccc = string.char(cccc)
	dddd = string.char(dddd)
	eeee = string.char(eeee)
	ffff = string.char(ffff)

	password11 = math.random(0,9)
	password22 = math.random(0,9)
	password33 = math.random(0,9)
	password44 = math.random(0,9)
	password55 = math.random(0,9)
	turename = name..aaaa..password11..bbbb..password22..cccc..password33..dddd..password44..eeee..password55..ffff

	--随机邮箱
--			emailwb = {"@v-mail.xyz","@24mail.top","@24hinbox.com","@goldinbox.net","@uhds.tk","@amantapkun.com","@ruditnugnab.xyz","@myfullstore.fun",
--				"@topfivestars.fun","@bkkpkht.ga","@ghea.ml","@lemper.cf","@besttrommler.com","@mainphp.gq","@toppartners.ml","@zeroknow.ga",
--				"@raiplay.tk","@vaik.tk","@storeclsrn.xyz","@mytrommler.com","@omdo.xyz","@themogensen.com","@newsusfun.com","@uncond.us",
--				"@mytrommleronline.com","@abanksat.us","@cakk.us","@hanoimail.us","@sunmail.ga","@sunmail.ml"}
	emailwb = {"@storeclsrn.xyz",
		"@omdo.xyz","@themogensen.com",
		"@alemalakra.com",
		"@x13x13x13.com"}

	emailsj = math.random(1,5)
	email = turename..emailwb[emailsj]
	emailwbemailsj = string.gsub(emailwb[emailsj],"@","")

	--随机密码
	xxzm = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
	f2 = math.random(1,26)--随机一个字母
	leneg2 = math.random(3,5)--随机密码字母长度
	xxzm = xxzm[f2]--首字母
	leneg3 = math.random(1,3)--随机密码数字长度
	password2 = math.random(0,9)
	for i = 1,leneg2 do
		ss2 = math.random(97,122)--数字转ansic字符的固定数字
		password1 = string.char(ss2)
		xxzm = xxzm..password1
	end
	for i = 1,leneg3 do
		ss3 = math.random(0,9)
		password2 = password2..ss3
	end
	password = xxzm..password2
	switchTSInputMethod(true);   -- 切换到触动/帮你玩输入法
end

function YONGHU()
	nnnnn = 0
	while (true) do
		--创建用户
		x,y = findMultiColorInRegionFuzzy( 0x5a5c5f, "0|9|0xb4b6ba,0|18|0xedeff1,-1|15|0x656565,27|10|0xeff0f3,40|0|0xa2a6ac", 90,201,  610,308,  721)
		if x ~= -1 and y ~= -1 then
			mSleep(3000)
			click(339,  795)--use email
			mSleep(3000)
			break
		else
			CZjb()
			toast("等待进入注册页面",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--出现不用点use email
			x,y = findMultiColorInRegionFuzzy( 0xe77600, "10|-11|0xe77600,17|-20|0xe88115,76|-2|0xf6f6f6,74|-2|0x111111,97|-10|0x111111", 90, 66,  772,382,  861)
			if x ~= -1 and y ~= -1 then
				break
			end
		end
	end

	while (true) do
		--点击use email成功
		x,y = findMultiColorInRegionFuzzy( 0xb8babb, "50|-1|0xd6d8da,80|9|0x565657,130|7|0x111111,170|12|0x111111,226|49|0xadaeb0", 90,153,  671,552,  774)
		if x ~= -1 and y ~= -1 then
			mSleep(1000)
			zhmmyh()
			
			click(188,  419)--name
			mSleep(3000)
			inputText(turename)
			mSleep(2000)
			while (true) do
				--如果名字粘贴成功
				x, y = findColorInRegionFuzzy(0x111111, 90, 238,  407,544,  460); 
				if x ~= -1 and y ~= -1 then
					break
				else
					inputText(turename)
					mSleep(2000)
				end
			end

			click(231,  555)--email
			mSleep(3000)
			inputText(email)
			mSleep(2000)
			while (true) do
				--如果邮箱粘贴成功
				x, y = findColorInRegionFuzzy(0x111111, 90,317,  542, 528,  600); 
				if x ~= -1 and y ~= -1 then
					break
				else
					inputText(email)
					mSleep(2000)
				end
			end

			click(248,  826)--password
			mSleep(3000)
			inputText(password)
			mSleep(3000)
			while (true) do
				--如果密码粘贴成功
				x, y = findColorInRegionFuzzy(0x111111, 90,317,  542,176,  905); 
				if x ~= -1 and y ~= -1 then
					break
				else
					inputText(password)
					mSleep(2000)
				end
			end
			click(376, 1264)--cretate
			writeFileString(userPath().."/res/广告点击账号.txt","账号："..email.." 密码："..password.."\r\n","a")--重写入data
			break
		else
			mSleep(1000)
			--出现不用点use email
			x,y = findMultiColorInRegionFuzzy( 0xe77600, "10|-11|0xe77600,17|-20|0xe88115,76|-2|0xf6f6f6,74|-2|0x111111,97|-10|0x111111", 90, 66,  772,382,  861)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				zhmmyh()

				click(213,  438)--name
				mSleep(3000)
				inputText(turename)
				mSleep(2000)
				while (true) do
					--如果名字粘贴成功
					x, y = findColorInRegionFuzzy(0x111111, 90,143,  406, 346,  465); 
					if x ~= -1 and y ~= -1 then
						break
					else
						inputText(turename)
						mSleep(2000)
					end
				end

				click(266,  576)--email
				mSleep(3000)
				inputText(email)
				mSleep(2000)
				while (true) do
					--如果邮箱粘贴成功
					x, y = findColorInRegionFuzzy(0x111111, 90,143,  543,424,  599); 
					if x ~= -1 and y ~= -1 then
						break
					else
						inputText(email)
						mSleep(2000)
					end
				end

				click(253,  714)--password
				mSleep(3000)
				inputText(password)
				mSleep(3000)
				while (true) do
					--如果密码粘贴成功
					x, y = findColorInRegionFuzzy(0x111111, 90,111,  692,193,  719); 
					if x ~= -1 and y ~= -1 then
						break
					else
						inputText(password)
						mSleep(2000)
					end
				end

				click(333, 1097)--cretate
				writeFileString(userPath().."/res/广告点击账号.txt","账号："..email.." 密码："..password.."\r\n","a")--重写入data
				break
			end
			click(339,  795)--use email
			mSleep(3000)
		end
	end
end

function Register()
	closeApp("com.sollyu.xposed.hook.model")
	mSleep(3000)
	runApp("com.sollyu.xposed.hook.model")	
	mSleep(5000)
	while (true) do
		x, y = findImageInRegionFuzzy(userPath().."/res/img/amazon.png", 95,20,  182,104,  871, 0xeeeeee); 
		if x ~= -1 and y ~= -1 then
			click(x,y)
			mSleep(3000)
			break
		else
			toast("等待进入AppEnv",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 20 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
		end
		CZjb()
	end
	mSleep(5000)
	click(602, 1160)--+
	click( 603,  599)--random
	click( 607,  824)--wipe
	click(600,  858)--ok
	mSleep(3000)
	runApp("com.amazon.mShop.android.shopping")	
	mSleep(5000)

	nnnnn = 0
	while (true) do
		--出现sign in
		x,y = findMultiColorInRegionFuzzy( 0xf6d994, "30|-3|0xf7db98,99|2|0xf6d992,124|35|0xf3cd6c,193|63|0xbf942a,58|-16|0xab8426", 90, 431,  710, 707,  823)
		if x ~= -1 and y ~= -1 then
			mSleep(2000)
			click(363,  871)--create
			YONGHU()
			break
		else
			CZjb()
			toast("等待出现sign in",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 20 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--第一个Done
			x,y = findMultiColorInRegionFuzzy( 0xf3cf75, "3|-2|0x111111,-10|3|0xf3ce72,16|-2|0xf3d077,58|-6|0xf4d17a,57|7|0x111111", 90, 283,  995,438, 1113)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(342, 1052)
			end
			--			--Done
			--			x,y = findMultiColorInRegionFuzzy( 0xa88734, "-11|41|0xf4d27d,106|54|0xf3cd70,33|80|0xf1c556,137|87|0xf0c24f,77|92|0x846a29", 90, 340,  866,704, 1016)
			--			if x ~= -1 and y ~= -1 then
			--				mSleep(1000)
			--				selectGJym()
			--			end
			--			--到选择短的国家语言的界面
			--			x,y = findMultiColorInRegionFuzzy( 0xa88734, "-12|13|0xf6db98,117|37|0xf4d380,7|77|0xf1c558,36|91|0x846a29,56|72|0xf1c75d", 90,376,  707, 701,  885)
			--			if x ~= -1 and y ~= -1 then
			--				mSleep(1000)
			--				selectGJym()
			--			end
		end
	end
end

function ZYYZM()
	--如果出现要输入验证码
	x,y = findMultiColorInRegionFuzzy( 0x332d20, "17|0|0x111111,-18|47|0x846a29,-8|47|0x846a29,77|47|0x846a29,77|33|0xf1c557", 90,163,  480,542,934)
	if x ~= -1 and y ~= -1 then				
		if yzmnum >= 1 then
			yzmnum = 1
		else
			yzmnum = yzmnum + 1
			toast("获取验证码",1)
			mSleep(1000)
			for i = 1,10 do
				--{"MailUrl":"https://emailfake.com/kojio/okjkkk","TargetHttpCode":"error","result":"'data'"}
				res,code = http.request("http://47.106.9.203/mail?mail=emailfake.com/"..emailwbemailsj.."/"..turename)
				--				dialog(res)
				if code == 200 then
					xunzhao = string.find(res,"203")
					if xunzhao == nil then
						tmp = json.decode(res);
						if tmp.TargetHttpCode == 200 then --成功取到验证码
							for i,w in ipairs(tmp.result) do
								YZM = w
							end	
							break
						else
							toast("没有取到验证码",1)
							mSleep(3000)--http://47.106.9.203/mail?mail=emailfake.com/@vaik.tk/Zh5w8m8h8d9z
						end
					else
						toast("获取验证码不成功啊",1)
						mSleep(3000)
					end
				else
					toast("获取验证码不成功",1)
					mSleep(3000)
				end
				if i >= 10 then
					mSleep(1000)
					closeApp("com.sollyu.xposed.hook.model")
					mSleep(2000)
					closeApp("com.amazon.mShop.android.shopping")
					mSleep(2000)
					runing()
				end
			end
			mSleep(2000)
			click(198,  466)--点击输入框
			mSleep(1000)
			inputText(YZM)
			mSleep(2000)
			click(349,  606)--点击进入
		end
	end
end

function GuanggaoMG()
	nnnnn = 0
	yzmnum = 0
	while (true) do
		--主页
		x,y = findMultiColorInRegionFuzzy( 0x00a4b4, "36|3|0x879596,45|-16|0x879596,-3|-65|0x008296,7|-27|0xffffff,2|-4|0x00a4b4", 90,  2,   43, 236,  238)
		if x ~= -1 and y ~= -1 then
			mSleep(5000)
			click( 172,  198)--输入框
			mSleep(4000)
			inputText(searchgood)
			mSleep(2000)
			os.execute("input keyevent 66")
			mSleep(2000)
			break
		else
			CZjb()
			toast("等待进入主页",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 30 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			ZYYZM()
		end
	end

	nnnnn = 0
	while (true) do
		--如果出现所有商品界面
		x, y = findColorInRegionFuzzy(0x333333, 97,356,  728,702, 1146); 
		if x ~= -1 and y ~= -1 then
			mSleep(1000)		
			break
		else
			CZjb()
			toast("等待进入广告商品页面",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--看一下广告是否粘贴成功
			x, y = findColorInRegionFuzzy(0x333333, 90,70,  165,301,  221); 
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
			else
				click( 172,  198)--输入框
				mSleep(4000)
				inputText(searchgood)
				mSleep(2000)
				os.execute("input keyevent 66")
				mSleep(2000)
			end
		end
	end
end

function GuanggaoDG()
	nnnnn = 0
	yzmnum = 0
	while (true) do
		--主页
		x,y = findMultiColorInRegionFuzzy( 0x232f3e, "85|13|0xff9900,181|-5|0xffffff,168|-4|0x58626d,169|-5|0xffffff,136|-5|0xffffff", 90, 71,   55, 312,  149)
		if x ~= -1 and y ~= -1 then
			mSleep(5000)
			click( 172,  198)--输入框
			mSleep(4000)
			inputText(searchgood)
			mSleep(4000)
			os.execute("input keyevent 66")
			mSleep(2000)
			break
		else
			CZjb()
			toast("等待进入主页",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			ZYYZM()
		end
	end

	nnnnn = 0
	while (true) do
		--如果出现所有商品界面
		x, y = findColorInRegionFuzzy(0x333333, 97,212,  741,712, 1156); 
		if x ~= -1 and y ~= -1 then
			mSleep(1000)		
			break
		else
			CZjb()
			toast("等待进入广告商品页面",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--看一下广告是否粘贴成功
			x, y = findColorInRegionFuzzy(0x333333, 90,70,  165,301,  221); 
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
			else
				click( 172,  198)--输入框
				mSleep(4000)
				inputText(searchgood)
				mSleep(2000)
				os.execute("input keyevent 66")
				mSleep(2000)
			end
		end
	end
end

function GuanggaoYG()
	nnnnn = 0
	yzmnum = 0
	while (true) do
		--主页
		x,y = findMultiColorInRegionFuzzy( 0xff9900, "88|-15|0xffffff,106|-15|0xffffff,140|-22|0x444e5b,132|-17|0xdfe1e3,84|-26|0x8c939a", 90, 89,   52, 347,  163)
		if x ~= -1 and y ~= -1 then
			mSleep(5000)
			click( 172,  198)--输入框
			mSleep(4000)
			inputText(searchgood)
			mSleep(4000)
			os.execute("input keyevent 66")
			mSleep(2000)
			break
		else
			CZjb()
			toast("等待进入主页",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end			
			ZYYZM()
		end
	end

	nnnnn = 0
	while (true) do
		--如果出现所有商品界面
		x, y = findColorInRegionFuzzy(0x333333, 97,212,  741,712, 1156); 
		if x ~= -1 and y ~= -1 then
			mSleep(1000)		
			break
		else
			CZjb()
			toast("等待进入广告商品页面",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--如果回车失败了
			x,y = findMultiColorInRegionFuzzy( 0x879596, "41|5|0x879596,-33|-5|0x6acad4,388|12|0x879596,565|1|0x00a4b4,596|5|0x26b2c0", 90,10,  154,708,  232)
			if x ~= -1 and y ~= -1 then
				toast("回车失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--看一下广告是否粘贴成功
			x, y = findColorInRegionFuzzy(0x333333, 90,70,  165,301,  221); 
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
			else
				click( 172,  198)--输入框
				mSleep(4000)
				inputText(searchgood)
				mSleep(2000)
				os.execute("input keyevent 66")
				mSleep(2000)
			end			
		end
	end
end

function spym()
	nnnnn = 0
	--加购物车
	while (true) do
		--如果出现指定商品详情界面
		x, y = findColorInRegionFuzzy(0x0066c0, 90, 4,  243,705, 1142);
		if x ~= -1 and y ~= -1 then
			mSleep(1000)
			hdcs = math.random(2,4)
			for i = 1,hdcs do
				moveTo(330, 1066,357,  250,6)
				mSleep(3000)
			end			
			mSleep(2000)
			os.execute("input keyevent 4")	
			mSleep(2000)
			break
		else
			CZjb()
			toast("等待进入",1)
			mSleep(3000)
			nnnnn = nnnnn + 1
			if nnnnn == 25 then
				mSleep(1000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--如果回车失败了
			x,y = findMultiColorInRegionFuzzy( 0x879596, "41|5|0x879596,-33|-5|0x6acad4,388|12|0x879596,565|1|0x00a4b4,596|5|0x26b2c0", 90,10,  154,708,  232)
			if x ~= -1 and y ~= -1 then
				toast("回车失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
		end
	end
end

function Guanggaonoclick()	--五个商品都没有才点击
	--识别广告商品
	while (true) do
		mSleep(2000)
		all = ocrText( 208,  436,713, 1158, 0)
		all = string.gsub(all," ","")
		sp = string.find(all,"Sponsored")
		if sp == nil then
			--如果回车失败了
			x,y = findMultiColorInRegionFuzzy( 0x879596, "41|5|0x879596,-33|-5|0x6acad4,388|12|0x879596,565|1|0x00a4b4,596|5|0x26b2c0", 90,10,  154,708,  232)
			if x ~= -1 and y ~= -1 then
				toast("回车失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--出现go to amazon home
			x,y = findMultiColorInRegionFuzzy( 0xc50505, "86|0|0xc50505,69|57|0x666666,88|99|0x878585,135|0|0xc50505,139|61|0xa3a1a1", 90, 6,  251, 484,  391)
			if x ~= -1 and y ~= -1 then
				toast("网络连接失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end		
			mSleep(1000)
			moveTo(330, 1066,357,  400)
			mSleep(5000)
		else	
			CZjb()
			spt = string.find(all,"Sponsoredby")
			if spt == nil then
				x, y = findImageInRegionFuzzy(userPath().."/res/img/Sponsored.png",95, 167,  326,707, 1190,0xffffff);
				if x ~= -1 and y ~= -1 then
					xx2 = x + 465
					yy2 = y + 230
					all = ocrText(x,y, xx2, yy2, 0)
					all = string.gsub(all," ","")
					spno1 = string.find(all,pipeigoodnoclick1)
					spno2 = string.find(all,pipeigoodnoclick2)
					spno3 = string.find(all,pipeigoodnoclick3)
					spno4 = string.find(all,pipeigoodnoclick4)
					spno5 = string.find(all,pipeigoodnoclick5)
					if spno1 == nil and spno2 == nil and spno3 == nil and spno4 == nil and spno5 == nil then
						mSleep(1000)
						click(x,y)
						mSleep(1000)
						spym()
						mSleep(2000)
						moveTo(330, 1066,357,  250)
						mSleep(5000)
						break					
					else
						--有不点击商品要滑动
						mSleep(1000)
						moveTo(330, 1066,357,  450)
						mSleep(5000)
					end	
				else
					--有不点击商品要滑动
					mSleep(1000)
					moveTo(330, 1066,357,  450)
					mSleep(5000)
				end	
			else
				--有不点击商品要滑动
				mSleep(1000)
				moveTo(330, 1066,357,  450)
				mSleep(5000)
			end
		end
	end
end

function Guanggaoclick()	--只要
	--识别广告商品
	while (true) do
		mSleep(2000)
		all = ocrText( 208,  436,713, 1158, 0)
		all = string.gsub(all," ","")
		sp = string.find(all,"Sponsored")
		if sp == nil then
			--如果回车失败了
			x,y = findMultiColorInRegionFuzzy( 0x879596, "41|5|0x879596,-33|-5|0x6acad4,388|12|0x879596,565|1|0x00a4b4,596|5|0x26b2c0", 90,10,  154,708,  232)
			if x ~= -1 and y ~= -1 then
				toast("回车失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--出现go to amazon home
			x,y = findMultiColorInRegionFuzzy( 0xc50505, "86|0|0xc50505,69|57|0x666666,88|99|0x878585,135|0|0xc50505,139|61|0xa3a1a1", 90, 6,  251, 484,  391)
			if x ~= -1 and y ~= -1 then
				toast("网络连接失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end		
			mSleep(1000)
			moveTo(330, 1066,357,  400)
			mSleep(5000)
		else
			--如果回车失败了
			x,y = findMultiColorInRegionFuzzy( 0xbec5c6, "32|4|0x879596,58|4|0xcdd3d3,100|12|0x879596,186|10|0x8c9a9b,236|4|0xb8c0c1", 90, 64,  157,485,  223)
			if x ~= -1 and y ~= -1 then
				toast("回车失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end
			--出现go to amazon home
			x,y = findMultiColorInRegionFuzzy( 0xc50505, "86|0|0xc50505,69|57|0x666666,88|99|0x878585,135|0|0xc50505,139|61|0xa3a1a1", 90, 6,  251, 484,  391)
			if x ~= -1 and y ~= -1 then
				toast("网络连接失败了",1)
				mSleep(2000)
				closeApp("com.sollyu.xposed.hook.model")
				mSleep(2000)
				closeApp("com.amazon.mShop.android.shopping")
				mSleep(2000)
				runing()
			end		
			CZjb()
			spt = string.find(all,"Sponsoredby")
			if spt == nil then
				x, y = findImageInRegionFuzzy(userPath().."/res/img/Sponsored.png",95,230,  213,709, 1157,0xffffff);
				if x ~= -1 and y ~= -1 then
					xx2 = x + 465
					yy2 = y + 230
					all = ocrText(x,y, xx2, yy2, 0)
					all = string.gsub(all," ","")
					sp1 = string.find(all,pipeigoodclick1)
					sp2 = string.find(all,pipeigoodclick2)
					sp3 = string.find(all,pipeigoodclick3)
					sp5 = string.find(all,pipeigoodclick4)
					sp4 = string.find(all,pipeigoodclick5)
					if sp1 == nil and sp2 == nil and sp3 == nil and sp4 == nil and sp5 == nil then
						mSleep(1000)
						moveTo(330, 1066,357,  450)
						mSleep(5000)
					else
						mSleep(1000)
						click(x,y)
						mSleep(300)
						spym()
						mSleep(2000)
						moveTo(330, 1066,357,  250)
						mSleep(5000)
						break		
					end	
				else
					--找到sponscoredby的时候要滑动
					mSleep(1000)
					moveTo(330, 1066,357,  450)
					mSleep(5000)
				end
			else
				--有不点击商品要滑动
				mSleep(1000)
				moveTo(330, 1066,357,  450)
				mSleep(5000)
			end
		end
	end
end

onepage()
function runing()
	for i1 = 1,jbclicknum do
		closeApp("com.sollyu.xposed.hook.model")--关闭appenv
		cleanApp("com.amazon.mShop.android.shopping")	--清空亚马逊的数据		
		Changejexpress()
		Register()

		if selectGJ == 0 then
			GuanggaoMG()
		elseif selectGJ == 1 then
			GuanggaoDG()
		else
			GuanggaoYG()
		end

		if pipeigoodclick == "0" then--如果不跑需要点击的
			pipeigoodnoclick = string.gsub(pipeigoodnoclick," ","")--不点击的商品
			pipeigoodnoclick1 = strSplit(pipeigoodnoclick,"-")[1]
			pipeigoodnoclick2 = strSplit(pipeigoodnoclick,"-")[2]
			pipeigoodnoclick3 = strSplit(pipeigoodnoclick,"-")[3]
			pipeigoodnoclick4 = strSplit(pipeigoodnoclick,"-")[4]
			pipeigoodnoclick5 = strSplit(pipeigoodnoclick,"-")[5]
			for i2 = 1,clicknum do
				mSleep(1000)
				toast("脚本运行：第"..i1.."次循环的"..i2.."个点击",2)
				mSleep(1000)
				Guanggaonoclick()	
			end
		else
			pipeigoodclick = string.gsub(pipeigoodclick," ","")--需要点击的商品
			pipeigoodclick1 = strSplit(pipeigoodclick,"-")[1]
			pipeigoodclick2 = strSplit(pipeigoodclick,"-")[2]
			pipeigoodclick3 = strSplit(pipeigoodclick,"-")[3]
			pipeigoodclick4 = strSplit(pipeigoodclick,"-")[4]
			pipeigoodclick5 = strSplit(pipeigoodclick,"-")[5]
			for i2 = 1,clicknum do
				mSleep(1000)
				toast("脚本运行：第"..i1.."次循环的"..i2.."个点击",2)
				mSleep(1000)
				Guanggaoclick()	
			end
		end
	end
end
runing()

--				x, y = findImageInRegionFuzzy(userPath().."/res/img/Sponsoredby.png",98,230,  213,709, 1157,0xffffff);
--				if x ~= -1 and y ~= -1 then
--					mSleep(1000)
--					click(x,y)				
--					while (true) do
--						x, y = findColorInRegionFuzzy(0x333333, 90,232,  737,703, 1191); 
--						if x ~= -1 and y ~= -1 then
--							mSleep(1000)
--							click(547,  646)
--							mSleep(300)
--							spym()
--							mSleep(2000)
--							os.execute("input keyevent 4")	
--							mSleep(2000)
--							os.execute("input keyevent 66")	
--							mSleep(2000)
--							moveTo(330, 1066,357,  250,6)
--							mSleep(5000)
--							break
--						end
--					end
--				end

function lz(...)
	while (true) do
		--出现美国页面
		x,y = findMultiColorInRegionFuzzy( 0x375688, "10|4|0xd56476,19|16|0xd68492,21|10|0xd97384,4|4|0x415f8e,14|4|0xd56275", 90, 58,  615,148,  670)
		if x ~= -1 and y ~= -1 then
			if selectGJ == 0 then--美国
				mSleep(500)
			elseif selectGJ == 1 then--德国
				mSleep(500)
				click(203,  580)--点美国修改国家
				while (true) do
					--进入选择国家页面
					x,y = findMultiColorInRegionFuzzy( 0x378ed4, "3|185|0xbcafbe,22|332|0xe31937,-13|326|0xe31937,11|336|0xffffff,5|327|0xe31937", 90,46,  308,131,  710)
					if x ~= -1 and y ~= -1 then
						mSleep(500)
						click(281,  821)--德国
						break
					else
						toast("等待进入选择国家页面",1)
						mSleep(3000)
					end
				end
			else
				mSleep(500)
				click(203,  580)--点美国修改国家
				while (true) do
					--进入选择国家页面
					x,y = findMultiColorInRegionFuzzy( 0x378ed4, "3|185|0xbcafbe,22|332|0xe31937,-13|326|0xe31937,11|336|0xffffff,5|327|0xe31937", 90,46,  308,131,  710)
					if x ~= -1 and y ~= -1 then
						mSleep(500)
						click(264, 1241)--英国
						break
					else
						toast("等待进入选择国家页面",1)
						mSleep(3000)
					end
				end
			end			
			break
		else
			toast("等待进入amazon",1)
			mSleep(3000)
			--出现sign in
			x,y = findMultiColorInRegionFuzzy( 0xf6d994, "30|-3|0xf7db98,99|2|0xf6d992,124|35|0xf3cd6c,193|63|0xbf942a,58|-16|0xab8426", 90, 431,  710, 707,  823)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(363,  871)--create
				--				YONGHU()
				break
			end
			--第一个Done
			x,y = findMultiColorInRegionFuzzy( 0xf3cf75, "3|-2|0x111111,-10|3|0xf3ce72,16|-2|0xf3d077,58|-6|0xf4d17a,57|7|0x111111", 90, 283,  995,438, 1113)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(342, 1052)
			end
			--			--到选择短的国家语言的界面
			x,y = findMultiColorInRegionFuzzy( 0xa88734, "-12|13|0xf6db98,117|37|0xf4d380,7|77|0xf1c558,36|91|0x846a29,56|72|0xf1c75d", 90,376,  707, 701,  885)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				selectGJym()
			end
			--出现了网络问题
			x,y = findMultiColorInRegionFuzzy( 0x949b9b, "9|6|0x6c7778,27|17|0x6c7778,33|17|0xbabfbe,14|20|0xa9b0af,20|11|0xb2b7b6", 90,584, 1192,645, 1230)
			if x ~= -1 and y ~= -1 then
				mSleep(1000)
				click(357, 1153)--再点一次
			end
		end
	end
end
