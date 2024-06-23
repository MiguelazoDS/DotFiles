module Workspaces
    ( myWorkspaces
    ) where

import Data.List as L

workspaceNumber :: Int
workspaceNumber = 7

icon :: String
icon = "\62060 "

xmobarEscape = concatMap doubleLts
  where
        doubleLts x   = [x]

workspaceColor :: String
workspaceColor = "#5ac1db"

myWorkspaces :: [String]
myWorkspaces = clickable $ replicate workspaceNumber $ xmobarEscape "<fc=" ++ workspaceColor ++ "><fn=2>" ++ icon ++ "</fn></fc>"
   where
         clickable l = [ "<action=xdotool key super+" ++ show workspaceNumber ++ ">" ++ ws ++ "</action>" |
                       (i,ws) <- zip [1..workspaceNumber] l, let workspaceNumber = i ]
