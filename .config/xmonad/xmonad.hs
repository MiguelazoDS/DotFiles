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
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, pad, xmobarPP, xmobarColor, xmobarBorder, shorten, PP(..))
import           XMonad.Hooks.StatusBar.PP           (PP (..), filterOutWsPP,
                                                      shorten', wrap,
                                                      xmobarAction,
                                                      xmobarBorder, xmobarColor,
                                                      xmobarFont, xmobarStrip)
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Hooks.EwmhDesktops   -- required for xcomposite in obs to work
-- import Basement.Types.Char7 (c7_1)

ppCurrentColor :: String
ppCurrentColor = "#8d8f18"

ppHiddenColor :: String
ppHiddenColor = "#db3e2c"

ppHiddenNoWindowsColor :: String
ppHiddenNoWindowsColor = "#e7d7ad"

ppSepColor :: String
ppSepColor = "#db9a27"

ppUrgentColor :: String
ppUrgentColor = "#202020"

main = do
    xmproc <- spawnPipe "xmobar $HOME/.config/xmonad/xmobarrc.hs"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              { ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor ppCurrentColor "" . xmobarBorder "Bottom" ppCurrentColor 3
              , ppHidden = xmobarColor ppHiddenColor "" . xmobarBorder "Bottom" ppHiddenColor 3
              , ppHiddenNoWindows = xmobarColor ppHiddenNoWindowsColor ""
              , ppSep =  "<fc=" ++ ppSepColor ++ "> </fc>"
              , ppUrgent = xmobarColor ppUrgentColor "" . wrap "!" "!"
              , ppOrder  = \(ws:l:_) -> [ws,l]
              }
        , modMask            = M.myModMask M.custom
        , terminal           = M.myTerminal M.applications
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = M.myBorderWidth M.custom
        , normalBorderColor  = ppUrgentColor
        , focusedBorderColor = ppCurrentColor
        } `additionalKeysP` myKeys
