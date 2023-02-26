module Workspaces
    ( myWorkspaces
    ) where

import Data.List as L

n :: Int
n = 7

xmobarEscape = concatMap doubleLts
  where
        doubleLts x   = [x]

myWorkspaces :: [String]
myWorkspaces = clickable $ replicate n $ xmobarEscape "<fc=#FDD29E,#222222><fn=2>\986705</fn></fc>"
   where
         clickable l = [ "<action=xdotool key super+" ++ show n ++ ">" ++ ws ++ "</action>" |
                       (i,ws) <- zip [1..n] l, let n = i ]
