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

wrapSep :: String -> String
wrapSep = wrap (xmobarColor "#717733" "" (xmobarFont 5 "\xe0b6"))
               (xmobarColor "#717733" "" (xmobarFont 5 "\xe0b4"))

main = do
    xmproc <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc.hs"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageHook desktopConfig <+> manageDocks
        , logHook = dynamicLogWithPP xmobarPP
              { -- ppSep = wrapSep " "
              ppOutput = hPutStrLn xmproc
              , ppCurrent = xmobarColor "#717733" "" . xmobarBorder "Bottom" "#717733" 3 -- . wrap "<{" "}>" -- Current workspace in xmobar
              , ppHidden = xmobarColor "#A53C23" "" . xmobarBorder "Bottom" "#A53C23" 3 --wrap "*" ""   -- Hidden workspaces in xmobar
              , ppHiddenNoWindows = xmobarColor "#DEB88D" ""        -- Hidden workspaces (no windows)
              , ppSep =  "<fc=#FBA02F> </fc>"                     -- Separators in xmobar
              , ppUrgent = xmobarColor "#303030" "" . wrap "!" "!"  -- Urgent workspace
              , ppOrder  = \(ws:l:_) -> [ws,l]
              }
        , modMask            = M.myModMask M.custom
        , terminal           = M.myTerminal M.applications
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = M.myBorderWidth M.custom
        , normalBorderColor  = "#424B52"
        , focusedBorderColor = "#67A0CD"
        } `additionalKeysP` myKeys
