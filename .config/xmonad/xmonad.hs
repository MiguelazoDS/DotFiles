import Bindings
import Layouts
import ManageHooks
import Misc as M
import StartupHooks
import System.IO
import Workspaces
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog (PP (..), dynamicLogWithPP, wrap, xmobarBorder, xmobarColor, xmobarPP)
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (spawnPipe)

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

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar $HOME/.config/xmonad/xmobarrc.hs"
  xmonad $
    ewmh
      desktopConfig
        { manageHook = (isFullscreen --> doFullFloat) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks,
          logHook =
            dynamicLogWithPP
              xmobarPP
                { ppOutput = hPutStrLn xmproc,
                  -- , ppCurrent = xmobarColor ppCurrentColor "" . xmobarBorder "Bottom" ppCurrentColor 3
                  ppCurrent = \wsId ->
                    if wsId == "NSP"
                      then
                        xmobarColor "#242424" "" "<fn=1>\57526</fn>"
                          ++ xmobarColor "#e7d7ad" "#242424" "NSP"
                          ++ xmobarColor "#242424" "" "<fn=1>\57524</fn>"
                      else xmobarColor ppCurrentColor "" . xmobarBorder "Bottom" ppCurrentColor 3 $ wsId,
                  -- , ppHidden = xmobarColor ppHiddenColor "" . xmobarBorder "Bottom" ppHiddenColor 3
                  ppHidden = \wsId ->
                    if wsId == "NSP"
                      then
                        xmobarColor "#242424" "" "<fn=1>\57526</fn>"
                          ++ xmobarColor "#e7d7ad" "#242424" "NSP"
                          ++ xmobarColor "#242424" "" "<fn=1>\57524</fn>"
                      else xmobarColor ppHiddenColor "" . xmobarBorder "Bottom" ppHiddenColor 3 $ wsId,
                  ppHiddenNoWindows = xmobarColor ppHiddenNoWindowsColor "",
                  ppSep = "<fc=" ++ ppSepColor ++ "> </fc>",
                  ppUrgent = xmobarColor ppUrgentColor "" . wrap "!" "!",
                  ppOrder = \(ws : l : _) -> [ws, l],
                  ppWsSep = ""
                },
          modMask = M.myModMask M.custom,
          terminal = M.myTerminal M.applications,
          startupHook = myStartupHook,
          layoutHook = myLayoutHook,
          workspaces = myWorkspaces,
          borderWidth = M.myBorderWidth M.custom,
          normalBorderColor = ppUrgentColor,
          focusedBorderColor = ppCurrentColor
        }
      `additionalKeysP` myKeys
