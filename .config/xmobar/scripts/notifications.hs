import Data.Map as Map
import Data.List as List
import System.Process
import DBus.Notify
import Data.List.Split
import System.Environment


calculate :: [String] -> [String] -> String
calculate xs ys 
    | lxs + lys == 0 = "System up to date"
    | otherwise = unlines xs ++ unlines ys
    where 
        lxs = length xs
        lys = length ys


select :: Client -> String -> IO Notification
select cl xs
    | xs == "updates" = updates cl 


updates :: Client -> IO Notification
updates client = do
    let get_updates = blankNote { summary="Obtaining updates",
                                appImage=Just $ Icon "dialog-information"} 

    notification <- notify client get_updates
    (_,base,_) <- readCreateProcessWithExitCode (shell "checkupdates") []
    (_,aur,_) <- readCreateProcessWithExitCode (shell "checkupdates-aur") []
    (_,cal,_) <- readCreateProcessWithExitCode (shell "cal") []

    let result = calculate (lines base) (lines aur)

    let hello = blankNote { summary="Available Updates",
                               body=Just $ Text result,
                               appImage=Just $ Icon "dialog-information"}

    replace client notification hello


main :: IO ()
main = do
    client <- connectSession
    args <- getArgs
    select client (head args)
    putStrLn ""
