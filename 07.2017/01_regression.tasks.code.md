---
title: "Regression (tasks)"
author:
- affiliation: "Bioinformatics Center of Expertise, Medical Statistics & Bioinformatics, LUMC"
  company: "LUMC"
  name: "Jelle Goeman"
date: "09 juni 2020"
---

# Formulae and regression (tasks)

## Tasks

### Linear regression

We look at the `swiss` data. In this data set we explain fertility of Swiss regions using various indicators.

- Perform a linear regression with `Agriculture` as the explanatory variable. 


```r
res <- lm(Fertility ~ Agriculture, data=swiss)
summary(res)
```

```

Call:
lm(formula = Fertility ~ Agriculture, data = swiss)

Residuals:
     Min       1Q   Median       3Q      Max 
-25.5374  -7.8685  -0.6362   9.0464  24.4858 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 60.30438    4.25126  14.185   <2e-16 ***
Agriculture  0.19420    0.07671   2.532   0.0149 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 11.82 on 45 degrees of freedom
Multiple R-squared:  0.1247,	Adjusted R-squared:  0.1052 
F-statistic: 6.409 on 1 and 45 DF,  p-value: 0.01492
```

- What is the confidence interval of the regression coefficient?


```r
confint(res, 'Agriculture')
```

```
                 2.5 %    97.5 %
Agriculture 0.03969634 0.3487072
```

- Perform another linear regession, but use a log-transformed `Agriculture`


```r
summary(lm(Fertility ~ log(Agriculture), data=swiss))
```

```

Call:
lm(formula = Fertility ~ log(Agriculture), data = swiss)

Residuals:
     Min       1Q   Median       3Q      Max 
-26.1525  -8.3452   0.1106   8.2714  22.8363 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)        42.354      8.267   5.123  6.1e-06 ***
log(Agriculture)    7.418      2.163   3.429  0.00131 ** 
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 11.25 on 45 degrees of freedom
Multiple R-squared:  0.2072,	Adjusted R-squared:  0.1896 
F-statistic: 11.76 on 1 and 45 DF,  p-value: 0.001305
```

- Again, but use a `Agriculture` and `Agriculture` squared


```r
summary(lm(Fertility ~ Agriculture + I(Agriculture^2), data=swiss))
```

```

Call:
lm(formula = Fertility ~ Agriculture + I(Agriculture^2), data = swiss)

Residuals:
     Min       1Q   Median       3Q      Max 
-26.6595  -7.6995   0.9147   8.0878  22.6829 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      53.787944   6.911467   7.782  8.3e-10 ***
Agriculture       0.557293   0.313918   1.775   0.0828 .  
I(Agriculture^2) -0.003867   0.003243  -1.192   0.2395    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 11.76 on 44 degrees of freedom
Multiple R-squared:  0.1521,	Adjusted R-squared:  0.1135 
F-statistic: 3.945 on 2 and 44 DF,  p-value: 0.02654
```

- Again, but use Agriculture, Catholic, and their interaction


```r
summary(lm(Fertility ~ Agriculture * Catholic, data=swiss))
```

```

Call:
lm(formula = Fertility ~ Agriculture * Catholic, data = swiss)

Residuals:
    Min      1Q  Median      3Q     Max 
-29.614  -6.278   1.162   7.490  18.163 

Coefficients:
                      Estimate Std. Error t value Pr(>|t|)    
(Intercept)          6.067e+01  5.848e+00  10.374  2.8e-13 ***
Agriculture          9.384e-02  1.145e-01   0.819    0.417    
Catholic             9.004e-02  1.381e-01   0.652    0.518    
Agriculture:Catholic 4.135e-04  2.177e-03   0.190    0.850    
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 11.2 on 43 degrees of freedom
Multiple R-squared:  0.2489,	Adjusted R-squared:  0.1965 
F-statistic:  4.75 on 3 and 43 DF,  p-value: 0.006001
```

- Make a variable `P` that has the p-value of the interaction in the last model. Hint: use coef of the summary of your object.


```r
fit <- lm(Fertility ~ Agriculture * Catholic, data=swiss)
coef(summary(fit))['Agriculture:Catholic', 'Pr(>|t|)']
```

```
[1] 0.8502208
```

- Is this model significantly better than the model with Agriculture alone? Hint: use anova.


```r
fit0 <- lm(Fertility ~ Agriculture, data=swiss)
anova(fit, fit0)
```

```
Analysis of Variance Table

Model 1: Fertility ~ Agriculture * Catholic
Model 2: Fertility ~ Agriculture
  Res.Df    RSS Df Sum of Sq      F  Pr(>F)  
1     43 5391.3                              
2     45 6283.1 -2   -891.82 3.5565 0.03721 *
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

- Fit the model again in a data set that leaves out the canton `Courtelary`. Use the model to predict `Fertility` in `Courtelary`


```r
fit <- lm(Fertility ~ Agriculture * Catholic, data=swiss[-1,])
predict(fit, swiss[1,])
```

```
Courtelary 
  61.38194 
```

### Logistic regression

In the quine data (from MASS), we can try to predict learning speed.

- Make a logistic regression model to predict `Lrn` based on `Eth`, `Age` and `Sex`.


```r
library(MASS)
fit <- glm(Lrn ~ Eth + Age + Sex, data=quine, family=binomial)
```

- Is there a significant relationship between Age and Learning speed?
 

```r
fit0 <- glm(Lrn ~ Eth + Sex, data=quine, family=binomial)
anova(fit, fit0, test='LRT')
```

```
Analysis of Deviance Table

Model 1: Lrn ~ Eth + Age + Sex
Model 2: Lrn ~ Eth + Sex
  Resid. Df Resid. Dev Df Deviance  Pr(>Chi)    
1       140     141.90                          
2       143     196.17 -3  -54.268 9.838e-12 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```



