---
title: "Matrices"
date: "10 juni 2020"
---



# Matrices

## What is a matrix

<center>![Vectors](Data_types_mdfl.png)</center>

Matrix is a two-dimensional array of elements of the same type.

Rows and columns are addressed by numerical indices.

Rows and columns might also get names. The names might be used for indexing.

## Creation

A matrix can be constructed from a vector. Depending on the arguments, elements are put to the matrix in a different order:


```r
m <- matrix( 1:6, nrow = 2 );
m
```

```
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6
```

```r
m <- matrix( 1:6, nrow = 2, byrow = TRUE );
m
```

```
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
```

```r
m <- matrix( 1:6, ncol = 2 );
m
```

```
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

The class of `m` is:

```r
class( m )
```

```
[1] "matrix"
```

Function `str` gives a compact display of an object structure/content:

```r
str( m )
```

```
 int [1:3, 1:2] 1 2 3 4 5 6
```

## Dimensions

There are several functions to get dimensions of a matrix:

- `ncol( m )` provides the number of columns:

```r
ncol( m )
```

```
[1] 2
```

- `nrow( m )` provides the number of rows:

```r
nrow( m )
```

```
[1] 3
```

- `dim( m )` returns a vector with two elements: number of rows and number of columns

```r
dim( m )
```

```
[1] 3 2
```

## Setting/getting names of the columns and rows

`colnames( m )` and `rownames( m )` are used to set and get the names of matrix columns and rows:

```r
m
```

```
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6
```

```r
colnames( m ) <- c( "A", "B" )
m
```

```
     A B
[1,] 1 4
[2,] 2 5
[3,] 3 6
```

```r
rownames( m ) <- c( "X", "Y", "Z" )
m
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

To get names use:

```r
rownames( m )
```

```
[1] "X" "Y" "Z"
```

```r
colnames( m )
```

```
[1] "A" "B"
```

## Getting matrix elements

Single brackets notation with two arguments `[ row(s), col(s) ]` might be used to get specified row(s) and column(s). By default single rows/cols will get reduced to a vector.


```r
m[ 3, 1 ]
```

```
[1] 3
```

```r
m[ c( 2, 3 ), 1 ]
```

```
Y Z 
2 3 
```

```r
m[ c( 2, 3 ), c( "B", "A" ) ]
```

```
  B A
Y 5 2
Z 6 3
```

```r
m[ c( F, T, T ), c( "B", "A" ) ]
```

```
  B A
Y 5 2
Z 6 3
```

Notice the difference in the output class when only a single element is requested:

```r
class( m[ 3, 1 ] )
```

```
[1] "integer"
```

```r
class( m[ c( 2, 3 ), c( "B", "A" ) ] )
```

```
[1] "matrix"
```

Dropping of `matrix` dimensionality might be prevented:

```r
m[ 3, 1 ]
```

```
[1] 3
```

```r
m[ 3, 1, drop = FALSE ]
```

```
  A
Z 3
```

```r
class( m[ 3, 1, drop = FALSE ] )
```

```
[1] "matrix"
```

Empty index field means "all" rows or columns:

```r
m[ , c( "B", "A" ) ]
```

```
  B A
X 4 1
Y 5 2
Z 6 3
```

```r
m[ c( "Z", "X", "Y" ), ]
```

```
  A B
Z 3 6
X 1 4
Y 2 5
```

```r
m[ , ]
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

## Useful matrix functions

Short summary of matrix operations: http://www.statmethods.net/advstats/matrix.html

### Transposition


```r
m <- matrix( 1:6, nrow = 3 );
colnames( m ) <- c( "A", "B" )
rownames( m ) <- c( "X", "Y", "Z" )
m
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

```r
t(m)
```

```
  X Y Z
A 1 2 3
B 4 5 6
```

### Matrix multiplication


```r
m
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

```r
t( m )
```

```
  X Y Z
A 1 2 3
B 4 5 6
```

```r
m %*% t( m )
```

```
   X  Y  Z
X 17 22 27
Y 22 29 36
Z 27 36 45
```

### Element-wise multiplication


```r
m
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

```r
m+1
```

```
  A B
X 2 5
Y 3 6
Z 4 7
```

```r
m * (m+1)
```

```
   A  B
X  2 20
Y  6 30
Z 12 42
```

### Row/columns means/sums


```r
m
```

```
  A B
X 1 4
Y 2 5
Z 3 6
```

```r
rowMeans( m )
```

```
  X   Y   Z 
2.5 3.5 4.5 
```

```r
rowSums( m )
```

```
X Y Z 
5 7 9 
```

```r
colMeans( m )
```

```
A B 
2 5 
```

```r
colSums( m )
```

```
 A  B 
 6 15 
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](05_matrices.tasks.nocode.html#corMatrix), and check your solution(s) [here](05_matrices.tasks.code.html#corMatrix).

- - -
