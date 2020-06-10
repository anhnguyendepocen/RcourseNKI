---
title: "Basic statistical tests (tasks)"
date: "10 juni 2020"
---





# wilcox.test {#S3}

- Perform a (paired) Wilcoxon signed rank test comparing `span1` and `span2` in the survey data



- Store the p-value and the test statistic as two separate variables



- Apply now the Wilcoxon test ignoring the paired nature of the data and save the p-value generated as a variable. Then print on the console the two p-values computed (using the pairing and then not using it) on two subsequent lines.




# Unpaired t.test

- Study the `t.test` help file. How should we supply the input if we want to do a t test to compare `span1` between males and females?



- Make two separate vectors of `span1` values for males and females.


- Perform the unpaired t test that compares span1 between males and females.



- Extract the confidence interval for the difference in spans from the resulting object.


- Round the p-value to 3 significant digits. Hint: use `round`



# Tests for count tables 

- In the survey data, make a table of the `fold` against the `clap` variables. Hint: use the function `table`.


- Now use a chi-square test to study the association between `fold` and `clap`. For this, check the help file for the function `chisq.test`.  



- Check the class and the names of this object. Save the computed p-value as a separate variable.



- A warning message was generated  because the expected count is less than 5 in some of the cells in the table. Get the expected counts from the object returned by `chisq.test`. Hint: use the component `expected` of the object.




- Alternatively, an exact p-value can be obtained using a Fisher's exact test. Use `fisher.test` to test association between `fold` and `clap`. Check the syntax in the help file of the function. Check the class of the object generated and its names. Then save the p-value computed as a separate variable.



- Print on the console all p-values computed above, rounded to 4 decimal places.



# Tests for count tables (continued)

- Make a table of `gender` and `exercise` in the `survey` data and save the resulting object.



- Test for the association between `gender` and `exercise` in the `survey` data using a chi-square test. Use the table of the two variables in the function call, instead of the variables themselves. Save both the entire test result as the p-value as separate objects.



- Check the names of components in the test object. Extract the expected count table from the object to see if any of the entries are less than 5.



- The test object also involves a component called `observed`. Check what it contains and compare it to the observed data table you saved.



- Compute the p-value for the test again by using simulation, instead of the chi-square approximation. This can be done by means of the `simulate.p.value` slot  in the function call. Save the computed p-value as a separate variable. 




- Print both computed p-values on the console with 2 decimal places.



