{- |
  Module: DaysDick
  Description: Uptime days stringification
  Copyright: (c) 2025 Mirko Westermeier
  License: MIT
  Maintainer: mirko@westermeier.de
  Stability: gold-stable

  /In the beginning, there was time – infinite, immeasurable, and fleeting./
  /But humanity, ever the artist, sought to capture it."/

  Welcome to "DaysDick", a module that dares to blend the precision of
  computation with the whimsy of art. Here, days are not just numbers; they
  are stories waiting to be told, sculptures waiting to be shaped. From the
  abstract concept of time to the concrete representation of ASCII art, this
  module transforms the extraordinary into the ordinary.

  Whether you're measuring the uptime of a system or contemplating the passage
  of days, "DaysDick" offers a unique perspective. It is a playful ode to the
  absurd, a reminder that even the most serious of tasks can be approached with
  humor and creativity. So step into this world of equal signs and glans, and
  discover the beauty of time, one dick at a time.
-}
module DaysDick
  ( -- *  Time flies like an arrow; fruit flies like a banana
    -- |  'Days' is the essence of time, distilled into a simple, countable
    --    unit. Whether it's a fleeting moment or an eternity, 'Days' is here to
    --    remind you that every day counts – even if it's just to measure the
    --    length of a dick.
    Days
  , HasDays(..)
    -- *  Bold curvature and elegant simplicity: a canvas of time
    -- |  /Art is not what you see, but what you make others see./
    --
    --    'toDick' is not just a function; it is a canvas. It takes the mundane
    --    concept of days and transforms it into a work of ASCII art,
    --    celebrating form and function. Each output is a unique sculpture,
    --    shaped by the number of days it represents. Call it absurd, call it
    --    genius – but above all, call it art.
  , toDick
  ) where

import System.SysInfo

-- |  A day is a singular entity, whole and unbroken, a vessel that carries
--    the weight of time. It cannot be split, for its essence lies in its
--    unity. From the first light of dawn to the quiet embrace of midnight,
--    a day is a journey, complete in itself.
type Days = Int

-- |  For to have days is to exist in the rhythm of time, to partake in the
--    endless dance of beginnings and endings, and to leave behind a trace,
--    however small, in the tapestry of eternity.
class HasDays a where
  days :: a -> Days
  -- ^  To reveal one's days is to share a piece of existence, a glimpse into
  --    the rhythm of life. It is a quiet act of honesty, both humble and
  --    profound.

-- |  Even a machine, cold and unfeeling, holds time within its circuits.
--    Its uptime ticks like a silent heartbeat, a testament to its endurance.
--    In its unbroken flow of seconds, it mirrors the stars, tracing its own
--    path through the cosmos of computation, reminding us that even systems
--    live in time.
instance HasDays SysInfo where
  days = (`div` (60*60*24)) . fromIntegral . uptime

-- |  The ultimate showdown.
--
--    >>> toDick week
--    8=======D
toDick :: HasDays days => days -> String
toDick x = "8" ++ replicate (days x) '=' ++ "D"
