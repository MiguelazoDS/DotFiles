module Bindings
  ( myKeys,
    myModMask,
  )
where

import Misc as M
import Scratchpads
import System.Exit (exitSuccess)
import XMonad
import XMonad.Actions.CopyWindow (copyToAll, kill1, killAllOtherCopies)
import XMonad.Actions.Promote
import XMonad.Actions.WithAll (killAll)
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..))
import qualified XMonad.StackSet as W
import XMonad.Util.NamedScratchpad

myKeys :: [(String, X ())]
myKeys =
  -- Xmonad
  [ ("M-S-r", spawn "$HOME/.config/xmonad/recompile"),
    ("M-S-l", spawn "betterlockscreen -l dimblur"),
    ("M-e l", io exitSuccess),
    ("M-e p", spawn "systemctl poweroff"),
    ("M-e s", spawn "systemctl suspend"),
    ("M-e r", spawn "systemctl reboot"),
    -- Applications
    ("M-o", spawn $ M.myBrowser M.applications),
    ("M-x", spawn "kill -9 $(pidof mocp)"),
    ("M-d", spawn "rofi -show drun -show-icons"),
    ("M-n", spawn $ M.myTerminal M.applications ++ " start --always-new-process 'ranger'"),
    ("M-<Return>", spawn $ M.myTerminal M.applications),
    ("M-t", spawn $ M.myFileManager M.applications),
    -- Notifications
    ("M-S-u", spawn "$HOME/.config/xmonad/xmobar_scripts/updates updates"),
    ("M-m", spawn "$HOME/.config/xmonad/xmobar_scripts/mem --details"),
    ("M-w", spawn "$HOME/.config/xmonad/xmobar_scripts/weather extended"),
    -- Windows
    ("M-q", kill1), -- Kill the currently focused client
    ("M-S-q", killAll), -- Kill all the windows on current workspace
    ("M-r", spawn "$HOME/.scripts/external_monitor"), -- Restore to 16:9
    ("M-c", spawn "xrandr --output HDMI-0 --mode 1680x1050 --rate 144"), -- Set resolution 16:10
    ("M-<Delete>", withFocused $ windows . W.sink), -- Push floating window back to tile.
    ("M-S-<Delete>", withFocused $ windows . flip W.float (W.RationalRect 0 0 1 1)), -- Put current windows to full float.
    ("M-S-d", windows copyToAll), -- Copy focused windows to all workspaces.
    ("M-S-x", killAllOtherCopies), -- Kill all copies except focused window.
    -- Windows navigation
    ("M-l", windows W.focusMaster), -- Move focus to the master window
    ("M-j", windows W.focusDown), -- Move focus to the next window
    ("M-k", windows W.focusUp), -- Move focus to the prev window
    ("M-<Backspace>", promote), -- Moves focused window to master, all others maintain order
    ("M-S-j", sendMessage Arrange), -- Restore windows arrange
    ("M-S-k", sendMessage DeArrange), -- Reset windows arrange
    ("M-<Up>", sendMessage (MoveUp 10)), --  Move focused window to up
    ("M-<Down>", sendMessage (MoveDown 10)), --  Move focused window to down
    ("M-<Right>", sendMessage (MoveRight 10)), --  Move focused window to right
    ("M-<Left>", sendMessage (MoveLeft 10)), --  Move focused window to left
    ("M-S-<Up>", sendMessage (IncreaseUp 10)), --  Increase size of focused window up
    ("M-S-<Down>", sendMessage (IncreaseDown 10)), --  Increase size of focused window down
    ("M-S-<Right>", sendMessage (IncreaseRight 10)), --  Increase size of focused window right
    ("M-S-<Left>", sendMessage (IncreaseLeft 10)), --  Increase size of focused window left
    ("M-C-<Up>", sendMessage (DecreaseUp 10)), --  Decrease size of focused window up
    ("M-C-<Down>", sendMessage (DecreaseDown 10)), --  Decrease size of focused window down
    ("M-C-<Right>", sendMessage (DecreaseRight 10)), --  Decrease size of focused window right
    ("M-C-<Left>", sendMessage (DecreaseLeft 10)), --  Decrease size of focused window left
    -- Layouts
    ("M-<Space>", sendMessage NextLayout), -- Switch to next layout
    ("M-C-h", sendMessage Shrink),
    ("M-C-l", sendMessage Expand),
    ("M-C-j", sendMessage MirrorShrink),
    ("M-C-k", sendMessage MirrorExpand),
    -- Scratchpads
    ("M-a", namedScratchpadAction myScratchPads $ M.myMusicPlayer M.applications),
    ("M-u", namedScratchpadAction myScratchPads "terminal"),
    ("M-p", namedScratchpadAction myScratchPads "easyeffects"),
    -- Multimedia Keys
    ("M-S-b", spawn "$HOME/.scripts/bt_headset_toggle"),
    ("M-f", spawn "flameshot gui"),
    ("M-S-f", spawn "flameshot full"),
    ("<XF86MonBrightnessUp>", spawn "light -A 5"),
    ("<XF86MonBrightnessDown>", spawn "light -U 5"),
    ("<XF86AudioPlay>", spawn "mocp -G"),
    ("<XF86AudioPrev>", spawn "mocp -r"),
    ("<XF86AudioNext>", spawn "mocp -f"),
    ("<XF86AudioStop>", spawn "mocp -s"),
    ("<XF86AudioMute>", spawn "pamixer -t"),
    ("<XF86AudioLowerVolume>", spawn "pamixer -d 5"),
    ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
  ]
