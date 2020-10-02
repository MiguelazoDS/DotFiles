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

xmobar :: String -> String
xmobar option
    | number == "3" = "xmobarrc1"
    | otherwise = "xmobarrc2"
    where number = takeWhile (=='3') option

main = do
    handle <- openFile "/sys/class/dmi/id/chassis_type" ReadMode
    contents <- hGetContents handle
    let xmobar_instance = xmobar contents
    xmproc <- spawnPipe $ "xmobar $HOME/.config/xmobar/" ++ xmobar_instance
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor "#14a61b" "" . wrap "<[" "]>" -- Current workspace in xmobar
              , ppHidden = xmobarColor "#3c98c7" "" . wrap "<icon=asterisk.xpm/>" ""   -- Hidden workspaces in xmobar
              , ppHiddenNoWindows = xmobarColor "#ffffff" ""        -- Hidden workspaces (no windows)
              , ppSep =  "<fc=#FFD700> \63196 </fc>"                     -- Separators in xmobar
              , ppUrgent = xmobarColor "#000000" "" . wrap "!" "!"  -- Urgent workspace
              , ppOrder  = \(ws:l:_) -> [ws,l]
              }
        , modMask            = M.myModMask M.custom
        , terminal           = M.myTerminal M.applications
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = M.myBorderWidth M.custom
        , normalBorderColor  = "#292d3e"
        , focusedBorderColor = "#445e02"
        } `additionalKeysP` myKeys
