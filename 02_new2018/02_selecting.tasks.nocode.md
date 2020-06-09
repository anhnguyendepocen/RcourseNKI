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


- Check what happens when you try to get an element with too large index (e.g. 20).


- Check what happens when a negative index is used (e.g. -7). What can negative indices be used for?


- Set the 5th element of `v` to zero. Check `v` before and after the assignment.


- Create a vector `idx <- c( 3,7,1 )`. Get elements from positions in `idx`.


### Extra tasks

- Name the elements of `v` with subsequent small letters of alphabet. Use `1:length( v )` to specify the range of the `letters` vector. (*)


- Get the values of `v` corresponding to positions named `e` and `h`. (*)


- In one operation set the 3rd and 5th elements of `v` to 13 and 15. Check the result. (*)



- Try above operations with double square brackets operator, so instead of `[ idx ]` use `[[ idx ]]`. Observe differences. (*)

## Through utility functions {#utility}

### Result is original vector reordered/sliced

#### Primary tasks

- Reorder/sample a vector randomly: `sample`.
    - Define `v <- 101:110`. Try several times `sample( v )`. 
    - Then try several times `sample( v, 3 )`, `sample( v, 15 )` and `sample( v, 15, replace = TRUE )`.



- Sort a vector: `sort`. 
    - Define `v <- sample( letters, 10 )`. 
    - Compare `v` to `sort( v )`.


#### Extra tasks

- Unique elements of a vector: `unique`. (*)
    - First understand `v <- sample( 101:110, 15, replace = TRUE )`. 
    - Then understand `unique( v )`.


- Reverse a vector: `rev`. (*)
    - Define `v <- 101:110`. 
    - Compare `v` to `rev( v )`.


### Result is a logical vector

#### Primary tasks

- Which element(s) are available/missing: `is.na`.
    - Create a random vector `v` with `NA` elements: `v <- sample( c( 0, 1, NA ), 10, replace = TRUE )`. 
    - Understand `is.na( v )` and `v[ !is.na( v ) ]`.


#### Extra tasks

- Whether elements of one vector are present in another vector: `%in%`. (*) 
    - Let's check whether elements of `v <- c( "1", "B", "I", "O", "b" )` are among `LETTERS` with `v %in% LETTERS`. 
    - How to interpret the result? 
    - How to find how many of elements in `v` occur in `LETTERS`?


- Whether elements of a vector are duplicated (have occurred earlier already): `duplicated`. (*)
    - Let's generate a vector `v` with repeated elements `v <- sample( 1:4, 10, replace = TRUE )`. 
    - Understand `duplicated( v )`.


### Result is a vector of indices

#### Primary tasks

- Index of the largest/smallest element: `which.max`, `which.min`.
    - Into vector `v` sample 10 elements from a large vector `1:1000000`. Show `v`.
    - Use `which.max( v )` to find where in `v` is the largest element. Then, show its value.


#### Extra tasks

- Indices where a logical vector is `TRUE`: `which`. (*)
    - Let's create a random logical vector `v <- sample( c( T, F ), 10, replace = TRUE )`. 
    - Use `which` to find positions with `TRUE` values. 
    - What is `v[ which( v ) ]`?


- Indices at which elements of one vector `match` another vector: `match`. (*)
    - Let's check where elements of `v <- c( "1", "B", "I", "O", "b" )` are among `LETTERS` with `match( v, LETTERS )`.
    - How to interpret the result? 
    - How to find how many of elements in `v` do not occur in `LETTERS`?


- Indices ordered so, that the elements of a vector would get ordered: `order`. (*)
    - Let's generate a random vector `v <- sample( LETTERS, 10 )`.
    - Understand `order( v )` and `v[ order( v ) ]`.
    - Check whether `v[ order( v ) ] == sort( v )` or even better whether `all( v[ order( v ) ] == sort( v ) )` is TRUE.


### (*) Other

#### Extra tasks

- Produce a vector with ranks of elements of another vector: `rank`.
    - Let's generate a random vector `v <- sample( LETTERS, 10 )`.
    - Understand the difference of `order( v )` and `rank( v )`.


