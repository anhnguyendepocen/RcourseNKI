---
title: "Data frames (tasks)"
date: "10 juni 2020"
---



# Explore {#explore}

For the quick exercises we will mostly work with the `survey` data. Let's load them into R.

- Download the data in `survey.txt` and load them into R. Use the script you made!

```r
## survey <- read.delim("data/survey.txt")
```

- How many rows and columns does this data set have?


- Which variables are in the data?




# Data frame columns {#columns}

In the `survey` data 

- Calculate the difference between spans of the the writing and non-writing hands for each student


- Add the result of your calculation as a new column to your data set


- What is the minimum age in the data set? Hint: use `min`.


In the `pulse` data

- BMI is weight in kg divided by the square of height in cm. Add a column BMI for each student. HINT: height is given in `m`.


- (*) Remove the BMI column you have just added to the pulse data.



# Exploring a new data.frame {#newFrame}

The `swiss` data set has demographic data on swiss provinces. It is an example data.frame that is available in R. Just type `swiss` at the prompt to see it.

-	Use the functions View, head and tail to get an overview of the data set


- Have a look at the help file. What is this data set about?


- How many provinces are in this data set?


-	What is the largest percentage of catholics in any of these Swiss provinces? Hint: use `max`


- Find the Fertility of `Lavaux`.


- Make a new column in the swiss data that contains the percentage of protestants (100 minus the percentage of catholics)




