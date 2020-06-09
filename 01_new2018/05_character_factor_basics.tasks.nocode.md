---
title: "Basic data types (tasks)"
date: "09 juni 2020"
---





# Numeric data {#numeric}

In the `survey` data

- Find the standard deviation of `span1`


- Find the age range


- plot `span1` (y-axis) against `span2` (x-axis)


- (*) plot the difference between `span1` and `span2` (y-axis) against their average (x-axis)


# Factors {#factors}

In the `survey` data

- How many and what levels does the `fold` variable have?
```
levels(survey$fold)
```

- Make a `table` of the fold variable (columns) versus the clap variable (rows)


- Convert the `name` column to `character`


- Do the same for the `pulse` data.

- Add these conversion steps to your standard script for reading in the data! 


# Desciptive statistics of a data set

We make use of the `cats` data set from the `MASS` package. 

-	Load the `MASS` package by writing `library(MASS)`. This makes the `cats` data available to you. What variables of what types are in `cats`?


- How many male and female cats were in this experiment?


- Make a histogram of heart weights


- Find mean and median heart weight


-	Plot heart weight against body weight


-	(*) `plot` when applied to a factor and a numeric variable makes boxplots. Make boxplots of body weight against gender


