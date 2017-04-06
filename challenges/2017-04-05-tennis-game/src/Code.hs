module Code where

calcNextScore :: Integer -> [Integer] -> [Integer]
calcNextScore player [40, 40] =
  case player of
    1 -> [45, 40]
    2 -> [40, 45]
    _ -> [40, 40]
calcNextScore player [45, 40] =
  case player of
    1 -> [50, 40]
    2 -> [40, 40]
    _ -> [45, 40]
calcNextScore player [40, 45] =
  case player of
    1 -> [40, 40]
    2 -> [40, 50]
    _ -> [40, 45]
calcNextScore player currScore =
  case player of
    1 ->
      [ calculateNextPoint (head currScore)
      , currScore !! 1
      ]
    2 ->
      [ currScore !! 0
      , calculateNextPoint (last currScore)
      ]
    _ ->
      currScore

playerOneScore :: [Integer] -> [Integer]
playerOneScore =
  calcNextScore 1

playerTwoScore :: [Integer] -> [Integer]
playerTwoScore =
  calcNextScore 2

calculateNextPoint :: Integer -> Integer
calculateNextPoint 0 = 15
calculateNextPoint 15 = 30
calculateNextPoint 30 = 40
calculateNextPoint point = point
