module Layouts
    ( myLayoutHook
    ) where

import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Layout.NoBorders
import XMonad.Actions.MouseResize
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.Spacing
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), Toggle(..), (??))
import XMonad.Layout.Renamed (renamed, Rename(CutWordsLeft, Replace))
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad

myLayoutHook = avoidStruts $ smartBorders $ mouseResize $ windowArrange $ mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
          where
          myDefaultLayout = grid ||| noBorders monocle

mySpacing = spacingRaw True (Border 0 0 0 0) True (Border 2 2 2 2) True

grid       = renamed [Replace "\64111"] $ limitWindows 12 $ mySpacing $ mkToggle (single MIRROR) $ Grid (16/10)
monocle    = renamed [Replace "<fn=1>\63378</fn>"] $ limitWindows 20 Full
