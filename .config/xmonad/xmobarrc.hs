Config { font    =  "FiraCode Nerd Font Medium Normal 11.5"
    , additionalFonts = [ "FiraCode Nerd Font Semi-Bold Normal 12"      -- Rounded corners for fn=0
                        , "FiraCode Nerd Font Semi-Bold Normal 15"
                        , "FiraCode Nerd Font Semi-Bold Normal 20"      -- Haskell logo size
                        , "FiraCode Nerd Font Semi-Bold Normal 12.7"
    ]
    , bgColor = "#000000"
    , alpha = 75
    , border = FullBM 0
    , borderColor = "#242424"
    , borderWidth = 0
    , position = Static{xpos = 0, ypos= 0, width = 1920, height = 29}
    , lowerOnStart = True
    , hideOnStart = False
    , allDesktops = True
    , persistent = True
    , commands = [ Run Com "/home/miguel/.config/xmonad/xmobar_scripts/battery" [] "bat" 10
    , Run BatteryP ["BAT1"]
    ["-t", "<fc=#E7D7AD,#242424><fn=1><acstatus></fn></fc>"
    , "-L", "10", "-H", "80"
        , "-l", "#db3e2c,#242424", "-h", "#8d8f18,#242424"
        , "--", "-O", "<left>%", "-o", "<left>%"
    ] 10
    , Run Date "<fc=#242424><fn=1></fn></fc><fc=#386eab,#242424><fn=0> </fn></fc>%a %_d/%m/%Y %H:%M" "date" 10
    , Run Cpu ["-t","<fc=#242424><fn=1></fn></fc><fc=#386eab,#242424><fn=0> </fn><total>%</fc><fc=#242424><fn=1></fn></fc>","-H","75","--high","#db3e2c,#242424"] 10
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/mem" [] "memory" 10
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/volume" [] "volume" 1
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/updates" [] "updates" 200
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/moc" [] "moc" 5
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/weather" [] "weather" 200
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/padding" [] "trayerpad" 1
    , Run Com "/home/miguel/.config/xmonad/xmobar_scripts/headset" [] "headset" 3
    , Run Locks
    , Run UnsafeStdinReader
    ]
    , sepChar = "%"
    , alignSep = "}{"
    , template = "<fc=#7c76cf,#242424><fn=3>  </fn></fc><fn=3></fn>%UnsafeStdinReader%<fc=#db9a27>%moc%</fc> }<fc=#E7D7AD>%weather%</fc><fc=#E7D7AD,#242424>%date%</fc><fc=#242424><fn=1></fn></fc>{<fc=#242424><fn=1></fn></fc><fc=#E7D7AD,#242424><fn=0>%locks%</fn></fc><fc=#242424><fn=1></fn></fc><fc=#E7D7AD>%headset%</fc><fc=#E7D7AD>%updates%</fc><fc=#E7D7AD>%volume%</fc><fc=#E7D7AD>%cpu%</fc><fc=#E7D7AD>%memory%</fc><fc=#E7D7AD>%bat%</fc><fc=#E7D7AD>%battery%</fc><fc=#242424><fn=1></fn></fc> <fc=#242424><fn=4></fn></fc><fc=#E7D7AD>%trayerpad%</fc><fc=#242424><fn=4></fn></fc>"
