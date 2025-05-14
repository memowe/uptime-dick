module Main where

import DaysDick
import System.IO
import System.SysInfo

main :: IO ()
main = sysInfo >>= either (const abort) (putStrLn . toDick)
  where abort = hPutStrLn stderr "Couldn't retrieve uptime"
