---
title: "Matrices (tasks)"
date: "09 juni 2020"
---



# Matrices (tasks)

## Tasks

### Matrix of correlation coefficients {#corMatrix}

#### Extra tasks

The goal of this exercise is to calculate a matrix of column-column Pearson correlation coefficients for a number of data frame columns. The `cor` function does not accept a `data.frame` argument and it works only with numerical columns. Therefore, first the numerical columns of the data frame need to be extracted and converted to a matrix.

- Read the pulse data frame to `pulse` variable; check its class.

```r
pulse <- read.table( "../data/pulse.txt" )
```

```
# To get 'pulse.txt' directly from the server, use:
# pulse <- read.table( url( "https://barmsijs.lumc.nl/R_course/data/pulse.txt" ), header = TRUE, sep = "\t" )
```


```r
class( pulse )
```

```
[1] "data.frame"
```

- Calculate correlation of columns `height` and `weight`.

```r
cor( pulse$height, pulse$weight )
```

```
[1] 0.5796849
```

- Understand the error of `cor( pulse )`.

```r
cor( pulse )
```

```
Error in cor(pulse): 'x' must be numeric
```

- Select only numerical columns of `pulse`. Then use `as.matrix` on the selected columns. Store the result in `m`. Confirm that `m` is a matrix. Check `m` dimensions and `str( m )`.

```r
m <- as.matrix( pulse[ c( "height", "weight", "age", "pulse1", "pulse2" ) ] )
class( m )
```

```
[1] "matrix"
```

```r
dim( m )
```

```
[1] 110   5
```

```r
str( m )
```

```
 num [1:110, 1:5] 173 179 167 195 173 184 162 169 164 168 ...
 - attr(*, "dimnames")=List of 2
  ..$ : chr [1:110] "1993_A" "1993_B" "1993_C" "1993_D" ...
  ..$ : chr [1:5] "height" "weight" "age" "pulse1" ...
```

- Try `cor( m )` and understand the result. Read the `cor` documentation for further ideas related to `NA`. Assign the final result to `corM`.

```r
cor( m )
```

```
           height    weight        age pulse1 pulse2
height 1.00000000 0.5796849 0.02544891     NA     NA
weight 0.57968494 1.0000000 0.14905554     NA     NA
age    0.02544891 0.1490555 1.00000000     NA     NA
pulse1         NA        NA         NA      1     NA
pulse2         NA        NA         NA     NA      1
```

```r
cor( m, use = 'p' )
```

```
            height      weight         age     pulse1      pulse2
height  1.00000000  0.57968494  0.02544891 -0.2782834 -0.08651036
weight  0.57968494  1.00000000  0.14905554 -0.1946657 -0.02924856
age     0.02544891  0.14905554  1.00000000 -0.1459091 -0.14459996
pulse1 -0.27828338 -0.19466574 -0.14590911  1.0000000  0.36148046
pulse2 -0.08651036 -0.02924856 -0.14459996  0.3614805  1.00000000
```

```r
corM <- cor( m, use = 'p' )
```

- Read documentation for `round` and round the `corM` matrix to 2 most significant digits. (*)

```r
round( corM, 2 )
```

```
       height weight   age pulse1 pulse2
height   1.00   0.58  0.03  -0.28  -0.09
weight   0.58   1.00  0.15  -0.19  -0.03
age      0.03   0.15  1.00  -0.15  -0.14
pulse1  -0.28  -0.19 -0.15   1.00   0.36
pulse2  -0.09  -0.03 -0.14   0.36   1.00
```
