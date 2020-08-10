module Misc 
    ( Applications (..)
    , applications
    ) where

import XMonad

data Applications = Applications 
    { myTerminal :: String
    , myTextEditor :: String
    , myBrowser :: String
    , myMusicPlayer :: String 
    , myVideoPlayer :: String 
    } deriving (Eq, Show)

data Custom = Custom
    { myModMask :: KeyMask
    , myBorderWidth :: Int 
    }

applications = Applications 
    { myTerminal = "kitty --single-instance"
    , myTextEditor = "nvim"
    , myBrowser = "firefox"
    , myMusicPlayer = "mocp" 
    , myVideoPlayer = "mpv" 
    }

custom = Custom
    { myModMask = mod4Mask
    , myBorderWidth = 2 
    }
