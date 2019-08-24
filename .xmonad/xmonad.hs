------------------------------------------------------------------------
---IMPORTS
------------------------------------------------------------------------
    -- Base
import XMonad
import XMonad.Config.Desktop
import Data.Monoid
import Data.Maybe (isJust)
import System.IO -- (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W
import Data.Map as M
import Data.List as L
import XMonad.Actions.Submap
import XMonad.Hooks.Place

    -- Utilities
import XMonad.Util.Loggers
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.SpawnOnce

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work

    -- Actions
import XMonad.Actions.Minimize (minimizeWindow)
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Actions.CopyWindow (kill1, copyToAll, killAllOtherCopies, runOrCopy)
import XMonad.Actions.WindowGo (runOrRaise, raiseMaybe)
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), shiftNextScreen, shiftPrevScreen) 
import XMonad.Actions.GridSelect (GSConfig(..), goToSelected, bringSelected, colorRangeFromClassName, buildDefaultGSConfig)
import XMonad.Actions.DynamicWorkspaces (addWorkspacePrompt, removeEmptyWorkspace)
import XMonad.Actions.MouseResize
import qualified XMonad.Actions.ConstrainedResize as Sqr

    -- Layouts modifiers
import XMonad.Layout.PerWorkspace (onWorkspace) 
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.WorkspaceDir
import XMonad.Layout.Spacing (spacing) 
import XMonad.Layout.NoBorders
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

    -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.OneBig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import XMonad.Layout.IM (withIM, Property(Role))

    -- Prompts
import XMonad.Prompt (defaultXPConfig, XPConfig(..), XPPosition(Top), Direction1D(..))
------------------------------------------------------------------------
---CONFIG
------------------------------------------------------------------------
myModMask       = mod4Mask      -- Sets modkey to super/windows key
myTerminal      = "termite"     -- Sets default terminal
myTextEditor    = "nvim"        -- Sets default text editor
myBorderWidth   = 2             -- Sets border width for windows
windowCount     = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

main =   do
    xmproc2 <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              {  ppOutput = hPutStrLn xmproc2
              , ppCurrent = xmobarColor "#520c0c" "" . wrap "[" "]" -- Current workspace in xmobar
              , ppVisible = xmobarColor "#000000" ""                -- Visible but not current workspace
              , ppHidden = xmobarColor "#2d78ad" "" . wrap "*" ""   -- Hidden workspaces in xmobar
              , ppHiddenNoWindows = xmobarColor "#000000" ""        -- Hidden workspaces (no windows)
              , ppTitle = xmobarColor "#000000" "" . shorten 50     -- Title of active window in xmobar
              , ppSep =  "<fc=#000000> : </fc>"                     -- Separators in xmobar
              , ppUrgent = xmobarColor "#000000" "" . wrap "!" "!"  -- Urgent workspace
              , ppExtras  = [windowCount]                           -- # of windows current workspace
              , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
              }
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook 
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = "#292d3e"
        , focusedBorderColor = "#699200"
        } `additionalKeysP`         myKeys 

------------------------------------------------------------------------
---AUTOSTART
------------------------------------------------------------------------
myStartupHook = do
          spawnOnce "dropbox"
          spawnOnce "numlockx on"
          spawnOnce "nm-applet"
          spawnOnce "$HOME/.config/i3/scripts/flux"
          -- spawnOnce "nitrogen --restore" 
          spawnOnce "feh --bg-fill ~/.Wallpaper/nature-3082832_1920.jpg"
          spawnOnce "killall -q comptom; compton --config $HOME/.config/compton/compton.conf" 
          spawnOnce "setxkbmap es"
          spawnOnce "trayer --edge top --transparent true --alpha 55 --tint 0xFFFFFF --align right --width 5 --height 18 --margin 5 --distance 2"
------------------------------------------------------------------------
---KEYBINDINGS
------------------------------------------------------------------------
--
--
--mySubmap = submap . M.fromList $
--  [((0, xK_l), spawn "xmessage 'woohoo!'")
--  ]
--
--dzen message action = do
--  handle <- spawnPipe "sleep 1 && dzen2"
--  io $ hPutStrLn handle message
--  action
--  io $ hClose handle


myKeys =
    -- Xmonad
        [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart")    -- Restarts xmonad
        , ("M-l", spawn "betterlockscreen -l $HOME./.Wallpapers/arch_linux_desktop.png")
        , ("M-e l", io exitSuccess)                                    -- Logout
        , ("M-e p", spawn "systemctl poweroff")
        , ("M-e s", spawn "systemctl suspend")
        , ("M-e r", spawn "systemctl reboot")
        --, ((modMask, xK_period), submap . M.fromList $
        --[ ((0, xK_r),     spawn "mpc next")
        --, ((0, xK_p),     spawn "mpc prev")
        --, ((0, xK_l),     spawn "mpc random")
        --, ((0, xK_s),     spawn "mpc toggle")
        --])
    -- Applications
        , ("M-o", spawn "opera")
        , ("M-x", spawn $ myTerminal ++ " -e 'mocp -x'")
        , ("M-d", spawn "rofi -show drun -show-icons -drun-icon-theme arthur.rasi")
        , ("M-n", spawn "xterm -e ranger")
        , ("M-S-u", spawn "$HOME/.config/xmobar/scripts/updates --updates")
        , ("M-m", spawn "$HOME/.config/xmobar/scripts/mem --details")
    
    -- Windows
        , ("M-q", kill1)                           -- Kill the currently focused client
        , ("M-S-a", killAll)                         -- Kill all the windows on current workspace

    -- Floating windows
        , ("M-<Delete>", withFocused $ windows . W.sink)  -- Push floating window back to tile.
        -- , ("M-S-<Delete>", sinkAll)                  -- Push ALL floating windows back to tile.
       --  , ("M-S-<Delete>", withFocused $ windows . W.float $ W.RationalRect  (0 0 1 0.42))
    -- Windows navigation
     --   , ("M-m", windows W.focusMaster)             -- Move focus to the master window
        , ("M-j", windows W.focusDown)               -- Move focus to the next window
        , ("M-k", windows W.focusUp)                 -- Move focus to the prev window
        , ("M-S-m", windows W.swapMaster)            -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)              -- Swap the focused window with the next window
        , ("M-S-k", windows W.swapUp)                -- Swap the focused window with the prev window
        , ("M-<Backspace>", promote)                 -- Moves focused window to master, all others maintain order
        , ("M1-S-<Tab>", rotSlavesDown)              -- Rotate all windows except master and keep focus in place
        , ("M1-C-<Tab>", rotAllDown)                 -- Rotate all the windows in the current stack
        , ("M-S-s", windows copyToAll)  
        , ("M-C-s", killAllOtherCopies) 
        
        , ("M-C-M1-<Up>", sendMessage Arrange)
        , ("M-C-M1-<Down>", sendMessage DeArrange)
        , ("M-<Up>", sendMessage (MoveUp 10))             --  Move focused window to up
        , ("M-<Down>", sendMessage (MoveDown 10))         --  Move focused window to down
        , ("M-<Right>", sendMessage (MoveRight 10))       --  Move focused window to right
        , ("M-<Left>", sendMessage (MoveLeft 10))         --  Move focused window to left
        , ("M-S-<Up>", sendMessage (IncreaseUp 10))       --  Increase size of focused window up
        , ("M-S-<Down>", sendMessage (IncreaseDown 10))   --  Increase size of focused window down
        , ("M-S-<Right>", sendMessage (IncreaseRight 10)) --  Increase size of focused window right
        , ("M-S-<Left>", sendMessage (IncreaseLeft 10))   --  Increase size of focused window left
        , ("M-C-<Up>", sendMessage (DecreaseUp 10))       --  Decrease size of focused window up
        , ("M-C-<Down>", sendMessage (DecreaseDown 10))   --  Decrease size of focused window down
        , ("M-C-<Right>", sendMessage (DecreaseRight 10)) --  Decrease size of focused window right
        , ("M-C-<Left>", sendMessage (DecreaseLeft 10))   --  Decrease size of focused window left

    -- Layouts
        , ("M-<Space>", sendMessage NextLayout)                              -- Switch to next layout
        , ("M-S-<Space>", sendMessage ToggleStruts)                          -- Toggles struts
        , ("M-S-b", sendMessage $ Toggle NOBORDERS)                          -- Toggles noborder
        , ("M-S-=", sendMessage (Toggle NBFULL) >> sendMessage ToggleStruts) -- Toggles noborder/full
        , ("M-S-f", sendMessage (T.Toggle "float"))
        , ("M-S-x", sendMessage $ Toggle REFLECTX)
        , ("M-S-y", sendMessage $ Toggle REFLECTY)
        , ("M-S-m", sendMessage $ Toggle MIRROR)
        , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))   -- Increase number of clients in the master pane
        , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))  -- Decrease number of clients in the master pane
        , ("M-S-<KP_Multiply>", increaseLimit)              -- Increase number of windows that can be shown
        , ("M-S-<KP_Divide>", decreaseLimit)                -- Decrease number of windows that can be shown

        , ("M-C-h", sendMessage Shrink)
        , ("M-C-l", sendMessage Expand)
        , ("M-C-j", sendMessage MirrorShrink)
        , ("M-C-k", sendMessage MirrorExpand)
        , ("M-S-;", sendMessage zoomReset)
        , ("M-;", sendMessage ZoomFullToggle)

    -- Workspaces
        , ("M-<KP_Add>", moveTo Next nonNSP)                                -- Go to next workspace
        , ("M-<KP_Subtract>", moveTo Prev nonNSP)                           -- Go to previous workspace
        , ("M-S-<KP_Add>", shiftTo Next nonNSP >> moveTo Next nonNSP)       -- Shifts focused window to next workspace
        , ("M-S-<KP_Subtract>", shiftTo Prev nonNSP >> moveTo Prev nonNSP)  -- Shifts focused window to previous workspace

    -- Scratchpads
        , ("M-a", namedScratchpadAction myScratchPads "moc")
        , ("M-u", namedScratchpadAction myScratchPads "terminal")
        
    -- Main Run Apps
        , ("M-<Return>", spawn $ myTerminal ++ " -t Termite")
        , ("M-<KP_Insert>", spawn "dmenu_run -fn 'UbuntuMono Nerd Font:size=10' -nb '#292d3e' -nf '#bbc5ff' -sb '#82AAFF' -sf '#292d3e' -p 'dmenu:'")
        
    -- Command Line Apps  (MOD + KEYPAD 1-9)
        , ("M-<KP_End>", spawn (myTerminal ++ " -e lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss gopher://distro.tube"))  -- Keypad 1
        , ("M-<KP_Down>", spawn (myTerminal ++ " -e sh ./scripts/googler-script.sh"))  -- Keypad 2
        , ("M-<KP_Page_Down>", spawn (myTerminal ++ " -e newsboat"))                   -- Keypad 3
        , ("M-<KP_Left>", spawn (myTerminal ++ " -e rtv"))                             -- Keypad 4
        , ("M-<KP_Begin>", spawn (myTerminal ++ " -e neomutt"))                        -- Keypad 5
        , ("M-<KP_Right>", spawn (myTerminal ++ " -e twitch-curses"))                  -- Keypad 6
        , ("M-<KP_Home>", spawn (myTerminal ++ " -e sh ./scripts/haxor-news.sh"))      -- Keypad 7
        , ("M-<KP_Up>", spawn (myTerminal ++ " -e toot curses"))                       -- Keypad 8
        , ("M-<KP_Page_Up>", spawn (myTerminal ++ " -e sh ./scripts/tig-script.sh"))   -- Keypad 9
        
    -- Command Line Apps  (MOD + SHIFT + KEYPAD 1-9)
        , ("M-S-<KP_End>", spawn (myTerminal ++ " -e ~/.config/vifm/scripts/vifmrun"))                           -- Keypad 1
        , ("M-S-<KP_Down>", spawn (myTerminal ++ " -e joplin"))                          -- Keypad 2
        , ("M-S-<KP_Page_Down>", spawn (myTerminal ++ " -e cmus"))                     -- Keypad 3
        , ("M-S-<KP_Left>", spawn (myTerminal ++ " -e irssi"))                         -- Keypad 4
        , ("M-S-<KP_Begin>", spawn (myTerminal ++ " -e rtorrent"))                     -- Keypad 5
        , ("M-S-<KP_Right>", spawn (myTerminal ++ " -e youtube-viewer"))               -- Keypad 6
        , ("M-S-<KP_Home>", spawn (myTerminal ++ " -e ncpamixer"))                     -- Keypad 7
        , ("M-S-<KP_Up>", spawn (myTerminal ++ " -e calcurse"))                        -- Keypad 8
        , ("M-S-<KP_Page_Up>", spawn (myTerminal ++ " -e vim ~/.xmonad/xmonad.hs"))    -- Keypad 9
        
    -- Command Line Apps  (MOD + CTRL + KEYPAD 1-9)
        , ("M-C-<KP_End>", spawn (myTerminal ++ " -e htop"))                           -- Keypad 1
        , ("M-C-<KP_Down>", spawn (myTerminal ++ " -e gtop"))                       -- Keypad 2
        , ("M-C-<KP_Page_Down>", spawn (myTerminal ++ " -e nmon"))                     -- Keypad 3
        , ("M-C-<KP_Left>", spawn (myTerminal ++ " -e glances"))  -- Keypad 4
        , ("M-C-<KP_Begin>", spawn (myTerminal ++ " -e s-tui"))                        -- Keypad 5
        , ("M-C-<KP_Right>", spawn (myTerminal ++ " -e httping -KY --draw-phase localhost"))                     -- Keypad 6
        , ("M-C-<KP_Home>", spawn (myTerminal ++ " -e cmatrix -C cyan"))               -- Keypad 7
        , ("M-C-<KP_Up>", spawn (myTerminal ++ " -e pianobar"))                          -- Keypad 8
        , ("M-C-<KP_Page_Up>", spawn (myTerminal ++ " -e wopr report.xml"))            -- Keypad 9
        
    -- GUI Apps
        , ("M-b", spawn "surf http://www.youtube.com/c/DistroTube/")
        , ("M-f", spawn "pcmanfm")
        , ("M-g", runOrRaise "geany" (resource =? "geany"))

    -- Multimedia Keys
        , ("<XF86MonBrightnessUp>", spawn "light -A 5")
        , ("<XF86MonBrightnessDown>", spawn "light -U 5")
        , ("<XF86AudioPlay>", spawn "mocp -G")
        , ("<XF86AudioPrev>", spawn "mocp -r")
        , ("<XF86AudioNext>", spawn "mocp -f")
        , ("<XF86AudioStop>", spawn "mocp -s")
        , ("<XF86AudioMute>", spawn "pulseaudio-ctl mute")  
        , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down")
        , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up")
        , ("<XF86HomePage>", spawn "firefox")
        , ("<XF86Search>", safeSpawn "firefox" ["https://www.google.com/"])
        , ("<XF86Mail>", runOrRaise "geary" (resource =? "thunderbird"))
        , ("<XF86Calculator>", runOrRaise "gcalctool" (resource =? "gcalctool"))
        , ("<XF86Eject>", spawn "toggleeject")
        , ("<Print>", spawn "scrotd 0")
        ] where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))
                
------------------------------------------------------------------------
---WORKSPACES
------------------------------------------------------------------------

xmobarEscape = concatMap doubleLts
  where
        -- doubleLts '<' = "<<"
        doubleLts x   = [x]
        
myWorkspaces :: [String]   
myWorkspaces = clickable . L.map xmobarEscape $ ["1","2","3","4","5","6","7","8","9"]
   where                                                                      
         clickable l = [ "<action=xdotool key super+" ++ show n ++ ">" ++ ws ++ "</action>" |
                       (i,ws) <- zip [1..9] l,                                        
                       let n = i ] 

myManageHook :: Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
    --  [ className =? "ffplay"             --> doFloat
    --  --, placeHook $ fixed (0.5,0.5)
    --  , appName =? "nomacs"              --> doFloat
    --  , className =? "mpv"                --> doFloat
    --  , title =? "gitk"                   --> doFloat
    --  , className =? "JDownloader"        --> doFloat
    --  ] 
       [namedScratchpadManageHook myScratchPads]  --Must be first to avoid being affected by placeHook
       <+> myManageHook'

myManageHook' = composeAll
    [ placeHook $ fixed (0.5,0.5)        -- Set floating windows at the center
     , className =? "ffplay"             --> doFloat
     --, placeHook $ fixed (0.5,0.5)
     , appName =? "nomacs"              --> doFloat
     , className =? "mpv"                --> doFloat
     , title =? "gitk"                   --> doFloat
     , className =? "JDownloader"        --> doFloat
     , className =? "Yad"                --> doFloat
     ]


------------------------------------------------------------------------
---LAYOUTS
------------------------------------------------------------------------

myLayoutHook = avoidStruts $ smartBorders $ mouseResize $ windowArrange $ T.toggleLayouts floats $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
              where 
                  myDefaultLayout = grid ||| tall ||| threeCol ||| threeRow ||| oneBig ||| noBorders monocle ||| space ||| floats



tall       = renamed [Replace "tall"]     $ limitWindows 12 $ spacing 6 $ ResizableTall 1 (3/100) (1/2) []
grid       = renamed [Replace "grid"]     $ limitWindows 12 $ spacing 2 $ mkToggle (single MIRROR) $ Grid (16/10)
threeCol   = renamed [Replace "threeCol"] $ limitWindows 3  $ ThreeCol 1 (3/100) (1/2) 
threeRow   = renamed [Replace "threeRow"] $ limitWindows 3  $ Mirror $ mkToggle (single MIRROR) zoomRow
oneBig     = renamed [Replace "oneBig"]   $ limitWindows 6  $ Mirror $ mkToggle (single MIRROR) $ mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) $ OneBig (5/9) (8/12)
monocle    = renamed [Replace "monocle"]  $ limitWindows 20 Full
space      = renamed [Replace "space"]    $ limitWindows 4  $ spacing 12 $ Mirror $ mkToggle (single MIRROR) $ mkToggle (single REFLECTX) $ mkToggle (single REFLECTY) $ OneBig (2/3) (2/3)
floats     = renamed [Replace "floats"]   $ limitWindows 20 simplestFloat

------------------------------------------------------------------------
---SCRATCHPADS
------------------------------------------------------------------------
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "moc" spawnMocp findMocp manageMocp  
                ]

    where
    spawnTerm  = myTerminal ++  " --name=scratchpad -e 'tmux' -t 'SP terminal'"
    findTerm   = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
    spawnMocp  = myTerminal ++  " --name=moc -e 'mocp' -t 'MOC Player'"
    findMocp   = resource =? "moc"
    manageMocp = customFloating $ W.RationalRect l t w h
    h = 0.9
    w = 0.9
    t = 0.95 -h
    l = 0.95 -w
