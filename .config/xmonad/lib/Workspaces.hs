module Workspaces
  ( myWorkspaces,
  )
where

workspaceNumber :: Int
workspaceNumber = 7

icon :: String
icon = "\62060 "

xmobarEscape :: [b] -> [b]
xmobarEscape = concatMap doubleLts
  where
    doubleLts x = [x]

workspaceColor :: String
workspaceColor = "#5ac1db,#242424"

open :: String
open = "<fc=#242424><fn=1>\57526</fn></fc>"

close :: String
close = "<fc=#242424><fn=1>\57524</fn></fc>"

myWorkspaces :: [String]
myWorkspaces =
  [ "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
    | (i, ws) <- zip [1 .. workspaceNumber] workspaceList
  ]
  where
    workspaceList = replicate workspaceNumber $ xmobarEscape $ open ++ "<fc=" ++ workspaceColor ++ "><fn=1>" ++ icon ++ "</fn></fc>" ++ close
