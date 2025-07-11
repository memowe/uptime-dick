{- |
  Module: DaysDick
  Description: Uptime days stringification
  Copyright: (c) 2025 Mirko Westermeier
  License: MIT
  Maintainer: mirko@westermeier.de
-}
module DaysDick
  ( -- * Extracting days
    Days
  , HasDays(..)
    -- * Days visualization with ASCII art
  , toDick
  ) where

import System.SysInfo

type Days = Int

class HasDays a where
  days :: a -> Days

-- | Extracting days from a 'SysInfo' gives days of 'uptime'.
instance HasDays SysInfo where
  days si = fromIntegral (uptime si) `div` (60*60*24)

-- | >>> toDick week
-- 8=======D
toDick :: HasDays days => days -> String
toDick x = "8" ++ replicate (days x) '=' ++ "D"
