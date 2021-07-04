import Misc as M
import Bindings
import StartupHooks
import Scratchpads
import Workspaces
import ManageHooks
import Layouts
import XMonad
import XMonad.Config.Desktop
import System.IO -- (hPutStrLn)
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, defaultPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work

main = do
    xmproc <- spawnPipe $ "xmobar $HOME/.config/xmobar/xmobarrc"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor "#445e02" "" . wrap "<{" "}>" -- Current workspace in xmobar
              , ppHidden = xmobarColor "#803d26" "" . wrap "*" ""   -- Hidden workspaces in xmobar
              , ppHiddenNoWindows = xmobarColor "#d0d0d0" ""        -- Hidden workspaces (no windows)
              , ppSep =  "<fc=#FFD700> </fc>"                     -- Separators in xmobar
              , ppUrgent = xmobarColor "#000000" "" . wrap "!" "!"  -- Urgent workspace
              , ppOrder  = \(ws:l:_) -> [ws,l]
              }
        , modMask            = M.myModMask M.custom
        , terminal           = M.myTerminal M.applications
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = M.myBorderWidth M.custom
        , normalBorderColor  = "#313442"
        , focusedBorderColor = "#803d26"
        } `additionalKeysP` myKeys
