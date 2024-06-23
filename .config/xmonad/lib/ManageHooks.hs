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
     , (className =? "floorp" <&&> appName =? "Places") --> doFloat
     , (className =? "floorp" <&&> resource =? "Dialog") --> doFloat
     , (className =? "floorp" <&&> title =? "About Ablaze Floorp") --> doFloat
     ]
