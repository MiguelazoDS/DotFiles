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
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, pad, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work

main = do
    xmproc <- spawnPipe $ "xmobar $HOME/.config/xmobar/xmobarrc"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor "#717733" "" . wrap "<{" "}>" -- Current workspace in xmobar
              , ppHidden = xmobarColor "#a54242" "" . wrap "*" ""   -- Hidden workspaces in xmobar
              , ppHiddenNoWindows = xmobarColor "#ebdbb2" ""        -- Hidden workspaces (no windows)
              , ppSep =  "<fc=#d79921> </fc>"                     -- Separators in xmobar
              , ppUrgent = xmobarColor "#191919" "" . wrap "!" "!"  -- Urgent workspace
              , ppOrder  = \(ws:l:_) -> [ws,l]
              }
        , modMask            = M.myModMask M.custom
        , terminal           = M.myTerminal M.applications
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = M.myBorderWidth M.custom
        , normalBorderColor  = "#67686a"
        , focusedBorderColor = "#458588"
        } `additionalKeysP` myKeys
