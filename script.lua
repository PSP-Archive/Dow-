--ladevorgang
function loadprogress()
lscr = Image.load("gfx/lscr.png")
psps = Image.load("gfx/psps.png")
bumuckl = Image.load("gfx/bumuckl.png")
neoflash = Image.load("gfx/neoflash.png")
ldgreen = Color.new(61,117,33) 

screen:blit(0, 0, neoflash, false)
screen.flip()
screen:clear() 
screen.waitVblankStart(300)

screen:blit(0, 0, psps, false)
screen.flip()
screen:clear() 
screen.waitVblankStart(180)

screen:blit(0, 0, bumuckl, false)
screen.flip()
screen:clear() 
screen.waitVblankStart(180)

vtime = 1200 
ldbarwd = 1

while true do

   if ldbarwd and ldbarwd <= 200 then
   ldbarwd = ldbarwd + 1
   end

   screen:blit(0,0,lscr)
   screen:fillRect(132,187,ldbarwd,13,ldgreen) 
   
   if ldbarwd==200 then
   main()
   end
   
   screen.flip()
   screen.waitVblankStart()

end
end

function main()

 System.setHigh()
 appdir = System.currentDirectory()
 dofile("config.cfg") 

 black = Color.new(0,0,0)
 white = Color.new(235,235,235)
 white2 = Color.new(196,196,196) 
 red = Color.new(255,0,0) 
 wq = System.currentDirectory()
 bg = Image.load("gfx/background.png")
 dow = Image.load("gfx/dow.png")

 content = {} 
 line = 1  
 content[line] = ""
 cy=30
 cx=50
 ry=35
 scrolly = 228
 editormode = 0
 
 kb_bg = Image.load("gfx/osk_bg.png")
 kb_overlay = Image.load("gfx/osk_main.png")
 kb_overlayB = Image.load("gfx/osk_num.png")
 kb_overlayA = Image.load("gfx/osk_A.png")
 kb_highlight = Image.load("gfx/highlight.png")
 kb_select = Image.load("gfx/osk_select.png")
 kb_highlight_mode = Image.load("gfx/highlight_mode.png")
 kb_funcbg = Image.load("gfx/osk_funcbg.png") 
 
  select = { }
  leer = { }
  nav1_content = {}
  nav5_content = {"for","do","while","true","false","if","then","end","function","and","break","else","elseif","in","local","nil","not","or","repeat","return","until"} 
  nav6_content = {"Font.load();","Font:setPixelSizes();","Font:getTextSize();","Image.createEmpty();","Image.load();","screen:blit();","screen:clear();","screen:fillRect();","screen:drawLine();","screen:pixel();","screen:print();","screen:fontPrint();","screen:width();","screen:height();","screen:save();","screen.flip();","screen.waitVblankStart();","Color.new();","color:colors();"} 
  nav7_content = {"Controls.read();","pad:select()","pad:start()","pad:up()","pad:right()","pad:down()","pad:left()","pad:l()","pad:r()","pad:triangle()","pad:circle()","pad:cross()","pad:square()","pad:home()","pad:hold()","pad:note()","pad:analogX()","pad:analogY()"}
  nav8_content = {"Music.playFile()","Music.pause()","Music.resume()","Music.stop()","Music.playing()","Music.volume()","Sound.load()","sound:play()","Mp3.load();","Mp3.play();","Mp3.pause();","Mp3.stop();","Mp3.EndOfStream()","Mp3.getTime();","Mp3.volume();","Mp3me.load();","Mp3me.play();","Mp3me.Stop();","Mp3me.eos()","Mp3me.getTime();","Mp3me.percent();","Mp3me.pause();","aa3me.load();","aa3me.play();","aa3me.Stop();","aa3me.eos()","aa3me.getTime();","aa3me.percent();","aa3me.pause();"}
  nav9_content = {"screen.flip();","screen.waitVblankStart();","Os.Exit();","System.currentDirectory();","System.listDirectory();","System.createDirectory();","System.removeDirectory();","System.removeFile();","System.usbDiskModeActivate();","System.usbDiskModeDeactivate();","System.md5sum();","System.sleep();","System.irdaInit();","System.irdaWrite();","System.irdaRead();","System.getFreeMemory();","System.powerIsPowerOnline();","System.powerIsBatteryExist();","System.powerIsBatteryCharging();","System.powerGetBatteryChargingStatus();","System.powerIsLowBattery();","System.powerGetBatteryLifePercent();",
"System.powerGetBatteryLifeTime();","System.powerGetBatteryTemp();","System.powerGetBatteryVolt();","System.powerTick();","System.sioInit();","System.sioWrite();","System.sioRead();","System.Quit();","System.nickName()","System.setLow();","System.setReg();","System.setHigh();","io.close()","io.open()","io.flush()","io.write","io.lines()","System.setcpuspeed();","System.runeboot();","System.unassign()","System.assign();","System.memclean();","System.startAudio();","System.endAudio();","System.loadExec()"} 
 nav10_content = {"math.abs","math.acos","math.asin","math.atan","math.atan2","math.ceil","math.cos","math.deg","math.exp","math.floor","math.frexp","math.ldexp","math.log","math.log10","math.max","math.min","math.mod","math.pi","math.pow","math.rad","math.random","math.randomseed","math.sin","math.sqrt","math.tan"} 
 nav11_content = {"Timer.new();","Timer:start();","Timer:time();","Timer:stop();","Timer:reset();"} 
 nav12_content = {"table.concat()","table.foreach()","table.getn()","table.sort()","table.insert()","table.remove()","table.setn()"}
 nav13_content = {"string.byte()","string.char()","string.find()","string.format()","string.len()","string.lower()","string.rep()","string.sub()","string.upper()"}
 nav14_content = {"Wlan.init();","Wlan.term();","Wlan.getConnectionConfigs();","Wlan.useConnectionConfig();","Wlan.getIPAddress();","Socket.connect();","Socket:isConnected();","Socket:createServerSocket();","Socket:accept();","Socket:recv();","Socket:send();","Socket:close();"}
 nav15_content = {"Preset 1","Preset 2","Preset 3","Preset 4","Preset 5","Preset 6","Preset 7","Preset 8","Preset 9"}
 nav16_content = {"Function 1","Function 2","Function 3","Function 4","Function 5","Function 6","Function 7","Function 8","Function 9"}
 
 preset = {
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 }
 
 for i=1,9 do
   for line in io.lines(appdir.."/presets/"..i..".lua") do
   if string.sub(line,-2) == "\n" then
   table.insert(preset[i], string.sub(line,1,string.len(line)-2)) 
   elseif line == "\n" then 
   table.insert(preset[i], "")
   else
   table.insert(preset[i], line) 
   end
   end
 end
 
 func = {
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 {},
 }
 
 for i=1,9 do
   for line in io.lines(appdir.."/functions/"..i..".lua") do
   if string.sub(line,-2) == "\n" then
   table.insert(func[i], string.sub(line,1,string.len(line)-2)) 
   elseif line == "\n" then 
   table.insert(func[i], "")
   else
   table.insert(func[i], line) 
   end
   end
 end
 
 myCommands = {} 
 
 for line in io.lines(appdir.."/myCommands.txt") do
  if string.sub(line,-2) == "\n" then
  table.insert(myCommands, string.sub(line,1,string.len(line)-2)) 
  elseif line == "\n" then 
  table.insert(myCommands, "")
  else
  table.insert(myCommands, line) 
  end
 end
 
 topmenu = Image.load("gfx/topmenu.png")
 hover = Image.load("gfx/hover.png")
 txt_hover = Image.load("gfx/txt_hover.png") 
 txt = Image.load("gfx/txt.png")
 fbbg = Image.load("gfx/bg.png") 
 nav = 1
 nav_1 = 1
 nav_5 = 1
 nav_6 = 1
 nav_7 = 1
 nav_8 = 1
 nav_9 = 1
 nav_10 = 1
 nav_11 = 1
 nav_12 = 1
 nav_13 = 1
 nav_14 = 1
 nav_15 = 1
 nav_16 = 1
 nav_17 = 1
 navx = -11
 navy = -9
 k = 32
 s = 1
 z=1
 fl=System.listDirectory()
 nf=table.getn(fl) 
 
 scrollnum = 1

 mode = 0
 nem = 0
 
 text = ""
 
 System.currentDirectory("ms0:/")
 
 oldpad = Controls.read()
 
 function osk()
textInputed = false
text=""
while (textInputed == false) do
oldPad = pad
pad = Controls.read()

dx = pad:analogX()
dy = pad:analogY()

screen:blit(0,0,kb_funcbg,true) 

if (dx > 64) then
    select.x = 3

    if (dy > 64) then
    hx=407
    hy=135
    elseif (dy < -64) then
    hx=407
    hy=37
    else
    hx=407
    hy=86
    end

    elseif (dx < -64) then

    select.x = 1

    if (dy > 64) then
    hx=309
    hy=135
    elseif (dy < -64) then
    hx=309
    hy=37
    else
    hx=309
    hy=86
    end

    else

    select.x = 2

    if (dy > 64) then
    hx=358
    hy=135
    elseif (dy < -64) then
    hx=358
    hy=37
    else
    hx=358
    hy=86
    end

    end
    if (dy > 64) then
    select.y = 3
    elseif (dy < -64) then
    select.y = 1
    else
    select.y = 2
    end 
	if mode == 0 then
	mx = 309
	my = 191
	end
	if mode == 1 then
	mx = 359
	my = 191
	end
	if mode == 2 then
	mx = 409
	my = 191
	end

if (pad ~= oldPad) then

if mode == 0 then --smal letters
      if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  text = text.."a"
      end
	  if pad:cross() then
	  text = text.."b"
      end
	  if pad:circle() then
	  text = text.."c"
      end
	  if pad:triangle() then
	  text = text..","
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  text = text.."d"
      end
	  if pad:cross() then
	  text = text.."e"
      end
	  if pad:circle() then
	  text = text.."f"
      end
	  if pad:triangle() then
	  text = text.."."
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  text = text.."g"
      end
	  if pad:cross() then
	  text = text.."h"
      end
	  if pad:circle() then
	  text = text.."i"
      end
	  if pad:triangle() then
	  text = text.."!"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  text = text.."j"
      end
	  if pad:cross() then
	  text = text.."k"
      end
	  if pad:circle() then
	  text = text.."l"
      end
	  if pad:triangle() then
	  text = text.."-"
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  text = text.."m"
      end
	  if pad:cross() then
	  text = text.." "
      end
	  if pad:circle() then
	  text = text.."n"
      end
	  if pad:triangle() then 
	  length = string.len(text)
	  text=string.sub(text, 1,length-1)
	  end
	  end
	  
	  if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  text = text.."o"
      end
	  if pad:cross() then
	  text = text.."p"
      end
	  if pad:circle() then
	  text = text.."q"
      end
	  if pad:triangle() then
	  text = text.."?"
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  text = text.."r"
      end
	  if pad:cross() then
	  text = text.."s"
      end
	  if pad:circle() then
	  text = text.."t"
      end
	  if pad:triangle() then
	  text = text.."("
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  text = text.."u"
      end
	  if pad:cross() then
	  text = text.."v"
      end
	  if pad:circle() then
	  text = text.."w"
      end
	  if pad:triangle() then
	  text = text..":"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  text = text.."x"
      end
	  if pad:cross() then
	  text = text.."y"
      end
	  if pad:circle() then
	  text = text.."z"
      end
	  if pad:triangle() then
	  text = text..")"
      end
	  end
	  end
	  
	  if mode == 1 then --capital letters
	  if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  text = text.."A"
      end
	  if pad:cross() then
	  text = text.."B"
      end
	  if pad:circle() then
	  text = text.."C"
      end
	  if pad:triangle() then
	  text = text..","
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  text = text.."D"
      end
	  if pad:cross() then
	  text = text.."E"
      end
	  if pad:circle() then
	  text = text.."F"
      end
	  if pad:triangle() then
	  text = text.."."
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  text = text.."G"
      end
	  if pad:cross() then
	  text = text.."H"
      end
	  if pad:circle() then
	  text = text.."I"
      end
	  if pad:triangle() then
	  text = text.."!"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  text = text.."J"
      end
	  if pad:cross() then
	  text = text.."K"
      end
	  if pad:circle() then
	  text = text.."L"
      end
	  if pad:triangle() then
	  text = text.."-"
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  text = text.."M"
      end
	  if pad:cross() then
	  text = text.." "
      end
	  if pad:circle() then
	  text = text.."N"
      end
	  if pad:triangle() then 
	  length = string.len(text)
	  text=string.sub(text, 1,length-1)
	  end
	  end
	  
	 
	 if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  text = text.."O"
      end
	  if pad:cross() then
	  text = text.."P"
      end
	  if pad:circle() then
	  text = text.."Q"
      end
	  if pad:triangle() then
	  text = text.."?"
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  text = text.."R"
      end
	  if pad:cross() then
	  text = text.."S"
      end
	  if pad:circle() then
	  text = text.."T"
      end
	  if pad:triangle() then
	  text = text.."("
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  text = text.."U"
      end
	  if pad:cross() then
	  text = text.."V"
      end
	  if pad:circle() then
	  text = text.."W"
      end
	  if pad:triangle() then
	  text = text..":"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  text = text.."X"
      end
	  if pad:cross() then
	  text = text.."Y"
      end
	  if pad:circle() then
	  text = text.."Z"
      end
	  if pad:triangle() then
	  text = text..")"
      end
	  end
	  end
	  
	  if mode == 2 then --num and specialsymbols
	  if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  text = text.."<"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."1"
      end
	  if pad:triangle() then
	  text = text.."["
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  text = text..">"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."2"
      end
	  if pad:triangle() then
	  text = text.."="
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  text = text.."*"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."3"
      end
	  if pad:triangle() then
	  text = text.."]"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  text = text.."_"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."4"
      end
	  if pad:triangle() then
	  text = text..""
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  text = text.."+"
      end
	  if pad:cross() then
	  text = text.." "
      end
	  if pad:circle() then
	  text = text.."5"
      end
	  if pad:triangle() then 
	   length = string.len(text)
	   text=string.sub(text, 1,length-1)
	  end
	  end
	  
	  if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  text = text.."-"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."6"
      end
	  if pad:triangle() then
	  text = text..""
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  text = text.."'"
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."7"
      end
	  if pad:triangle() then
	  text = text.."{"
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  text = text.."\""
      end
	  if pad:cross() then
	  text = text..""
      end
	  if pad:circle() then
	  text = text.."8"
      end
	  if pad:triangle() then
	  text = text.."\\"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  text = text.."/"
      end
	  if pad:cross() then
	  text = text.."0"
      end
	  if pad:circle() then
	  text = text.."9"
      end
	  if pad:triangle() then
	  text = text.."}"
      end
	  end
	  end  


if pad:right() then mode = mode + 1 end
	  if pad:left() then mode = mode - 1 end
	  if mode < 0 then mode = 2 end
	  if mode > 2 then mode = 0 end

if (pad:r()) then
textInputed = true
nem=nem-1
end

end

screen:blit(-160, 50, kb_bg,true)
screen:blit(hx-160, hy+50, kb_highlight,true)
screen:blit(mx-160, my+50, kb_highlight_mode,true)
screen:blit(-160, 50, kb_select,true)
if (mode == 0) then
screen:blit(-160, 50, kb_overlay,true)
end
if (mode == 1)then
screen:blit(-160, 50, kb_overlayA,true)
end
if (mode == 2) then
screen:blit(-160, 50, kb_overlayB,true)
end
screen:print(130, 64, text, black)
screen.flip()
screen.waitVblankStart()

end
return text
end

function menu(x,y,content,subcontent,subcontentstate,selection)
 if table.getn(content) <= 10 then --less than 10 entries
  for i=1,table.getn(content) do
  screen:blit(x,y+(i*20),txt)
  end
  screen:blit(x-17,y+(20*selection),txt_hover)
  for i=1,table.getn(content) do
  if string.len(content[i]) > 15 then
  screen:print(x+13,y+(i*20)+5,string.sub(content[i],1,12).."...",black)
  else
  screen:print(x+13,y+(i*20)+5,content[i],black)
  end
  end
 end
  if table.getn(content) > 10 and table.getn(content) <= 20 then --less than 20 entries
   if selection <= 10 then
    for i=1,10 do
    screen:blit(x,y+(i*20),txt)
    end
    screen:blit(x-17,y+(20*selection),txt_hover)
    for i=1,10 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+(i*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+(i*20)+5,content[i],black)
    end
   end
   end
   if selection <= 20 and selection > 10 then
    for i=11,table.getn(content) do
    screen:blit(x,y+((i-10)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-10)),txt_hover)
    for i=11,table.getn(content) do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-10)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-10)*20)+5,content[i],black)
    end
   end
  end
  end
  if table.getn(content) > 20 and table.getn(content) <= 30 then --less than 30 entries
   if selection <= 10 then
    for i=1,10 do
    screen:blit(x,y+(i*20),txt)
    end
    screen:blit(x-17,y+(20*selection),txt_hover)
    for i=1,10 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+(i*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+(i*20)+5,content[i],black)
    end
	end
   end
   if selection <= 20 and selection > 10 then
    for i=11,20 do
    screen:blit(x,y+((i-10)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-10)),txt_hover)
    for i=11,20 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+((i-10)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-10)*20)+5,content[i],black)
    end
	end
   end
   if selection > 20 and selection <= 30 then
    for i=21,table.getn(content) do
    screen:blit(x,y+((i-20)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-20)),txt_hover)
    for i=21,table.getn(content) do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-20)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-20)*20)+5,content[i],black)
    end
   end
   end
  end
  if table.getn(content) > 30 and table.getn(content) <= 40 then --less than 40 entries
   if selection <= 10 then
    for i=1,10 do
    screen:blit(x,y+(i*20),txt)
    end
    screen:blit(x-17,y+(20*selection),txt_hover)
    for i=1,10 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+(i*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+(i*20)+5,content[i],black)
    end
	end
   end
   if selection <= 20 and selection > 10 then
    for i=11,20 do
    screen:blit(x,y+((i-10)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-10)),txt_hover)
    for i=11,20 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+((i-10)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-10)*20)+5,content[i],black)
    end
	end
   end
   if selection <= 30 and selection > 20 then
    for i=21,30 do
    screen:blit(x,y+((i-20)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-20)),txt_hover)
    for i=21,30 do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-20)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-20)*20)+5,content[i],black)
    end
   end
   end
   if selection > 30 and selection <= 40 then
    for i=31,table.getn(content) do
    screen:blit(x,y+((i-30)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-30)),txt_hover)
    for i=31,table.getn(content) do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-30)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-30)*20)+5,content[i],black)
    end
   end
   end
  end
  if table.getn(content) > 40 and table.getn(content) <= 50 then --less than 50 entries
   if selection <= 10 then
    for i=1,10 do
    screen:blit(x,y+(i*20),txt)
    end
    screen:blit(x-17,y+(20*selection),txt_hover)
    for i=1,10 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+(i*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+(i*20)+5,content[i],black)
    end
	end
   end
   if selection <= 20 and selection > 10 then
    for i=11,20 do
    screen:blit(x,y+((i-10)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-10)),txt_hover)
    for i=11,20 do
    if string.len(content[i]) > 15 then
    screen:print(x+13,y+((i-10)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-10)*20)+5,content[i],black)
    end
	end
   end
   if selection <= 30 and selection > 20 then
    for i=21,30 do
    screen:blit(x,y+((i-20)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-20)),txt_hover)
    for i=21,30 do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-20)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-20)*20)+5,content[i],black)
    end
   end
   end
   if selection > 30 and selection <= 40 then
    for i=31,40 do
    screen:blit(x,y+((i-30)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-30)),txt_hover)
    for i=31,40 do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-30)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-30)*20)+5,content[i],black)
    end
   end
   end
   if selection > 40 and selection <= 50 then
    for i=41,table.getn(content) do
    screen:blit(x,y+((i-40)*20),txt)
    end
    screen:blit(x-17,y+(20*(selection-40)),txt_hover)
    for i=41,table.getn(content) do
    if string.len(content[i]) > 15 then
	screen:print(x+13,y+((i-40)*20)+5,string.sub(content[i],1,12).."...",black)
    else
    screen:print(x+13,y+((i-40)*20)+5,content[i],black)
    end
   end
   end
  end
end



 while true do
   pad = Controls.read()
   dx = pad:analogX()
   dy = pad:analogY()  
   
   screen:fillRect(0,0,480,272,white) 
   
   for line=1,table.getn(content) do
   screen:print(cx,cy+line*10,content[line], black)
   end
   
   for line=1,table.getn(content) do
   screen:fillRect(5,ry,40,230,white2) 
   end   
   
   
   for line=1,table.getn(content) do
   screen:print(10,cy+line*10,line, black)
   end
   if editormode == 2 then
   screen:print(10,cy+line*10,line, red)
   end
    
   screen:blit(0,0,bg,true)
   
   length = string.len(content[line])

   if s < 27 then k = 0 end

   for i = 1,10 do
   if s > i*27-1 and s < i*27 + 27 then k = -270*i end
   end
 
   if pad ~= oldpad then --padarea start
	  if editormode == 0 then--manual type
	  if mode == 0 then --smal letters
      if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."a"
      end
	  if pad:cross() then
	  content[line] = content[line].."b"
      end
	  if pad:circle() then
	  content[line] = content[line].."c"
      end
	  if pad:triangle() then
	  content[line] = content[line]..","
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."d"
      end
	  if pad:cross() then
	  content[line] = content[line].."e"
      end
	  if pad:circle() then
	  content[line] = content[line].."f"
      end
	  if pad:triangle() then
	  content[line] = content[line].."."
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."g"
      end
	  if pad:cross() then
	  content[line] = content[line].."h"
      end
	  if pad:circle() then
	  content[line] = content[line].."i"
      end
	  if pad:triangle() then
	  content[line] = content[line].."!"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."j"
      end
	  if pad:cross() then
	  content[line] = content[line].."k"
      end
	  if pad:circle() then
	  content[line] = content[line].."l"
      end
	  if pad:triangle() then
	  content[line] = content[line].."-"
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."m"
      end
	  if pad:cross() then
	  content[line] = content[line].." "
      end
	  if pad:circle() then
	  content[line] = content[line].."n"
      end
	  if pad:triangle() then 
	  content[line]=string.sub(content[line], 1,length-1)
	   if string.len(content[line]) == 0 and line > 1 then
	   line = line - 1
	   length = string.len(content[line])
	   content[line]=string.sub(content[line], 1,length-1)
	   end
	  end
	  end
	  
	  if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."o"
      end
	  if pad:cross() then
	  content[line] = content[line].."p"
      end
	  if pad:circle() then
	  content[line] = content[line].."q"
      end
	  if pad:triangle() then
	  content[line] = content[line].."?"
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."r"
      end
	  if pad:cross() then
	  content[line] = content[line].."s"
      end
	  if pad:circle() then
	  content[line] = content[line].."t"
      end
	  if pad:triangle() then
	  content[line] = content[line].."("
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."u"
      end
	  if pad:cross() then
	  content[line] = content[line].."v"
      end
	  if pad:circle() then
	  content[line] = content[line].."w"
      end
	  if pad:triangle() then
	  content[line] = content[line]..":"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."x"
      end
	  if pad:cross() then
	  content[line] = content[line].."y"
      end
	  if pad:circle() then
	  content[line] = content[line].."z"
      end
	  if pad:triangle() then
	  content[line] = content[line]..")"
      end
	  end
	  end
	  
	  if mode == 1 then --capital letters
	  if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."A"
      end
	  if pad:cross() then
	  content[line] = content[line].."B"
      end
	  if pad:circle() then
	  content[line] = content[line].."C"
      end
	  if pad:triangle() then
	  content[line] = content[line]..","
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."D"
      end
	  if pad:cross() then
	  content[line] = content[line].."E"
      end
	  if pad:circle() then
	  content[line] = content[line].."F"
      end
	  if pad:triangle() then
	  content[line] = content[line].."."
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."G"
      end
	  if pad:cross() then
	  content[line] = content[line].."H"
      end
	  if pad:circle() then
	  content[line] = content[line].."I"
      end
	  if pad:triangle() then
	  content[line] = content[line].."!"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."J"
      end
	  if pad:cross() then
	  content[line] = content[line].."K"
      end
	  if pad:circle() then
	  content[line] = content[line].."L"
      end
	  if pad:triangle() then
	  content[line] = content[line].."-"
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."M"
      end
	  if pad:cross() then
	  content[line] = content[line].." "
      end
	  if pad:circle() then
	  content[line] = content[line].."N"
      end
	  if pad:triangle() then 
	  content[line]=string.sub(content[line], 1,length-1)
	   if string.len(content[line]) == 0 and line > 1 then
	   line = line - 1
	   length = string.len(content[line])
	   content[line]=string.sub(content[line], 1,length-1)
	   end
	  end
	  end
	  
	 
	 if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."O"
      end
	  if pad:cross() then
	  content[line] = content[line].."P"
      end
	  if pad:circle() then
	  content[line] = content[line].."Q"
      end
	  if pad:triangle() then
	  content[line] = content[line].."?"
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."R"
      end
	  if pad:cross() then
	  content[line] = content[line].."S"
      end
	  if pad:circle() then
	  content[line] = content[line].."T"
      end
	  if pad:triangle() then
	  content[line] = content[line].."("
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."U"
      end
	  if pad:cross() then
	  content[line] = content[line].."V"
      end
	  if pad:circle() then
	  content[line] = content[line].."W"
      end
	  if pad:triangle() then
	  content[line] = content[line]..":"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."X"
      end
	  if pad:cross() then
	  content[line] = content[line].."Y"
      end
	  if pad:circle() then
	  content[line] = content[line].."Z"
      end
	  if pad:triangle() then
	  content[line] = content[line]..")"
      end
	  end
	  end
	  
	  if mode == 2 then --num and specialsymbols
	  if select.y == 1 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."<"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."1"
      end
	  if pad:triangle() then
	  content[line] = content[line].."["
      end
	  end
	  
	  if select.y == 1 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line]..">"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."2"
      end
	  if pad:triangle() then
	  content[line] = content[line].."="
      end
	  end
	  
	  if select.y == 1 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."*"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."3"
      end
	  if pad:triangle() then
	  content[line] = content[line].."]"
      end
	  end
	  
	  if select.y == 2 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."_"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."4"
      end
	  if pad:triangle() then
	  content[line] = content[line]..""
      end
	  end
	   
	  if select.y == 2 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."+"
      end
	  if pad:cross() then
	  content[line] = content[line].." "
      end
	  if pad:circle() then
	  content[line] = content[line].."5"
      end
	  if pad:triangle() then 
	  content[line]=string.sub(content[line], 1,length-1)
	   if string.len(content[line]) == 0 and line > 1 then
	   line = line - 1
	   length = string.len(content[line])
	   content[line]=string.sub(content[line], 1,length-1)
	   end
	  end
	  end
	  
	  if select.y == 2 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."-"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."6"
      end
	  if pad:triangle() then
	  content[line] = content[line]..""
      end
	  end
	  
	  if select.y == 3 and select.x == 1 then
	  if pad:square() then
	  content[line] = content[line].."'"
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."7"
      end
	  if pad:triangle() then
	  content[line] = content[line].."{"
      end
	  end
	  
	  if select.y == 3 and select.x == 2 then
	  if pad:square() then
	  content[line] = content[line].."\""
      end
	  if pad:cross() then
	  content[line] = content[line]..""
      end
	  if pad:circle() then
	  content[line] = content[line].."8"
      end
	  if pad:triangle() then
	  content[line] = content[line].."\\"
      end
	  end
	  
	  if select.y == 3 and select.x == 3 then
	  if pad:square() then
	  content[line] = content[line].."/"
      end
	  if pad:cross() then
	  content[line] = content[line].."0"
      end
	  if pad:circle() then
	  content[line] = content[line].."9"
      end
	  if pad:triangle() then
	  content[line] = content[line].."}"
      end
	  end
	  end  
	  end
	  
	  if editormode == 0 then
	  if pad:right() then mode = mode + 1 end
	  if pad:left() then mode = mode - 1 end
	  if mode < 0 then mode = 2 end
	  if mode > 2 then mode = 0 end
	  end
	  
	  
	  if editormode == 2 then
	  if pad:up() then 
	  line = line - 1 
	    if line < 22*(scrollnum-1) then
	    cy=cy+220
		scrollnum = scrollnum-1
	    end
	  end
	  if pad:down() then 
	  line = line + 1 
        if line > 22*scrollnum then
	    cy=cy-220
		scrollnum=scrollnum+1
	    end
	  end
	  if line < 1 then line = 1 end
	  if line > table.getn(content) then line = table.getn(content) end
	  if pad:right() then cx = cx - 10 end
	  if pad:left() then cx = cx + 10 end
	  if cx > 50 then cx = 50 end
	  if cx < -100 then cx = -100 end
	  end
	  
	  if pad:start() then editormode = editormode + 1 end
	  if editormode > 2 then editormode = 0 end
	  
	  if editormode == 1 then
	  if pad:right() then nav = nav + 1 end
	  if pad:left() then nav = nav  - 1 end
	  if nav > 17 then nav = 1 end
	  if nav < 1 then nav = 17 end
	  if nav == 1 then
	   if nav_1==1 then
	   if pad:cross() then
       nem = nem+1
       end
       if pad:triangle() then 
       nem = nem-1
       end
	   if nem > 1 then nem = 1 end
	   if nem < 0 then nem = 0 end
	   end
	  if pad:up() and nem == 0 then nav_1 = nav_1 - 1 end
	  if pad:down() and nem == 0 then nav_1 = nav_1 + 1 end
	  if nav_1 == 3 then
	  if pad:cross() then
       nem = nem+1
       end
       if pad:triangle() then 
       nem = nem-1
       end
	   if nem > 1 then nem = 1 end
	   if nem < 0 then nem = 0 end
	   if nem == 1 then
	   if pad:down() then s = s + 1 end
       if pad:up() then s = s - 1 end
	   if s > nf then s = 1 end
	   if s < 1 then s = nf end
       if pad:cross() and fl[s].directory == true then
       System.currentDirectory(fl[s].name)
       s = 1
       fl=System.listDirectory()
       nf=table.getn(fl)
       end
	   end
	  end
	  end
	  if nav == 2 then
	   if pad:cross() then
	   System.Quit()
	   end
	  end
	  if nav == 3 then
	   if pad:cross() then
       nem = nem+1
       end
       if pad:triangle() then 
       nem = nem-1
       end
	   if nem > 1 then nem = 1 end
	   if nem < 0 then nem = 0 end
	   if nem == 1 then
	   if pad:down() then s = s + 1 end
       if pad:up() then s = s - 1 end
	   if s > nf then s = 1 end
	   if s < 1 then s = nf end
       if pad:cross() and fl[s].directory == true then
       System.currentDirectory(fl[s].name)
       s = 1
       fl=System.listDirectory()
       nf=table.getn(fl)
       end
	   end
	  end
	  if nav == 4 then
	   if pad:cross() then
	   content = {} 
	   content[1] = ""
	   projectname = "Untitled"
	   end
	  end
	  if nav == 5 then
	   if pad:up() then
       nav_5 = nav_5 -1
       end
       if pad:down() then 
       nav_5 = nav_5 +1
       end
	   if nav_5 > table.getn(nav5_content) then
       nav_5 = 1
       end
       if nav_5 < 1 then
       nav_5 = table.getn(nav5_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav5_content[nav_5]
	   end
	  end
	  if nav == 6 then
	  if pad:up() then
       nav_6 = nav_6 -1
       end
       if pad:down() then 
       nav_6 = nav_6 +1
       end
	   if nav_6 > table.getn(nav6_content) then
       nav_6 = 1
       end
       if nav_6 < 1 then
       nav_6 = table.getn(nav6_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav6_content[nav_6]
	   end
	  end
	   if nav == 7 then
	   if pad:up() then
       nav_7 = nav_7 -1
       end
       if pad:down() then 
       nav_7 = nav_7 +1
       end
	   if nav_7 > table.getn(nav7_content) then
       nav_7 = 1
       end
       if nav_7 < 1 then
       nav_7 = table.getn(nav7_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav7_content[nav_7] 
	   end
	   end
	   if nav == 8 then
	   if pad:up() then
       nav_8 = nav_8 -1
       end
       if pad:down() then 
       nav_8 = nav_8 +1
       end
	   if nav_8 > table.getn(nav8_content) then
       nav_8 = 1
       end
       if nav_8 < 1 then
       nav_8 = table.getn(nav8_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav8_content[nav_8]
	   end
	   end
	   if nav == 9 then
	  if pad:up() then
       nav_9 = nav_9 -1
       end
       if pad:down() then 
       nav_9 = nav_9 +1
       end
	   if nav_9 > table.getn(nav9_content) then
       nav_9 = 1
       end
       if nav_9 < 1 then
       nav_9 = table.getn(nav9_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav9_content[nav_9]
	   end
	  end
	  if nav == 10 then
	   if pad:up() then
       nav_10 = nav_10 -1
       end
       if pad:down() then 
       nav_10 = nav_10 +1
       end
	   if nav_10 > table.getn(nav10_content) then
       nav_10 = 1
       end
       if nav_10 < 1 then
       nav_10 = table.getn(nav10_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav10_content[nav_10]
	   end
	  end
	  if nav == 11 then
	   if pad:up() then
       nav_11 = nav_11 -1
       end
       if pad:down() then 
       nav_11 = nav_11 +1
       end
	   if nav_11 > table.getn(nav11_content) then
       nav_11 = 1
       end
       if nav_11 < 1 then
       nav_11 = table.getn(nav11_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav11_content[nav_11]
	   end
	  end
	  if nav == 12 then
	   if pad:up() then
       nav_12 = nav_12 -1
       end
       if pad:down() then 
       nav_12 = nav_12 +1
       end
	   if nav_12 > table.getn(nav12_content) then
       nav_12 = 1
       end
       if nav_12 < 1 then
       nav_12 = table.getn(nav12_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav12_content[nav_12]
	   end
	  end
	  if nav == 13 then
	   if pad:up() then
       nav_13 = nav_13 -1
       end
       if pad:down() then 
       nav_13 = nav_13 +1
       end
	   if nav_13 > table.getn(nav13_content) then
       nav_13 = 1
       end
       if nav_13 < 1 then
       nav_13 = table.getn(nav13_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav13_content[nav_13]
	   end
	  end
	  if nav == 14 then
	   if pad:up() then
       nav_14 = nav_14 -1
       end
       if pad:down() then 
       nav_14 = nav_14 +1
       end
	   if nav_14 > table.getn(nav14_content) then
       nav_14 = 1
       end
       if nav_14 < 1 then
       nav_14 = table.getn(nav14_content)
       end
	   if pad:cross() then
	   content[line] = content[line]..nav14_content[nav_14]
	   end
	  end
	   if nav == 15 then
	   if pad:up() then
       nav_15 = nav_15 -1
       end
       if pad:down() then 
       nav_15 = nav_15 +1
       end
	   if nav_15 > table.getn(nav15_content) then
       nav_15 = 1
       end
       if nav_15 < 1 then
       nav_15 = table.getn(nav15_content)
       end
	   if pad:cross() then
        for i=1,table.getn(preset[nav_15]) do
		content[i] = preset[nav_15][i] 
		end
	   end
	  end
	   if nav == 16 then
	   if pad:up() then
       nav_16 = nav_16 -1
       end
       if pad:down() then 
       nav_16 = nav_16 +1
       end
	   if nav_16 > table.getn(nav15_content) then
       nav_16 = 1
       end
       if nav_16 < 1 then
       nav_16 = table.getn(nav16_content)
       end
	   if pad:cross() then
        for i=1,table.getn(func[nav_16]) do
		content[line+i] = func[nav_16][i] 
		end
	   end
	  end
	  if nav == 17 then
	   if pad:up() then
       nav_17 = nav_17 -1
       end
       if pad:down() then 
       nav_17 = nav_17 +1
       end
	   if nav_17 > table.getn(myCommands) then
       nav_17 = 1
       end
       if nav_17 < 1 then
       nav_17 = table.getn(myCommands)
       end
	   if pad:cross() then
       content[line] = content[line]..myCommands[nav_17]
	   end
	  end
	  end
	  
	  if editormode == 0 or editormode == 1 then
	   if pad:r() then
	   table.insert(content,line+1,"")
	   line = line + 1
	   end
	  end
	  
	  if line < table.getn(content) and string.len(line+1) > 0 and string.len(content[line]) > 27 then
	  if pad:cross() or pad:circle() or pad:square() or pad:triangle() then
	  table.insert(content,line+1,"")
	  end
	  end
	  
	oldpad=pad
   end --padarea end
   
   if string.len(content[line]) > 27 then
    if line == table.getn(content) then
    line = line + 1
    content[line] = ""
	 if line > 22*scrollnum then
	 cy = cy - 220
	 scrollnum=scrollnum+1
	 end
	end
   end
   
   if editormode == 0 then --texteditor
   
   if (dx > 64) then
    select.x = 3

    if (dy > 64) then
    hx=407
    hy=135
    elseif (dy < -64) then
    hx=407
    hy=37
    else
    hx=407
    hy=86
    end

    elseif (dx < -64) then

    select.x = 1

    if (dy > 64) then
    hx=309
    hy=135
    elseif (dy < -64) then
    hx=309
    hy=37
    else
    hx=309
    hy=86
    end

    else

    select.x = 2

    if (dy > 64) then
    hx=358
    hy=135
    elseif (dy < -64) then
    hx=358
    hy=37
    else
    hx=358
    hy=86
    end

    end
    if (dy > 64) then
    select.y = 3
    elseif (dy < -64) then
    select.y = 1
    else
    select.y = 2
    end 
	if mode == 0 then
	mx = 309
	my = 191
	end
	if mode == 1 then
	mx = 359
	my = 191
	end
	if mode == 2 then
	mx = 409
	my = 191
	end
   
   screen:blit(0, 10, kb_bg)
   screen:blit(hx, hy+10, kb_highlight)
   screen:blit(mx, my+10, kb_highlight_mode)
   screen:blit(0, 10, kb_select)
   if (mode == 1)then
   screen:blit(0, 10, kb_overlayA)
   elseif (mode == 2) then
   screen:blit(0, 10, kb_overlayB)
   else
    screen:blit(0, 10, kb_overlay)
   end
   
   end
   
   screen:blit(navx+70,navy,hover,true)
   if nav <= 14 then
   screen:blit(70,3,topmenu,true)
   end
   if nav > 14 then
   screen:blit(-17,3,topmenu,true)
   end
   screen:blit(0,0,dow,false)
   if editormode == 1 then
    if nav == 1 then --nav 1
    navx = -11
	  if nav_1 > 3 then nav_1=1 end
	  if nav_1 < 1 then nav_1=3 end
      if nem > 1 then nem = 1 end
      if nem < 0 then nem = 0 end
	screen:blit(322,55,txt)
	screen:blit(322,95,txt)
	screen:blit(322,115,txt)
	if nav_1 == 1 then
	screen:blit(305,55,txt_hover)
	  if nem == 1 then
	  osk()
	  projectname = text
	  end
	end
	if nav_1 == 2 then
	screen:blit(305,95,txt_hover)
	  if pad:cross() then
	   System.createDirectory(appdir.."/Applications/"..projectname)
	   for i=1,table.getn(content) do
       file = io.open(appdir.."/Applications/"..projectname.."/index.lua","a")
       file:write(content[i].."\n") 
       file:close() 
	   end
	  end
	end
	if nav_1 == 3 then
	screen:blit(305,115,txt_hover)
	  if nem == 1 then
	   screen:blit(0, 0, fbbg)
	   for i=1,nf do
       screen:print(10,k+i*10,fl[i].name,black)
       end
       screen:print(10,k+10*s,fl[s].name,red)
	   if pad:cross() and fl[s].directory == false then
       if string.sub(fl[s].name, -4) == ".lua" or string.sub(fl[s].name, -4) == ".LUA" then
       dofile (fl[s].name)
       end
       end
	 end
	end
	screen:print(335,60,"Projectname:",black)
	screen:print(335,75,projectname,red)
	screen:print(335,100,"Save project",black)
	screen:print(335,120,"Run Filebrowser",black)
    end
	if nav == 2 then --nav 2
    navx = 18
	screen:blit(305,55,txt_hover)
	screen:print(335,60,"Exit DOW!",black)
    end
	if nav == 3 then
    navx = 47
	screen:blit(305,55,txt_hover)
	screen:print(335,60,"Open File",black)
	   if nem == 1 then
	   screen:blit(0, 0, fbbg)
	   for i=1,nf do
       screen:print(10,k+i*10,fl[i].name,black)
       end
       screen:print(10,k+10*s,fl[s].name,red)
	   if pad:cross() and fl[s].directory == false then
       if string.sub(fl[s].name, -4) == ".lua" or string.sub(fl[s].name, -4) == ".LUA" or string.sub(fl[s].name, -4) == ".txt" or string.sub(fl[s].name, -4) == ".TXT" then
       for line in io.lines(fl[s].name) do
       table.insert(content, string.sub(line,1,string.len(line)-2)) 
       end
       end
       end
	   end
    end
	if nav == 4 then
    navx = 74
	screen:blit(305,55,txt_hover)
	screen:print(335,60,"New Project",black)
    end
	if nav == 5 then
    navx = 118
	menu(322,35,nav5_content,leer,false,nav_5)
    end
	if nav == 6 then
    navx = 146
	menu(322,35,nav6_content,leer,false,nav_6)
    end
	if nav == 7 then
    navx = 175
	menu(322,35,nav7_content,leer,false,nav_7)
    end
	if nav == 8 then
    navx = 203
	menu(322,35,nav8_content,leer,false,nav_8)
    end
	if nav == 9 then
    navx = 227
	menu(322,35,nav9_content,leer,false,nav_9)
    end
	if nav == 10 then
    navx = 254
	menu(322,35,nav10_content,leer,false,nav_10)
    end
	if nav == 11 then
    navx = 283
	menu(322,35,nav11_content,leer,false,nav_11)
    end
	if nav == 12 then
    navx = 312
	menu(322,35,nav12_content,leer,false,nav_12)
    end
	if nav == 13 then
    navx = 338
	menu(322,35,nav13_content,leer,false,nav_13)
    end
	if nav == 14 then
    navx = 362
	menu(322,35,nav14_content,leer,false,nav_14)
    end
	if nav == 15 then
	navx = 306
	menu(322,35,nav15_content,leer,false,nav_15)
	end
	if nav == 16 then
	navx = 337
	menu(322,35,nav16_content,leer,false,nav_16)
	end
	if nav == 17 then
	navx = 366
	menu(322,35,myCommands,leer,false,nav_17)
	end
   end
   
    if s > nf then s = 1 end
	if s < 1 then s = nf end
	
   
   screen.flip()
   screen.waitVblankStart()
 end

end

while true do

   loadprogress()
   
   screen.flip()
   screen.waitVblankStart()

end

