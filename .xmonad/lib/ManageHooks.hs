module ManageHooks
    ( myManageHook
    ) where

import XMonad
import Data.Monoid
import XMonad.Util.NamedScratchpad
import Scratchpads
import XMonad.Hooks.Place

myManageHook :: Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
       [namedScratchpadManageHook myScratchPads]                -- Must be first to avoid being affected by placeHook
       <+> myManageHook'

myManageHook' = composeAll
    [ placeHook $ fixed (0.5,0.5)                               -- Set floating windows at the center
     , className =? "ffplay"             --> doFloat
     , appName =? "nomacs"               --> doFloat
     , className =? "mpv"                --> doFloat
     , title =? "gitk"                   --> doFloat
     , className =? "JDownloader"        --> doFloat
     , className =? "Yad"                --> doFloat
     , (className =? "firefox" <&&> appName =? "Places") --> doFloat
     , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
     , (className =? "firefox" <&&> title =? "About Mozilla firefox") --> doFloat
     ]
