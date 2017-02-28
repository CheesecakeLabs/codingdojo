# Find the telephone number

Some places it is common to remember a telephone number by associating its digits with characters, this way the phrase `MY LOVE` can be translated to `69 5683`. Of course there are some problems, as some phone numbers do not form a phrase and the numbers 0 and 1 are not associated with a char.
The task is read an expression and find the telephone number based on the table below. One expression is constructed by upper case chars, hyphen and the numbers 1 and 0. 

```
Chars  ->  Number
* ABC    ->  2
* DEF    ->  3
* GHI    ->  4
* JKL    ->  5
* MNO    ->  6
* PQRS   ->  7
* TUV    ->  8
* WXYZ   ->  9
```

The input consists in a set of expressions. Each expression is alone in one line and has C characters, where `1 ≤ C ≤ 30`. The input is determined by the end of file (EOF).
For each expression you should print the telephone number correspondent.

*Input Example*:
```
1-HOME-SWEET-HOME
MY-MISERABLE-JOB
```

*Out Example*:
```
1-4663-79338-4663
69-647372253-562
```

[Source](http://dojopuzzles.com/problemas/exibe/encontre-o-telefone/)

# Javascript Template

## Install
`npm install`

## Run
`npm test`
