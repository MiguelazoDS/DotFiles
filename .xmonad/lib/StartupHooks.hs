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
            spawnOnce "sleep 5; killall -q picom; picom --log-file $HOME/.picom.logs --log-level DEBUG --config $HOME/.config/picom/picom.conf"
            spawnOnce "setxkbmap es"
            spawnOnce "sleep 10; trayer --edge top --transparent true --alpha 75 --tint 0x181818 --align right --widthtype request --height $height --margin $margin --distance 5"
            spawnOnce "xsetroot -cursor_name left_ptr"
            spawnOnce "/usr/lib/xfce4/notifyd/xfce4-notifyd"
            spawnOnce "$HOME/.xmonad/scripts/icon_gen"
            spawnOnce "xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --primary --same-as eDP-1"
