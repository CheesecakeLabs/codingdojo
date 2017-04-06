module CodeSpec (main, spec) where

import Test.Hspec
import Code

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "next score" $ do
    it "should add point to first player" $ do
      shouldBe (calcNextScore 1 [0, 0]) [15, 0]
      shouldBe (calcNextScore 2 [0, 0]) [0, 15]
      shouldNotBe (calcNextScore 2 [0, 0]) [0, 150]
      shouldBe (playerOneScore [0, 0]) [15, 0]
      shouldBe (playerTwoScore [0, 0]) [0, 15]
      shouldBe (calcNextScore 3 [0, 0]) [0, 0]
      shouldBe (calculateNextPoint 15) 30
      shouldBe (calculateNextPoint 30) 40
      shouldBe (playerTwoScore [0, 30]) [0, 40]
      shouldBe (playerOneScore [30, 15]) [40, 15]
      shouldBe (playerOneScore [40, 40]) [45, 40]
      shouldBe (playerOneScore [45, 40]) [50, 40]
      shouldBe (playerOneScore [40, 45]) [40, 40]
      shouldBe (playerOneScore [50, 40]) [50, 40]
