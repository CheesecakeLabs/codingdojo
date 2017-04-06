module CodeSpec (main, spec) where

import Test.Hspec
import Code

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "next score" $ do
    it "should add x and y" $ do
      shouldBe (add 1 1) 2

