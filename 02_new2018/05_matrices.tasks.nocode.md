---
title: "Matrices (tasks)"
date: "10 juni 2020"
---



# Matrices (tasks)

## Tasks

### Matrix of correlation coefficients {#corMatrix}

#### Extra tasks

The goal of this exercise is to calculate a matrix of column-column Pearson correlation coefficients for a number of data frame columns. The `cor` function does not accept a `data.frame` argument and it works only with numerical columns. Therefore, first the numerical columns of the data frame need to be extracted and converted to a matrix.

- Read the pulse data frame to `pulse` variable; check its class.





- Calculate correlation of columns `height` and `weight`.


- Understand the error of `cor( pulse )`.


- Select only numerical columns of `pulse`. Then use `as.matrix` on the selected columns. Store the result in `m`. Confirm that `m` is a matrix. Check `m` dimensions and `str( m )`.


- Try `cor( m )` and understand the result. Read the `cor` documentation for further ideas related to `NA`. Assign the final result to `corM`.


- Read documentation for `round` and round the `corM` matrix to 2 most significant digits. (*)

