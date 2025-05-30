module StartupHooks
  ( myStartupHook,
  )
where

import XMonad.Core
import XMonad.Hooks.SetWMName
import XMonad.Util.SpawnOnce

myStartupHook :: XMonad.Core.X ()
myStartupHook = do
  setWMName "sleep 10; LG3D" -- Needed for Java programs (i.e JDownloader)
  spawnOnce "stalonetray"
  spawnOnce "dropbox"
  spawnOnce "sleep 20; nm-applet --indicator"
  spawnOnce "numlockx on"
  spawnOnce "nitrogen --restore &"
  spawnOnce "sleep 5; killall -q picom; picom --config $HOME/.config/picom/picom.conf"
  spawnOnce "setxkbmap es"
  spawnOnce "xsetroot -cursor_name left_ptr" -- Set cursor theme
  spawnOnce "$HOME/.scripts/mouse_accel"
  spawnOnce "nvidia-settings -a \"[gpu:0]/GpuPowerMizerMode=1\""
