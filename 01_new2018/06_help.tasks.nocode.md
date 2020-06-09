---
title: "Functions and help (tasks)"
date: "09 juni 2020"
---



# Round and signif {#signif}

- Use the `signif` function to give pi in 4 significant digits


- (*) What is the value of `round(pi,-1)` and why?


- (*) For what `x` is `trunc(x)` different from `floor(x)`



## `barplot` options {#help}

Have a look at the `women` example data

- Open the help file for `women` to understand the data.


- The `barplot` function can be used for barplots. Make a barplot of `weight`.


-	What argument of `barplot` can be used to add names to the bars? HINT: `names.arg`. Add `height` as a names under the bars.


- Basic colors are represented in R simply by their names, e.g. `"yellow"`. Note the quotation marks. Make the bars in the plot purple.


- Add labels to the plot and a title



## Spearman correlation

In the `survey` data:


```
# To get 'survey.txt' directly from the server, use:
# survey <- read.table( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/survey.txt" ), header = TRUE, sep = "\t" )
```


-	The function for correlation in R is `cor`. Calculate correlation between average `span1` and `span2`


- Is this a Pearson or Spearman correlation? Calculate the Spearman correlation.


# (*) `table` options

`NA` in R stands for missing values

- Open the help file for `table`.


- What is the default of the `useNA` argument?


- Apply table to the `clap` and `m.i.`columns in `survey` with all three options for `useNA`


- Explain the role of the `useNA` argument in your own words.
