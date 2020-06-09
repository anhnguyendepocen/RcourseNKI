---
title: "Advanced factors (tasks)"
date: "09 juni 2020"
---






# Changing levels {#levels}

In the `survey` data

- Reorder the levels of the `smokes` variable in a more natural way.



- Make a new version of the `smokes` variable that puts the heavy, regular and occasional smokers together in the same category.



- Tabulate the old and new smokes variables against each other to check that the category grouping worked as expected.




# Creating factors from existing variables

Use the `survey` data for the exercises below.

- Make a categorical variable that indicates whether subjects have pulse above or at most equal to the median pulse. Beware of missing values!



- (*) Make a new factor with four categories: `lefthanded woman`, `righthanded woman`, `lefthanded man`, `righthanded man`. Hint: use `:` to combine `gender` and `hand`.



- (*) Give the factor the levels given above: `lefthanded woman`, etc.



# Regression with factors {#anova}

- In the `survey` data, use ANOVA to see if `pulse` is different between the `fold` groups. Hint: use `lm` to fit a model where `pulse` is explained by `fold`, then use ANOVA on the model fit.



- Which category of `fold` corresponds to the intercept in this regression model? Why is that?




- Reorder the levels of `fold` so that the category `fit` is the first level, and refit the model. 



- Make boxplots of `pulse` values for each of the groups defined by `fold`. Hint: use as input for the boxplot the same formula used for the `lm`.



- Fit a model to explain `pulse` by `fold`, and save the model fit in an object.




- Fit now a model to explain `pulse` by both `fold` and `clap`, and save the model fit in an object. 



- Does `clap` have (statistical) added value in the model that already contains `fold`? Hint: use `anova` to compare the model fits already obtained.




- (*) Now fit a model where `pulse` is explained by  `clap` only, and compare the fit with that using both `clap` and `fold`.  




# (*) Logistic regression

In the quine data (from the library MASS, so remember to load this library using `library(MASS)`),  learning speed is studied in context of a number of variables.

- Make a logistic regression model to predict learning speed (`Lrn`) based on `Eth`, `Age` and `Sex`.



- Is there a significant relationship between `Age` and `Lrn`?
  


