# Tennis Game

In this problem you will implement the rules of a simple tennis game (only two players). They are:

* In each game, a player can have the following points: 0, 15, 30 or 40.
* The players start with 0 points.
* If the player has 40 points and wins the match, he wins the game.
* If both players reach 40 points, there's a deuce.
* Being in deuce, the player who wins the match will be in advantage.
* If the player in advantage wins the match again, he wins the game.
* If the player is in advantage and the other one wins the match, there's a deuce again.

The code should receive both players score and the player that will win the match, returning the result score.

[Source](http://dojopuzzles.com/problemas/exibe/partida-de-tenis/)

# Haskell Template

## Install
`cabal install --only-dependencies --enable-tests`

## Run
`cabal test`
