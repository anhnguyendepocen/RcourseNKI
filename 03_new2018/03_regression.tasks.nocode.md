---
title: "Regression (tasks)"
date: "09 juni 2020"
---






# Formulae basics {#formula}

Try to execute the tasks below using a formula in the syntax.

- In the survey data, compute an unpaired t-test for association between `height` and `hand`.



- Make a plot `height` (y-axis) against `hand` (x-axis).



- (*) Repeat the previous exercises using a formula stored as an object, then calling it in the syntax.



# Wilcoxon test and formula syntax {#formula}

- Compare the values of `pulse` between males and females in the survey data using a t test. Save the resulting p-value as a variable.




- Perform the same comparison, now using a Wilcoxon test, by means of a formula syntax. Hint: the syntax of the input in wilcox.test is similar to that needed for t.test. Save the resulting p-value as a variable.



- Print the two computed p-values on the console, rounded off to 3 decimal places.



# Simple regression {#lm}


- Perform a linear regression of `span1` against `span2` from the survey data. Save the regression result yielded by `lm` as an object and check which components it has. 



- Print the summary of the object by using the function `summary`. Save the summary produced as a separate object and check which components it has.




- Visualize the fitted regression line using a plot which includes the scatterplot of the observed variables `span1` and `span2`.



- What is the confidence interval for the slope (i.e. the coefficient of `span2`) in the regression?



- (*) What is the exact p-value for the coefficient of `span1`? Hint: use the component `coefficients` of the summary object.




# Multiple regression {#multiple}

We look at the `swiss` data. In this data set we explain fertility of Swiss regions using various indicators.

- Check the dimensions of the data, row and column names.



- Perform a linear regression of `Fertility` with `Agriculture` and `Catholic` as the explanatory variables. 



- What is the confidence interval of the regression coefficient of `Agriculture`?



- Create a new dataset that excludes the region `Courtelary`. Hint: use logical indices and the rownames of the dataset.



- Fit the regression model again in the data set that leaves out the region `Courtelary`. Then use the fitted model to predict `Fertility` in `Courtelary`.



- (*) Fit a model that uses Agriculture, Catholic, as well as their interaction.



- (*) Save the p-value of the interaction term in the last model as a variable. 




# (*) Tests, graphs and formula objects {#formula}


The dataset `Seatbelts` contains data relating to people killed or seriously injured monthly in car accidents, between Jan 1969 and Dec 1984, in the UK. Compulsory wearing of seat belts was introduced on 31st January 1983.

- Check the help page for the data set, and the structure of the dataset via `str`. You will see that the data's 8th column called `law` corresponds to a binary variable indicating whether or not the seat belt law was already in effect in that month. Produce a table of this variable. Note: you will need to select it via square brackets, either by the column name, or by the column number. For this sort of object, a `$` cannot be used for selection.



- The number of  deaths or serious injuries is given by the column `drivers`. Compute its median using the function `median`, storing it into a variable.



- Make a boxplot of `drivers`. 



- Make a boxplot of `drivers` according to whether or not the law was already in effect. Hint: use a formula object to divide entries in `drivers` according to the groups defined by `law`, and use this object as input for the boxplot.



- Use a Wilcoxon test to compare the number of driver deaths or serious injuries before and after the law was introduced. Use the same formula  in the function call as the one used for the boxplot above. Save the resulting p-value as a variable



- Create a binary variable indicating whether or not the number of drivers deaths or serious injuries was above its median. Produce a table of this variable and the `law` variable. Store this table in an object.



- Use a chi-square test to check if there seems to be any association between the number of drivers deaths or serious injuries being higher than its median, and the law coming into effect. Since one of the observed counts in the table is small, also check evidence for this association using a Fisher's exact test. In both test calls, use the table created as input. Save the p-values computed as variables.



- Print the three p-values computed with 3 decimal places.








