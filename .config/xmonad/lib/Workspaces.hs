module Workspaces
  ( myWorkspaces,
  )
where

workspaceNumber :: Int
workspaceNumber = 7

defaultColor :: String
defaultColor = "#242424"

icon :: String
icon = "\62060 "

workspaceColor :: String -> String
workspaceColor color = "<fc=#e7d7ad," ++ color ++ "><fn=0>" ++ icon ++ "</fn></fc>"

openIcon :: String -> String
openIcon color = "<fc=" ++ color ++ "><fn=1>\57526</fn></fc>"

closeIcon :: String -> String
closeIcon color = "<fc=" ++ color ++ "><fn=1>\57524</fn></fc>"

myWorkspaces :: [String]
myWorkspaces =
  [ "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
     | (i, ws) <- zip [1 .. workspaceNumber] workspaceList
  ]
  where
    workspaceList = replicate workspaceNumber $ openIcon defaultColor ++ workspaceColor defaultColor ++ closeIcon defaultColor

