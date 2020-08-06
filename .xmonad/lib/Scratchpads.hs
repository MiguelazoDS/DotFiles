module Scratchpads 
    ( myScratchPads
    ) where

import XMonad
import qualified XMonad.StackSet as W
import Misc as M
import XMonad.Util.NamedScratchpad

myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "moc" spawnMocp findMocp manageMocp
                ]

    where
    spawnTerm  = M.myTerminal M.applications ++  " --name=scratchpad --title='SP terminal'"
    findTerm   = resource =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
    spawnMocp  = M.myTerminal M.applications ++  " --name=moc --title='MOCP' -e 'mocp'"
    findMocp   = resource =? "moc"
    manageMocp = customFloating $ W.RationalRect l t w h
    h = 0.9
    w = 0.9
    t = 0.95 -h
    l = 0.95 -w
