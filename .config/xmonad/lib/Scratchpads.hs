module Scratchpads
    ( myScratchPads
    ) where

import XMonad
import qualified XMonad.StackSet as W
import Misc as M
import XMonad.Util.NamedScratchpad

myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "moc" spawnMocp findMocp manageMocp
                , NS "easyeffects" spawnEffects findEffects manageEffects
                ]

    where
    spawnTerm  = M.myTerminal M.applications ++ " start --class scratchpad"
    findTerm   = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect x y w h
    spawnMocp  = M.myTerminal M.applications ++  " start --class=moc --always-new-process 'mocp'"
    findMocp   = resource =? "moc"
    manageMocp = customFloating $ W.RationalRect x y w h
    spawnEffects = "easyeffects"
    findEffects = resource =? "easyeffects"
    manageEffects = customFloating $ W.RationalRect x y w h
    x = 0.01
    y = 0.01
    w = 0.98
    h = 0.98

