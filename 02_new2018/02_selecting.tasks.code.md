---
title: "Selecting/indexing/subsetting (vector elements, data frame rows/columns, ...) (tasks)"
date: "09 juni 2020"
---



# Selecting/indexing/subsetting (vector elements, data frame rows/columns, ...) (tasks)

## Square brackets operator {#brackets}

Define the following vector:


```r
v <- 101:110
```

### Primary tasks

- Get the seventh element. Get the last element.

```r
v[ 7 ]
```

```
[1] 107
```

```r
v[ length( v ) ]
```

```
[1] 110
```

- Check what happens when you try to get an element with too large index (e.g. 20).

```r
v[ 20 ]
```

```
[1] NA
```

- Check what happens when a negative index is used (e.g. -7). What can negative indices be used for?

```r
v[ -7 ]
```

```
[1] 101 102 103 104 105 106 108 109 110
```

- Set the 5th element of `v` to zero. Check `v` before and after the assignment.

```r
v
```

```
 [1] 101 102 103 104 105 106 107 108 109 110
```

```r
v[ 5 ] <- 0
v
```

```
 [1] 101 102 103 104   0 106 107 108 109 110
```

- Create a vector `idx <- c( 3,7,1 )`. Get elements from positions in `idx`.

```r
idx <- c( 3,7,1 )
v[ idx ]
```

```
[1] 103 107 101
```

### Extra tasks

- Name the elements of `v` with subsequent small letters of alphabet. Use `1:length( v )` to specify the range of the `letters` vector. (*)

```r
names( v ) <- letters[ 1:length( v ) ]
v
```

```
  a   b   c   d   e   f   g   h   i   j 
101 102 103 104   0 106 107 108 109 110 
```

- Get the values of `v` corresponding to positions named `e` and `h`. (*)

```r
v[ c( 'e', 'h' ) ]
```

```
  e   h 
  0 108 
```

- In one operation set the 3rd and 5th elements of `v` to 13 and 15. Check the result. (*)

```r
v
```

```
  a   b   c   d   e   f   g   h   i   j 
101 102 103 104   0 106 107 108 109 110 
```

```r
v[ c( 3, 5 ) ] <- c( 13, 15 )
v
```

```
  a   b   c   d   e   f   g   h   i   j 
101 102  13 104  15 106 107 108 109 110 
```


- Try above operations with double square brackets operator, so instead of `[ idx ]` use `[[ idx ]]`. Observe differences. (*)

## Through utility functions {#utility}

### Result is original vector reordered/sliced

#### Primary tasks

- Reorder/sample a vector randomly: `sample`.
    - Define `v <- 101:110`. Try several times `sample( v )`. 
    - Then try several times `sample( v, 3 )`, `sample( v, 15 )` and `sample( v, 15, replace = TRUE )`.

```r
v <- 101:110
sample( v )
```

```
 [1] 103 108 102 107 101 109 106 105 110 104
```

```r
sample( v )
```

```
 [1] 110 106 104 103 109 105 102 107 108 101
```

```r
sample( v, 3 )
```

```
[1] 103 105 110
```

```r
sample( v, 3 )
```

```
[1] 103 106 107
```

```r
sample( v, 15 )
```

```
Error in sample.int(length(x), size, replace, prob): cannot take a sample larger than the population when 'replace = FALSE'
```

```r
sample( v, 15, replace = TRUE )
```

```
 [1] 107 105 105 110 105 107 103 102 108 108 101 107 103 106 109
```

```r
sample( v, 15, replace = TRUE )
```

```
 [1] 108 106 103 104 105 109 106 110 103 107 105 105 105 108 109
```


- Sort a vector: `sort`. 
    - Define `v <- sample( letters, 10 )`. 
    - Compare `v` to `sort( v )`.

```r
v <- sample( letters, 10 )
v
```

```
 [1] "p" "u" "m" "x" "j" "c" "v" "i" "a" "h"
```

```r
sort( v )
```

```
 [1] "a" "c" "h" "i" "j" "m" "p" "u" "v" "x"
```

#### Extra tasks

- Unique elements of a vector: `unique`. (*)
    - First understand `v <- sample( 101:110, 15, replace = TRUE )`. 
    - Then understand `unique( v )`.

```r
v <- sample( 101:110, 15, replace = TRUE )
v
```

```
 [1] 106 106 105 102 106 106 102 107 103 106 101 110 107 105 108
```

```r
unique( v )
```

```
[1] 106 105 102 107 103 101 110 108
```

- Reverse a vector: `rev`. (*)
    - Define `v <- 101:110`. 
    - Compare `v` to `rev( v )`.

```r
v <- 101:110
v
```

```
 [1] 101 102 103 104 105 106 107 108 109 110
```

```r
rev( v )
```

```
 [1] 110 109 108 107 106 105 104 103 102 101
```

### Result is a logical vector

#### Primary tasks

- Which element(s) are available/missing: `is.na`.
    - Create a random vector `v` with `NA` elements: `v <- sample( c( 0, 1, NA ), 10, replace = TRUE )`. 
    - Understand `is.na( v )` and `v[ !is.na( v ) ]`.

```r
v <- sample( c( 0, 1, NA ), 10, replace = TRUE )
v
```

```
 [1]  1  0  0  0  0  0 NA  0  1  1
```

```r
is.na( v )
```

```
 [1] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
```

```r
v[ !is.na( v ) ]
```

```
[1] 1 0 0 0 0 0 0 1 1
```

#### Extra tasks

- Whether elements of one vector are present in another vector: `%in%`. (*) 
    - Let's check whether elements of `v <- c( "1", "B", "I", "O", "b" )` are among `LETTERS` with `v %in% LETTERS`. 
    - How to interpret the result? 
    - How to find how many of elements in `v` occur in `LETTERS`?

```r
v <- c( "1", "B", "I", "O", "b" )
v
```

```
[1] "1" "B" "I" "O" "b"
```

```r
v %in% LETTERS
```

```
[1] FALSE  TRUE  TRUE  TRUE FALSE
```

```r
sum( v %in% LETTERS )
```

```
[1] 3
```

- Whether elements of a vector are duplicated (have occurred earlier already): `duplicated`. (*)
    - Let's generate a vector `v` with repeated elements `v <- sample( 1:4, 10, replace = TRUE )`. 
    - Understand `duplicated( v )`.

```r
v <- sample( 1:4, 10, replace = TRUE )
v
```

```
 [1] 3 1 4 2 1 2 3 3 4 4
```

```r
duplicated( v )
```

```
 [1] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

### Result is a vector of indices

#### Primary tasks

- Index of the largest/smallest element: `which.max`, `which.min`.
    - Into vector `v` sample 10 elements from a large vector `1:1000000`. Show `v`.
    - Use `which.max( v )` to find where in `v` is the largest element. Then, show its value.

```r
v <- sample( 1:1000000, 10 )
v
```

```
 [1] 443533 943226 254985 442242 837054 992603 101176 530808 958361 987432
```

```r
which.max( v )
```

```
[1] 6
```

```r
v[ which.max( v ) ]
```

```
[1] 992603
```

#### Extra tasks

- Indices where a logical vector is `TRUE`: `which`. (*)
    - Let's create a random logical vector `v <- sample( c( T, F ), 10, replace = TRUE )`. 
    - Use `which` to find positions with `TRUE` values. 
    - What is `v[ which( v ) ]`?

```r
v <- sample( c( T, F ), 10, replace = TRUE )
v
```

```
 [1] FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
```

```r
which( v )
```

```
[1] 4 5 7 8 9
```

```r
v[ which( v ) ]
```

```
[1] TRUE TRUE TRUE TRUE TRUE
```

- Indices at which elements of one vector `match` another vector: `match`. (*)
    - Let's check where elements of `v <- c( "1", "B", "I", "O", "b" )` are among `LETTERS` with `match( v, LETTERS )`.
    - How to interpret the result? 
    - How to find how many of elements in `v` do not occur in `LETTERS`?

```r
v <- c( "1", "B", "I", "O", "b" )
idx <- match( v, LETTERS )
idx
```

```
[1] NA  2  9 15 NA
```

```r
LETTERS[ idx ]
```

```
[1] NA  "B" "I" "O" NA 
```

```r
sum( is.na( idx ) )
```

```
[1] 2
```

- Indices ordered so, that the elements of a vector would get ordered: `order`. (*)
    - Let's generate a random vector `v <- sample( LETTERS, 10 )`.
    - Understand `order( v )` and `v[ order( v ) ]`.
    - Check whether `v[ order( v ) ] == sort( v )` or even better whether `all( v[ order( v ) ] == sort( v ) )` is TRUE.

```r
v <- sample( LETTERS, 10 )
v
```

```
 [1] "Z" "D" "A" "O" "J" "H" "W" "Y" "P" "V"
```

```r
order( v )
```

```
 [1]  3  2  6  5  4  9 10  7  8  1
```

```r
v[ order( v ) ]
```

```
 [1] "A" "D" "H" "J" "O" "P" "V" "W" "Y" "Z"
```

```r
v[ order( v ) ] == sort( v )
```

```
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
```

```r
all( v[ order( v ) ] == sort( v ) )
```

```
[1] TRUE
```

### (*) Other

#### Extra tasks

- Produce a vector with ranks of elements of another vector: `rank`.
    - Let's generate a random vector `v <- sample( LETTERS, 10 )`.
    - Understand the difference of `order( v )` and `rank( v )`.

```r
v <- sample( LETTERS, 10 )
v
```

```
 [1] "L" "P" "V" "A" "K" "I" "C" "E" "F" "U"
```

```r
order( v )
```

```
 [1]  4  7  8  9  6  5  1  2 10  3
```

```r
rank( v )
```

```
 [1]  7  8 10  1  6  5  2  3  4  9
```

