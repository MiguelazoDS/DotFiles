module Workspaces
    ( myWorkspaces 
    ) where

import Data.List as L

xmobarEscape = concatMap doubleLts
  where
        doubleLts x   = [x]

myWorkspaces :: [String]
myWorkspaces = clickable $ replicate 5 $ xmobarEscape "<icon=workspace.xpm/>"
   where
         clickable l = [ "<action=xdotool key super+" ++ show n ++ ">" ++ ws ++ "</action>" |
                       (i,ws) <- zip [1..5] l, let n = i ]
