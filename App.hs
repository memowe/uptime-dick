module Main where

import DaysDick
import System.IO
import System.SysInfo

instance HasDays SysInfo where
  days = (`div` (60*60*24)) . fromIntegral . uptime

main :: IO ()
main = sysInfo >>= either (const abort) (putStrLn . toDick)
  where abort = hPutStrLn stderr "Couldn't retrieve uptime"
