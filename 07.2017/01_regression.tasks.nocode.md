---
title: "Regression (tasks)"
author:
- affiliation: "Bioinformatics Center of Expertise, Medical Statistics & Bioinformatics, LUMC"
  company: "LUMC"
  name: "Jelle Goeman"
date: "10 juni 2020"
---

# Formulae and regression (tasks)

## Tasks

### Linear regression

We look at the `swiss` data. In this data set we explain fertility of Swiss regions using various indicators.

- Perform a linear regression with `Agriculture` as the explanatory variable. 



- What is the confidence interval of the regression coefficient?



- Perform another linear regession, but use a log-transformed `Agriculture`



- Again, but use a `Agriculture` and `Agriculture` squared



- Again, but use Agriculture, Catholic, and their interaction



- Make a variable `P` that has the p-value of the interaction in the last model. Hint: use coef of the summary of your object.



- Is this model significantly better than the model with Agriculture alone? Hint: use anova.



- Fit the model again in a data set that leaves out the canton `Courtelary`. Use the model to predict `Fertility` in `Courtelary`



### Logistic regression

In the quine data (from MASS), we can try to predict learning speed.

- Make a logistic regression model to predict `Lrn` based on `Eth`, `Age` and `Sex`.



- Is there a significant relationship between Age and Learning speed?
 




