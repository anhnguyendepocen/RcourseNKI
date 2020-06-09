---
title: "Basic data types (cont.)"
date: "09 juni 2020"
---



# Basic data types (cont.) (tasks)

## Numeric vectors {#numeric}

### Primary tasks

- Create a variable `v` to be a vector of (46,43,...,19,16,13).
    - Show `v` to check the numbers. 
    - Show the `head` of 4 elements of `v`.
    - Show the `tail` of 3 elements of `v`.
    - Calculate the length of `v`.

```r
v <- seq( 46, 13, -3 )
v
```

```
 [1] 46 43 40 37 34 31 28 25 22 19 16 13
```

```r
head( v, 4 )
```

```
[1] 46 43 40 37
```

```r
tail( v, 3 )
```

```
[1] 19 16 13
```

```r
length( v )
```

```
[1] 12
```

- Create a variable `v` to be a vector of (50,40,30,20,10,5,4,3,2,1,NA). 
    - Use once `seq`, and once `:` (colon). 
    - Show `v` to check the numbers.

```r
v <- c( seq( 50, 10, -10),5:1,NA )
v
```

```
 [1] 50 40 30 20 10  5  4  3  2  1 NA
```

### Extra tasks

- Sometimes it is useful to create a vector of given number _n_ of zeroes. Try the function `numeric( n )` to create a vector of 25 zeroes, then create an empty numeric vector with nothing (so, zero zeroes). (*)

```r
v <- numeric( 25 )
v
```

```
 [1] 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
```

```r
v <- numeric()
v
```

```
numeric(0)
```

- Read the manual of `rep`. Construct a vector 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2... with 20 pattern repetitions. (*)

```r
rep( 0:2, 20 )
```

```
 [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1
[39] 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2 0 1 2
```

- Use `rep`. Construct the first 13 elements of a vector 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2... Check the length of the result. (*)

```r
v <- rep( 0:2, length.out = 13 )
v
```

```
 [1] 0 1 2 0 1 2 0 1 2 0 1 2 0
```

```r
length( v )
```

```
[1] 13
```

- Read manual of function `rev`. Use this function and the `v` from the previous task to build a vector of (50,40,30,20,10,5,4,3,2,1,NA,NA,1,2,3,4,5,10,20,30,40,50). (*)

```r
c( v, rev( v ) )
```

```
 [1] 0 1 2 0 1 2 0 1 2 0 1 2 0 0 2 1 0 2 1 0 2 1 0 2 1 0
```

## Character vectors {#character}

### Primary tasks

- Use `readLines` function to read contents of the `survey.txt` file into a (one-dimensional) character vector.  Count the number of lines. Show the first and the last 3 lines. Use the `View` command to show the vector and compare to the view obtained for `survey` data frame, which you used earlier in the course.

```r
lines <- catReadLines( "survey.txt", "lines" )
```

```
# To get 'survey.txt' directly from the server, use:
# lines <- readLines( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/survey.txt" ) )
```

```r
length( lines )
```

```
[1] 234
```

```r
head( lines, 3 )
```

```
[1] "name\tgender\tspan1\tspan2\thand\tfold\tpulse\tclap\texercise\tsmokes\theight\tm.i\tage"     
[2] "C.4257\tAlyson\tfemale\t18.5\t18\tright\tright\t92\tleft\tsome\tnever\t173\tmetric\t18.25"   
[3] "B.1335\tTodd\tmale\t19.5\t20.5\tleft\tright\t104\tleft\tnone\tregul\t177.8\timperial\t17.583"
```

```r
tail( lines, 3 )
```

```
[1] "A.7270\tTracey\tfemale\t17.5\t16.5\tright\tright\tNA\tright\tsome\tnever\t170\tmetric\t18.583" 
[2] "E.5571\tKeith\tmale\t21\t21.5\tright\tright\t90\tright\tsome\tnever\t183\tmetric\t17.167"      
[3] "B.8331\tCelina\tfemale\t17.6\t17.3\tright\tright\t85\tright\tfreq\tnever\t168.5\tmetric\t17.75"
```

```r
lines <- read.delim( "data/pulse.txt" )
```

### Extra tasks

- Create a character vector `fruits` with 5 random and different fruit names. Check how it is shown. (*)

```r
fruits <- c( "apple", "pear", "orange", "lemon", "cherry" )
fruits
```

```
[1] "apple"  "pear"   "orange" "lemon"  "cherry"
```

- Use the `fruits` vector. Understand `nchar( fruits )`. (*)

```r
nchar( fruits )
```

```
[1] 5 4 6 5 6
```

- Build (manually) a vector _idx_ so, that `fruits[ idx ]` prints fruit names in alphabetical order. (*)

```r
idx <- c( 1, 5, 4, 3, 2 )
fruits[ idx ]
```

```
[1] "apple"  "cherry" "lemon"  "orange" "pear"  
```

- understand the result of function `order( fruits )`. (*)

```r
order( fruits )
```

```
[1] 1 5 4 3 2
```

- Sometimes it is useful to create a vector of given number _n_ of empty texts. Try the function `character( n )` to create a vector of 5 empty texts, then create an empty character vector with nothing (so, zero empty texts). (*)

```r
v <- character( 5 )
v
```

```
[1] "" "" "" "" ""
```

```r
v <- character()
v
```

```
character(0)
```

- Read the documentation of `rep`. Then understand the code below. (*)

```r
c( rep( "male", 2 ), rep( "female", 1 ) )
rep( c( "male", "female" ), c( 2, 1 ) )
```

## Logical vectors {#logical}

### Primary tasks

- Negation operator: 
    - Practice, what the negation operator produces for these there logical constants: `FALSE`, `TRUE`, `NA`.

```r
!TRUE
```

```
[1] FALSE
```

```r
!FALSE
```

```
[1] TRUE
```

```r
!NA
```

```
[1] NA
```

- AND (vector) operator: 
    - Once symmetries are accounted for, there are six possible combinations of two different values (`a`, `b`)  selected from the three logical constants: `FALSE`, `TRUE`, `NA`. Consider all six of them as arguments to the `&` operator. First predict the result of `a & b` and then calculate it.

```r
F & F
```

```
[1] FALSE
```

```r
F & T
```

```
[1] FALSE
```

```r
F & NA
```

```
[1] FALSE
```

```r
T & T
```

```
[1] TRUE
```

```r
T & NA
```

```
[1] NA
```

```r
NA & NA
```

```
[1] NA
```

- Make a vector `v <- 19:10`. Build a logical vector `w` which states which positions of `v` are smaller than 12 or at least 17. Print both `v` and `w` to check by eye whether the result is correct.

```r
v <- 19:10
v
```

```
 [1] 19 18 17 16 15 14 13 12 11 10
```

```r
w <- v < 12 | v >= 17
w
```

```
 [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
```

- Study the logical vector `w` from the previous task. Count how many positions are `TRUE`. For this use the `sum` function.

```r
w
```

```
 [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
```

```r
sum( w )
```

```
[1] 5
```

### Extra tasks

- OR (vector) operator: (*)
    - Reproduce the "AND operator" exercise for the `|` (or) operator.

- Elements on `which` positions (indices) are `TRUE`: (*)
    - Study the logical vector `w` from the earlier task. 
    - First, answer yourself the question: which positions in `w` are `TRUE`. 
    - Was your answer the same as the result of `which( w )`? 
    - Can you explain `which( LETTERS == "R" )`?

```r
which( w )
```

```
[1]  1  2  3  9 10
```

```r
which( LETTERS == "R" )
```

```
[1] 18
```

- Even numbers: (*)
    - Even numbers are dividable by two with rest zero.
    - Rest of division can be calculated with the `%%` operator. 
    - Take the vector `v <- 19:10` and construct the corresponding logical vector `w` stating whether elements of `v` are dividable by two.

```r
v <- 19:10
v
```

```
 [1] 19 18 17 16 15 14 13 12 11 10
```

```r
v %% 2
```

```
 [1] 1 0 1 0 1 0 1 0 1 0
```

```r
v %% 2 == 0
```

```
 [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
```

```r
w <- v %% 2 == 0
w
```

```
 [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
```

- AND, OR (single/first value) operators `&&`, `||`: (*)
    - They work on single values (instead of complete vectors) and are frequently used in programming.
    - Check the manual ``?`&&` ``. Try with some logical values similarly to `&` and `|`.

- AND, OR (single/first value) functions `all`, `any`:
    - Programs are more readable, when instead of `a && b && c && d` the following code is written: `all( a, b, c, d )`. 
    - Read the manual for `all`, `any`. (*)

- Sometimes it is useful to create a vector of given number _n_ of empty texts. Try the function `character( n )` to create a vector of 5 empty texts, then create an empty character vector with nothing (so, zero empty texts). (*)

```r
v <- character( 5 )
v
```

```
[1] "" "" "" "" ""
```

```r
v <- numeric( 0 )
v
```

```
numeric(0)
```

## Type conversions {#conversions}

### Primary tasks

- Take the following character vector: `v <- c( "0", "1", "11", "121", "1221", "one" )`. Check the result of `as.numeric( v )`.

```r
v <- c( "0", "1", "11", "121", "1221", "one" )
v
```

```
[1] "0"    "1"    "11"   "121"  "1221" "one" 
```

```r
as.numeric( v )
```

```
Warning: NAs introduced by coercion
```

```
[1]    0    1   11  121 1221   NA
```

- Produce texts (character vector) out of numbers `101:110`.

```r
as.character( 101:110 )
```

```
 [1] "101" "102" "103" "104" "105" "106" "107" "108" "109" "110"
```

- Convert `c( -1:1, NA )` to a logical vector with `as.logical`. Explain the result.

```r
# NA stays NA, zero becomes FALSE, other values become TRUE
as.logical( c( -1:1, NA ) )
```

```
[1]  TRUE FALSE  TRUE    NA
```

### Extra tasks

- Which of elements of `c( "TRUE", "True", "true", "T", "FALSE", "False", "false", "F" )` are converted to valid logical values with `as.logical`? (*)

```r
as.logical( c( "TRUE", "True", "true", "T" ) )
```

```
[1] TRUE TRUE TRUE TRUE
```

```r
as.logical( c( "FALSE", "False", "false", "F" ) )
```

```
[1] FALSE FALSE FALSE FALSE
```

```r
as.logical( c( "f", "t", "F", "T" ) )
```

```
[1]    NA    NA FALSE  TRUE
```

- Sometimes it is useful to create a vector of given number _n_ of `FALSE` values. Try the function `logical( n )` to create a vector of 5 `FALSE`s, then create an empty logical vector. (*)

```r
v <- logical( 5 )
v
```

```
[1] FALSE FALSE FALSE FALSE FALSE
```

```r
v <- logical()
v
```

```
logical(0)
```
