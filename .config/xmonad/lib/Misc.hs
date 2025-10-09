module Misc
  ( Applications (..),
    Custom (..),
    applications,
    custom,
  )
where

import GHC.Word
import XMonad

data Applications = Applications
  { myTerminal :: String,
    myTextEditor :: String,
    myBrowser :: String,
    myMusicPlayer :: String,
    myVideoPlayer :: String,
    myFileManager :: String
  }
  deriving (Eq, Show)

data Custom = Custom
  { myModMask :: KeyMask,
    myBorderWidth :: GHC.Word.Word32
  }

applications :: Applications
applications =
  Applications
    { myTerminal = "wezterm",
      myTextEditor = "nvim",
      myBrowser = "firefox",
      myMusicPlayer = "moc",
      myVideoPlayer = "mpv",
      myFileManager = "pcmanfm"
    }

custom :: Custom
custom =
  Custom
    { myModMask = mod4Mask,
      myBorderWidth = 2
    }
