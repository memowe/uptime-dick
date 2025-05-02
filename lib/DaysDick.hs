module DaysDick where

type Days = Int

class HasDays a where
  days :: a -> Days

toDick :: HasDays days => days -> String
toDick x = "8" ++ replicate (days x) '=' ++ "D"
