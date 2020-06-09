---
title: "Basic statistical tests (tasks)"
date: "09 juni 2020"
---





# wilcox.test {#S3}

- Perform a (paired) Wilcoxon signed rank test comparing `span1` and `span2` in the survey data


```r
wilcox.test(survey$span1, survey$span2, paired=TRUE)
```

```

	Wilcoxon signed rank test with continuity correction

data:  survey$span1 and survey$span2
V = 10540, p-value = 0.1268
alternative hypothesis: true location shift is not equal to 0
```

- Store the p-value and the test statistic as two separate variables


```r
res <- wilcox.test(survey$span1, survey$span2, paired=TRUE)
names(res)
```

```
[1] "statistic"   "parameter"   "p.value"     "null.value"  "alternative"
[6] "method"      "data.name"  
```

```r
p <- res$p.value
V <- res$statistic
```

- Apply now the Wilcoxon test ignoring the paired nature of the data and save the p-value generated as a variable. Then print on the console the two p-values computed (using the pairing and then not using it) on two subsequent lines.



```r
res.np <- wilcox.test(survey$span1, survey$span2, paired=FALSE)
names(res.np)
```

```
[1] "statistic"   "parameter"   "p.value"     "null.value"  "alternative"
[6] "method"      "data.name"  
```

```r
p.np <- res.np$p.value
p
```

```
[1] 0.1267877
```

```r
p.np
```

```
[1] 0.7649967
```

# Unpaired t.test

- Study the `t.test` help file. How should we supply the input if we want to do a t test to compare `span1` between males and females?


```r
?t.test
```

- Make two separate vectors of `span1` values for males and females.

```r
span1.male <- survey$span1[survey$gender == 'male']
span1.female <- survey$span1[survey$gender == 'female']
```

- Perform the unpaired t test that compares span1 between males and females.


```r
t.test(span1.male, span1.female)
```

```

	Welch Two Sample t-test

data:  span1.male and span1.female
t = 10.497, df = 207.63, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 1.702358 2.489625
sample estimates:
mean of x mean of y 
 19.73103  17.63504 
```

- Extract the confidence interval for the difference in spans from the resulting object.

```r
res <- t.test(span1.male, span1.female)
names(res)
```

```
 [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
 [6] "null.value"  "stderr"      "alternative" "method"      "data.name"  
```

```r
res$conf.int
```

```
[1] 1.702358 2.489625
attr(,"conf.level")
[1] 0.95
```

- Round the p-value to 3 significant digits. Hint: use `round`

```r
round(res$p.value, 3)
```

```
[1] 0
```


# Tests for count tables 

- In the survey data, make a table of the `fold` against the `clap` variables. Hint: use the function `table`.

```r
table(survey$fold, survey$clap)
```

```
         
          left neither right
  left      15      21    60
  neither    0       2    16
  right     22      26    71
```

- Now use a chi-square test to study the association between `fold` and `clap`. For this, check the help file for the function `chisq.test`.  


```r
chisq.test(survey$fold, survey$clap)
```

```
Warning in chisq.test(survey$fold, survey$clap): Chi-squared approximation may
be incorrect
```

```

	Pearson's Chi-squared test

data:  survey$fold and survey$clap
X-squared = 6.4101, df = 4, p-value = 0.1705
```

- Check the class and the names of this object. Save the computed p-value as a separate variable.


```r
class(chisq.test(survey$fold, survey$clap))
```

```
Warning in chisq.test(survey$fold, survey$clap): Chi-squared approximation may
be incorrect
```

```
[1] "htest"
```

```r
names(chisq.test(survey$fold, survey$clap))
```

```
Warning in chisq.test(survey$fold, survey$clap): Chi-squared approximation may
be incorrect
```

```
[1] "statistic" "parameter" "p.value"   "method"    "data.name" "observed" 
[7] "expected"  "residuals" "stdres"   
```

```r
p.cs <- chisq.test(survey$fold, survey$clap)$p.value
```

```
Warning in chisq.test(survey$fold, survey$clap): Chi-squared approximation may
be incorrect
```

- A warning message was generated  because the expected count is less than 5 in some of the cells in the table. Get the expected counts from the object returned by `chisq.test`. Hint: use the component `expected` of the object.


```r
res <- chisq.test(survey$fold, survey$clap)
```

```
Warning in chisq.test(survey$fold, survey$clap): Chi-squared approximation may
be incorrect
```

```r
res$expected
```

```
           survey$clap
survey$fold      left   neither    right
    left    15.244635 20.188841 60.56652
    neither  2.858369  3.785408 11.35622
    right   18.896996 25.025751 75.07725
```


- Alternatively, an exact p-value can be obtained using a Fisher's exact test. Use `fisher.test` to test association between `fold` and `clap`. Check the syntax in the help file of the function. Check the class of the object generated and its names. Then save the p-value computed as a separate variable.


```r
fisher.test(survey$fold, survey$clap)
```

```

	Fisher's Exact Test for Count Data

data:  survey$fold and survey$clap
p-value = 0.1727
alternative hypothesis: two.sided
```

```r
class(fisher.test(survey$fold, survey$clap))
```

```
[1] "htest"
```

```r
names(fisher.test(survey$fold, survey$clap))
```

```
[1] "p.value"     "alternative" "method"      "data.name"  
```

```r
p.fis <- fisher.test(survey$fold, survey$clap)$p.value
```

- Print on the console all p-values computed above, rounded to 4 decimal places.


```r
round(p.cs, 4)
```

```
[1] 0.1705
```

```r
round(p.fis, 4)
```

```
[1] 0.1727
```

# Tests for count tables (continued)

- Make a table of `gender` and `exercise` in the `survey` data and save the resulting object.


```r
t.ge <- table(survey$gender, survey$exercise)
t.ge
```

```
        
         freq none some
  female   48   11   58
  male     65   12   39
```

- Test for the association between `gender` and `exercise` in the `survey` data using a chi-square test. Use the table of the two variables in the function call, instead of the variables themselves. Save both the entire test result as the p-value as separate objects.


```r
chi.ge <- chisq.test(t.ge)
chi.ge
```

```

	Pearson's Chi-squared test

data:  t.ge
X-squared = 6.3185, df = 2, p-value = 0.04246
```

```r
# Compare the result with that using the variables directly
chisq.test(survey$gender, survey$exercise)
```

```

	Pearson's Chi-squared test

data:  survey$gender and survey$exercise
X-squared = 6.3185, df = 2, p-value = 0.04246
```

```r
p.ge <- chi.ge$p.value
# This is the same as
p.ge <- chisq.test(t.ge)$p.value
```

- Check the names of components in the test object. Extract the expected count table from the object to see if any of the entries are less than 5.


```r
names(chi.ge)
```

```
[1] "statistic" "parameter" "p.value"   "method"    "data.name" "observed" 
[7] "expected"  "residuals" "stdres"   
```

```r
chi.ge$expected
```

```
        
             freq     none     some
  female 56.74249 11.54936 48.70815
  male   56.25751 11.45064 48.29185
```

- The test object also involves a component called `observed`. Check what it contains and compare it to the observed data table you saved.


```r
chi.ge$observed
```

```
        
         freq none some
  female   48   11   58
  male     65   12   39
```

```r
t.ge
```

```
        
         freq none some
  female   48   11   58
  male     65   12   39
```

```r
# The component observed from the test object corresponds to the cross-table of the variables used
```

- Compute the p-value for the test again by using simulation, instead of the chi-square approximation. This can be done by means of the `simulate.p.value` slot  in the function call. Save the computed p-value as a separate variable. 


```r
chisq.test(t.ge, simulate.p.value=TRUE)
```

```

	Pearson's Chi-squared test with simulated p-value (based on 2000
	replicates)

data:  t.ge
X-squared = 6.3185, df = NA, p-value = 0.04048
```

```r
p.sim <- chisq.test(t.ge, simulate.p.value=TRUE)$p.value
```


- Print both computed p-values on the console with 2 decimal places.


```r
round(p.ge, 2)
```

```
[1] 0.04
```

```r
round(p.sim, 2)
```

```
[1] 0.03
```

```r
# Note that the simulated p-value may vary every time it is run
```

