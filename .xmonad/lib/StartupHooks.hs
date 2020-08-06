module StartupHooks 
    ( myStartupHook
    ) where

import XMonad.Util.SpawnOnce
import XMonad.Hooks.SetWMName

myStartupHook = do
            setWMName "LG3D" 
            spawnOnce "dropbox"
            spawnOnce "numlockx on"
            spawnOnce "nm-applet"
            spawnOnce "$HOME/.config/i3/scripts/flux"
            spawnOnce "nitrogen --restore &"
            spawnOnce "killall -q comptom; compton --config $HOME/.config/compton/compton.conf"
            spawnOnce "setxkbmap es"
            spawnOnce "$HOME/.xmonad/scripts/trayer"
            spawnOnce "xsetroot -cursor_name left_ptr"
            spawnOnce "/usr/lib/xfce4/notifyd/xfce4-notifyd"
            spawnOnce "$HOME/.xmonad/scripts/config_gen"
