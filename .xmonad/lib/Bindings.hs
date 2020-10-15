module Bindings 
    ( myKeys
    , myModMask
    ) where

import XMonad
import Scratchpads
import Data.Maybe (isJust)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Prompt (XPrompt, XPConfig, defaultXPConfig, XPConfig(..), XPPosition(CenteredAt), Direction1D(..))
import Misc as M
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Actions.CopyWindow (kill1, copyToAll, killAllOtherCopies, runOrCopy)
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.ZoomRow (zoomRow, zoomIn, zoomOut, zoomReset, ZoomMessage(ZoomFullToggle))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import XMonad.Layout.ResizableTile
import XMonad.Layout.Reflect (reflectVert, reflectHoriz, REFLECTX(..), REFLECTY(..))
import XMonad.Actions.Promote
import XMonad.Actions.WithAll (sinkAll, killAll)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), shiftNextScreen, shiftPrevScreen)

myKeys =
-- Xmonad
        [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart")                             
        , ("M-S-l", spawn "betterlockscreen -l $HOME./.Wallpapers/arch_linux_desktop.png")
        , ("M-e l", io exitSuccess)                                                            
        , ("M-e p", spawn "systemctl poweroff")
        , ("M-e s", spawn "systemctl suspend")
        , ("M-e r", spawn "systemctl reboot")

-- Applications
        , ("M-o", spawn $ M.myBrowser M.applications)
        , ("M-x", spawn "kill -9 $(pidof mocp)")
        , ("M-d", spawn "rofi -show drun -show-icons -drun-icon-theme arthur.rasi")
        , ("M-n", spawn $ M.myTerminal M.applications ++ " -e 'ranger'")
        , ("M-<Return>", spawn $ M.myTerminal M.applications ++ " --title Kitty")

-- Notifications
        , ("M-S-u", spawn "$HOME/.config/xmobar/scripts/updates updates")
        , ("M-m", spawn "$HOME/.config/xmobar/scripts/mem --details")
        , ("M-w", spawn "$HOME/.config/xmobar/scripts/weather extended")

-- Windows
        , ("M-q", kill1)                                                                    -- Kill the currently focused client
        , ("M-S-q", killAll)                                                                -- Kill all the windows on current workspace
        , ("M-r", spawn "xrandr --output DVI-D-0 --scale 1x1")
        , ("M-<Delete>", withFocused $ windows . W.sink)                                    -- Push floating window back to tile.
        , ("M-S-<Delete>", withFocused $ windows . flip W.float (W.RationalRect 0 0 1 1))   -- Put current windows to full float

-- Windows navigation
        , ("M-l", windows W.focusMaster)             -- Move focus to the master window
        , ("M-j", windows W.focusDown)               -- Move focus to the next window
        , ("M-k", windows W.focusUp)                 -- Move focus to the prev window
        , ("M-S-l", windows W.swapMaster)            -- Swap the focused window and the master window
        , ("M-S-j", windows W.swapDown)              -- Swap the focused window with the next window
        , ("M-S-k", windows W.swapUp)                -- Swap the focused window with the prev window
        , ("M-<Backspace>", promote)                 -- Moves focused window to master, all others maintain order
        , ("M1-S-<Tab>", rotSlavesDown)              -- Rotate all windows except master and keep focus in place
        , ("M1-C-<Tab>", rotAllDown)                 -- Rotate all the windows in the current stack

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
        , ("M-C-h", sendMessage Shrink)
        , ("M-C-l", sendMessage Expand)
        , ("M-C-j", sendMessage MirrorShrink)
        , ("M-C-k", sendMessage MirrorExpand)
        , ("M-S-;", sendMessage zoomReset)
        , ("M-;", sendMessage ZoomFullToggle)

-- Scratchpads
        , ("M-a", namedScratchpadAction myScratchPads "moc")
        , ("M-u", namedScratchpadAction myScratchPads "terminal")

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
        ] where nonNSP          = WSIs (return (\ws -> W.tag ws /= "nsp"))
                nonEmptyNonNSP  = WSIs (return (\ws -> isJust (W.stack ws) && W.tag ws /= "nsp"))
