---
title: "Basic data types (cont.)"
date: "10 juni 2020"
---



# Basic data types (cont.) (tasks)

## Numeric vectors {#numeric}

### Primary tasks

- Create a variable `v` to be a vector of (46,43,...,19,16,13).
    - Show `v` to check the numbers. 
    - Show the `head` of 4 elements of `v`.
    - Show the `tail` of 3 elements of `v`.
    - Calculate the length of `v`.


- Create a variable `v` to be a vector of (50,40,30,20,10,5,4,3,2,1,NA). 
    - Use once `seq`, and once `:` (colon). 
    - Show `v` to check the numbers.


### Extra tasks

- Sometimes it is useful to create a vector of given number _n_ of zeroes. Try the function `numeric( n )` to create a vector of 25 zeroes, then create an empty numeric vector with nothing (so, zero zeroes). (*)


- Read the manual of `rep`. Construct a vector 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2... with 20 pattern repetitions. (*)


- Use `rep`. Construct the first 13 elements of a vector 0, 1, 2, 0, 1, 2, 0, 1, 2, 0, 1, 2... Check the length of the result. (*)


- Read manual of function `rev`. Use this function and the `v` from the previous task to build a vector of (50,40,30,20,10,5,4,3,2,1,NA,NA,1,2,3,4,5,10,20,30,40,50). (*)


## Character vectors {#character}

### Primary tasks

- Use `readLines` function to read contents of the `survey.txt` file into a (one-dimensional) character vector.  Count the number of lines. Show the first and the last 3 lines. Use the `View` command to show the vector and compare to the view obtained for `survey` data frame, which you used earlier in the course.




### Extra tasks

- Create a character vector `fruits` with 5 random and different fruit names. Check how it is shown. (*)


- Use the `fruits` vector. Understand `nchar( fruits )`. (*)


- Build (manually) a vector _idx_ so, that `fruits[ idx ]` prints fruit names in alphabetical order. (*)


- understand the result of function `order( fruits )`. (*)


- Sometimes it is useful to create a vector of given number _n_ of empty texts. Try the function `character( n )` to create a vector of 5 empty texts, then create an empty character vector with nothing (so, zero empty texts). (*)


- Read the documentation of `rep`. Then understand the code below. (*)

```r
c( rep( "male", 2 ), rep( "female", 1 ) )
rep( c( "male", "female" ), c( 2, 1 ) )
```

## Logical vectors {#logical}

### Primary tasks

- Negation operator: 
    - Practice, what the negation operator produces for these there logical constants: `FALSE`, `TRUE`, `NA`.


- AND (vector) operator: 
    - Once symmetries are accounted for, there are six possible combinations of two different values (`a`, `b`)  selected from the three logical constants: `FALSE`, `TRUE`, `NA`. Consider all six of them as arguments to the `&` operator. First predict the result of `a & b` and then calculate it.


- Make a vector `v <- 19:10`. Build a logical vector `w` which states which positions of `v` are smaller than 12 or at least 17. Print both `v` and `w` to check by eye whether the result is correct.


- Study the logical vector `w` from the previous task. Count how many positions are `TRUE`. For this use the `sum` function.


### Extra tasks

- OR (vector) operator: (*)
    - Reproduce the "AND operator" exercise for the `|` (or) operator.

- Elements on `which` positions (indices) are `TRUE`: (*)
    - Study the logical vector `w` from the earlier task. 
    - First, answer yourself the question: which positions in `w` are `TRUE`. 
    - Was your answer the same as the result of `which( w )`? 
    - Can you explain `which( LETTERS == "R" )`?


- Even numbers: (*)
    - Even numbers are dividable by two with rest zero.
    - Rest of division can be calculated with the `%%` operator. 
    - Take the vector `v <- 19:10` and construct the corresponding logical vector `w` stating whether elements of `v` are dividable by two.


- AND, OR (single/first value) operators `&&`, `||`: (*)
    - They work on single values (instead of complete vectors) and are frequently used in programming.
    - Check the manual ``?`&&` ``. Try with some logical values similarly to `&` and `|`.

- AND, OR (single/first value) functions `all`, `any`:
    - Programs are more readable, when instead of `a && b && c && d` the following code is written: `all( a, b, c, d )`. 
    - Read the manual for `all`, `any`. (*)

- Sometimes it is useful to create a vector of given number _n_ of empty texts. Try the function `character( n )` to create a vector of 5 empty texts, then create an empty character vector with nothing (so, zero empty texts). (*)


## Type conversions {#conversions}

### Primary tasks

- Take the following character vector: `v <- c( "0", "1", "11", "121", "1221", "one" )`. Check the result of `as.numeric( v )`.


- Produce texts (character vector) out of numbers `101:110`.


- Convert `c( -1:1, NA )` to a logical vector with `as.logical`. Explain the result.


### Extra tasks

- Which of elements of `c( "TRUE", "True", "true", "T", "FALSE", "False", "false", "F" )` are converted to valid logical values with `as.logical`? (*)


- Sometimes it is useful to create a vector of given number _n_ of `FALSE` values. Try the function `logical( n )` to create a vector of 5 `FALSE`s, then create an empty logical vector. (*)

