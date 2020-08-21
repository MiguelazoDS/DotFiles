module StartupHooks 
    ( myStartupHook
    ) where

import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName
import XMonad.Util.NamedScratchpad
import Scratchpads

myStartupHook = do
            setWMName "sleep 10; LG3D" 
            spawnOnce "sleep 30; dropbox"
            spawnOnce "numlockx on"
            spawnOnce "sleep 15; nm-applet"
            spawnOnce "nitrogen --restore &"
            spawnOnce "sleep 10; killall -q comptom; picom --config $HOME/.config/picom/picom.conf"
            spawnOnce "setxkbmap es"
            spawnOnce "sleep 10; $HOME/.xmonad/scripts/trayer"
            spawnOnce "xsetroot -cursor_name left_ptr"
            spawnOnce "/usr/lib/xfce4/notifyd/xfce4-notifyd"
            spawnOnce "$HOME/.xmonad/scripts/config_gen"
