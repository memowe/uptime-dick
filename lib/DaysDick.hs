module DaysDick where

import System.SysInfo

type Days = Int

class HasDays a where
  days :: a -> Days

instance HasDays SysInfo where
  days = (`div` (60*60*24)) . fromIntegral . uptime

toDick :: HasDays days => days -> String
toDick x = "8" ++ replicate (days x) '=' ++ "D"
