module Main where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import DaysDick

instance HasDays Days where days = id

data Month = Month deriving (Show, Enum, Bounded)
instance HasDays Month where days = const 28
instance Arbitrary Month where arbitrary = arbitraryBoundedEnum

main :: IO ()
main = hspec $ do

  context "Dick conversion" $ do
    let dick = toDick :: Days -> String

    it "Simple int example" $
      dick 17 `shouldBe` "8=================D"

    describe "Universal properties of dick" $ do
      prop "Always starts with balls" $ \d ->
        dick d `shouldStartWith` "8"
      prop "Always ends with glans" $ \d ->
        dick d `shouldEndWith` "D"
      prop "Has only balls, shaft and glans" $ \d ->
        dick d `shouldSatisfy` all (`elem` "8=D")
      prop "No dicks are too small" $ \d ->
        d < 0 ==> dick d `shouldBe` dick 0
      prop "Shouldn't be too big" $ \d ->
        d >= 0 ==> length (dick d) `shouldSatisfy` (<= d + 2)
      prop "Days define shaft length" $ \d ->
        d >= 0 ==> length (filter (== '=') $ dick d) `shouldBe` d

    prop "Month's dick's size is the dick size of its days" $ \month -> do
      let m = month :: Month
      length (toDick m) `shouldBe` length (dick $ days m)
