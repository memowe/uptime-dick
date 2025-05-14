module Main where

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck
import DaysDick
import System.SysInfo

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

    describe "Different HasDays instances" $ do
      prop "Month's dick is the dick of its days" $ \month -> do
        let m = month :: Month
        toDick m `shouldBe` dick (days m)
      prop "System info's uptime in days as dick size" $ \d ->
        forAll (genSysInfo d) $ \sinfo ->
          toDick sinfo `shouldBe` dick d

genSysInfo :: Days -> Gen SysInfo
genSysInfo d = SysInfo (fromIntegral (d * 24 * 60 * 60))
  <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary
  <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary
  <*> arbitrary <*> arbitrary <*> arbitrary

instance Arbitrary Loads where
  arbitrary = Loads <$> arbitrary
