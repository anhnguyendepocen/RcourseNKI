---
title: "Basic data types (cont.)"
date: "10 juni 2020"
---



# Basic data types (cont.) 

## Missing values

Numeric, character, logical vectors, factors might contain elements marked as 'missing'.

`NA` is a constant which indicates a missing value.

`NA` values would appear in the course materials and tasks.

## Numeric vectors 

There are several ways to construct a vector of numbers.

### Single number (numeric vector with a single element)


```r
7
```

```
[1] 7
```

### Multiple numbers


```r
c( 5, -2.5, NA, 7+3, 1/3 )
```

```
[1]  5.0000000 -2.5000000         NA 10.0000000  0.3333333
```

### Sequence of numbers (one by one)


```r
3:17
```

```
 [1]  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17
```

### Sequence of numbers

Sequence of numbers with a defined step:

```r
seq( 5, 15, 2 )
```

```
[1]  5  7  9 11 13 15
```

### Combine (several) vectors of numbers

Multiple vectors can be combined together:

```r
v <- 1:9
w <- seq( 10, 90, 10 )
c( 0, v, w, 100 )
```

```
 [1]   0   1   2   3   4   5   6   7   8   9  10  20  30  40  50  60  70  80  90
[20] 100
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](01_basic_data_types_cont.tasks.nocode.html#numeric), and check your solution(s) [here](01_basic_data_types_cont.tasks.code.html#numeric).

- - -

## Character vectors 

There are several ways to construct a vector of texts.

### Simple single text (character vector with a single element)

With double quotes:

```r
"Bioinformatics"
```

```
[1] "Bioinformatics"
```

Or, with single quotes:

```r
'Biostatistics'
```

```
[1] "Biostatistics"
```

### Multiple texts


```r
c( "Bioinformatics", "Biostatistics" )
```

```
[1] "Bioinformatics" "Biostatistics" 
```

### Lines from a text file

Earlier we used `read.table` function to read a text file into a (two-dimensional) data frame. Here, use `readLines` function to read contents of the `pulse.txt` file into a (one-dimensional) character vector.


```r
txt <- readLines( "data/pulse.txt" )
```

Each element of the vector `txt` is a single line from the file. The file is stored in `tsv` (tab-separated values format), so the `\t` symbol separates the values of columns. These are the first 3 lines (the first one contains the header of the table):

```r
head( txt, 3 )
```

```
[1] "name\theight\tweight\tage\tgender\tsmokes\talcohol\texercise\tran\tpulse1\tpulse2\tyear"
[2] "1993_A\tBonnie\t173\t57\t18\tfemale\tno\tyes\tmoderate\tsat\t86\t88\t1993"              
[3] "1993_B\tMelanie\t179\t58\t19\tfemale\tno\tyes\tmoderate\tran\t82\t150\t1993"            
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](01_basic_data_types_cont.tasks.nocode.html#character), and check your solution(s) [here](01_basic_data_types_cont.tasks.code.html#character).

- - -

## Logical vectors 

### Elementary logical values


```r
TRUE
```

```
[1] TRUE
```

```r
FALSE
```

```
[1] FALSE
```

```r
T
```

```
[1] TRUE
```

```r
F
```

```
[1] FALSE
```

```r
c( FALSE, F, TRUE, T )    # vector of logical values
```

```
[1] FALSE FALSE  TRUE  TRUE
```

(*) `NA` is a logical constant and it gets automatically converted to other types when necessary.

### Logical operators

#### Negation

Unary negation operator (denoted `!`):

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

#### AND Operator `&`

Binary operator AND (denoted `&`) returns `TRUE` result when `all` its arguments are `TRUE`:

```r
TRUE & TRUE
```

```
[1] TRUE
```

Otherwise returns `FALSE`:

```r
FALSE & TRUE
```

```
[1] FALSE
```

```r
FALSE & FALSE
```

```
[1] FALSE
```

#### OR operator `|`

Binary operator OR (denoted `|`) returns `TRUE` result when `any` (at least one) of its arguments is `TRUE`:

```r
TRUE | TRUE
```

```
[1] TRUE
```

```r
FALSE | TRUE
```

```
[1] TRUE
```

Otherwise returns `FALSE`:

```r
FALSE | FALSE
```

```
[1] FALSE
```

### Relational operators

#### Equality operator `==`


```r
1 == 2
```

```
[1] FALSE
```

```r
"Bioinformatics" == "Biostatistics"
```

```
[1] FALSE
```

```r
FALSE == F
```

```
[1] TRUE
```

#### Inequality operators 


```r
1 != 2    # unequal  
```

```
[1] TRUE
```

```r
"a" != "A"
```

```
[1] TRUE
```

```r
FALSE != T
```

```
[1] TRUE
```

```r
1 < 2     # less than
```

```
[1] TRUE
```

```r
1 > 2     # greater than
```

```
[1] FALSE
```

```r
2 <= 2    # less or equal 
```

```
[1] TRUE
```

```r
2 >= 2    # greater or equal
```

```
[1] TRUE
```

### Comparison of two vectors


```r
v <- c( 0, 1, 2, 3, 4 )
w <- c( 4, 3, 2, 1, 0 )
v == w
```

```
[1] FALSE FALSE  TRUE FALSE FALSE
```

```r
v != w
```

```
[1]  TRUE  TRUE FALSE  TRUE  TRUE
```

```r
v < w
```

```
[1]  TRUE  TRUE FALSE FALSE FALSE
```

```r
v <= w
```

```
[1]  TRUE  TRUE  TRUE FALSE FALSE
```

```r
v >= w
```

```
[1] FALSE FALSE  TRUE  TRUE  TRUE
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](01_basic_data_types_cont.tasks.nocode.html#logical), and check your solution(s) [here](01_basic_data_types_cont.tasks.code.html#logical).

- - -

## Type conversions 

Sometimes a conversion to a vector of certain type might be needed.
The family of functions: `as.numeric`, `as.character`, `as.logical` take as an argument a vector of any type and return a vector of the type given in the function name.
When the conversion of an element is not possible, `NA` value is used.


```r
v <- 101:110
v
```

```
 [1] 101 102 103 104 105 106 107 108 109 110
```

```r
as.character( v )
```

```
 [1] "101" "102" "103" "104" "105" "106" "107" "108" "109" "110"
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](01_basic_data_types_cont.tasks.nocode.html#conversions), and check your solution(s) [here](01_basic_data_types_cont.tasks.code.html#conversions).

- - -

