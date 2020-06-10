---
title: "Data frames (tasks)"
date: "10 juni 2020"
---



# Data frames (tasks)

## Tasks

### Reading a different format

#### Primary tasks

- Load the `pulse.csv` file into the `d` variable. Display the structure of `d` and the first few rows.


```
# To get 'pulse.csv' directly from the server, use:
# d <- read.csv( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/pulse.csv" ) )
```


- Random sampling of rows:
    - Sample randomly 10 rows from table `d`. 
    - First create a variable `rows` which will contain the row numbers.
    - Show selected rows.


- Sorting (ordering) a table (by multiple keys):
    - Use `View( d )` to visualize the `d` data frame.
    - Understand: `rows <- order( d$age )`. Use `View` to visualize `d[ rows, ]`.
    - Understand: `rows <- order( d$age, d$weight )`. Use `View` to visualize `d[ rows, ]`.
    - Finally: display only columns `name`, `age` and `weight` of sorted `d`.
    - Note: for clarity, the solutions use only random 10 rows of `d`.


- Selecting rows by a logical condition.
    - Goal: select rows with males of weight range 60-80
    - Build a logical vector `isMale` stating whether a row describes a male
    - Build a logical vector `isInWeightRange` stating whether a row describes a person with weight between 60 and 80
    - Select rows which are `isMale & isInWeightRange`
    - Note: for clarity, the solutions use only random 10 rows of `d`.


#### Extra tasks

- Enforce a data frame type.
    - Observe below, that `d[ ,cols ]` might sometimes return a vector, and sometimes return a data frame.
    - Adding `drop = FALSE` argument enforces returning a data frame object.

```r
cols <- c( "weight", "height" )
class( d[ , cols ] )
cols <- c( "weight" )
class( d[ , cols ] )
cols <- c( "weight" )
class( d[ , cols, drop = FALSE ] )
```

