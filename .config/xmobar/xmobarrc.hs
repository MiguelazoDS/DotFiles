Config { font    =  "FiraCode Nerd Font Medium Normal 11.5"
    , additionalFonts = [ "FiraCode Nerd Font Semi-Bold Normal 12"      -- Rounded corners for fn=0
                        , "FiraCode Nerd Font Semi-Bold Normal 15"
                        , "FiraCode Nerd Font Semi-Bold Normal 20"      -- Haskell logo size
    ]
    , iconRoot = "/home/miguel/.config/xmobar/icons"
    , bgColor = "#383d54"
    , alpha = 255
    , border = FullBM 0
    , borderColor = "#222222"
    , borderWidth = 3
    , position = Static{xpos = 0, ypos= 0, width = 1920, height = 29}
    , lowerOnStart = True
    , hideOnStart = False
    , allDesktops = True
    , persistent = True
    , commands = [ Run Com "/home/miguel/.config/xmobar/scripts/battery" [] "bat" 10
    , Run BatteryP ["BAT1"]
    ["-t", "<fc=#F5DFC1,#222222><fn=1><acstatus></fn></fc>"
    , "-L", "10", "-H", "80"
        , "-l", "#A54242,#222222", "-h", "#717733,#222222"
        , "--", "-O", "<left>%", "-o", "<left>%"
    ] 10
    , Run Date "<fc=#222222><fn=1></fn></fc><fc=#6C99BB,#222222><fn=0> </fn></fc>%a %_d/%m/%Y %H:%M" "date" 10
    , Run Cpu ["-t","<fc=#222222><fn=1></fn></fc><fc=#6C99BB,#222222><fn=0> </fn><total>%</fc><fc=#222222><fn=1></fn></fc>","-H","75","--high","#A54242,#222222"] 10
    , Run Com "/home/miguel/.config/xmobar/scripts/mem" [] "memory" 10
    , Run Com "/home/miguel/.config/xmobar/scripts/volume" [] "volume" 1
    , Run Com "/home/miguel/.config/xmobar/scripts/updates" [] "updates" 200
    , Run Com "/home/miguel/.config/xmobar/scripts/moc" [] "moc" 5
    , Run Com "/home/miguel/.config/xmobar/scripts/weather" [] "weather" 200
    , Run Com "/home/miguel/.config/xmobar/scripts/padding" [] "trayerpad" 1
    , Run Com "/home/miguel/.config/xmobar/scripts/headset" [] "headset" 3
    , Run Locks
    , Run UnsafeStdinReader
    ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = "<fc=#9F4E85,#222222><fn=3>  </fn></fc><fn=3></fn>%UnsafeStdinReader% <fc=#222222><fn=1></fn></fc><fc=#F5DFC1,#222222><fn=0>%locks%</fn></fc><fc=#222222><fn=1></fn></fc><fc=#F5DFC1>%headset%</fc><fc=#FF8A39>%moc%</fc>}<fc=#F5DFC1>%weather%</fc><fc=#F5DFC1,#222222>%date%</fc><fc=#222222><fn=1></fn></fc>{<fc=#F5DFC1>%updates%</fc><fc=#F5DFC1>%volume%</fc><fc=#F5DFC1>%cpu%</fc><fc=#F5DFC1>%memory%</fc><fc=#F5DFC1>%bat%</fc><fc=#F5DFC1>%battery%</fc><fc=#222222><fn=1></fn></fc> <fc=#E8DED1>%trayerpad%</fc>"