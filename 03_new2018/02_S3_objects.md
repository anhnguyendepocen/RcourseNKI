---
title: "Basic statistical tests"
date: "10 juni 2020"
---





```r
## pulse <- read.delim("pulse.txt")
## survey <- read.delim("survey.txt")
```


# Statistical methods with R

Statistical methods typically have their own pre-defined functions. Example: the t-test.

## Statistical tests - the t test

Suppose we are interested in finding a difference between `pulse1` and `pulse2` in the pulse data. These are two variables representing measurements per individual before (pulse1) and after (pulse2) an intervention. As such, measurements are paired so we apply a paired t test:


```r
t.test(pulse$pulse1, pulse$pulse2, paired=TRUE)
```

```

	Paired t-test

data:  pulse$pulse1 and pulse$pulse2
t = -7.4726, df = 108, p-value = 2.172e-11
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -26.70969 -15.51049
sample estimates:
mean of the differences 
              -21.11009 
```



## Accessing the result

The output on the screen is clear. But sometimes we want to extract parts of the output, say to put in a report, without having to include the entire output of the test. To do that, let us first save the result as an R object, and then check what it contains by using names().


```r
res <- t.test(pulse$pulse1, pulse$pulse2, paired=TRUE)
names(res)
```

```
 [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
 [6] "null.value"  "stderr"      "alternative" "method"      "data.name"  
```

```r
class(res)
```

```
[1] "htest"
```

Note that the resulting object of `t.test` is a special type of object. It contains various components, including statistic and parameter. Each can be assessed by using a `$` sign, as in:


```r
res$statistic
```

```
        t 
-7.472648 
```

```r
res$p.value
```

```
[1] 2.171529e-11
```

Note in particular that elements in this result involve different types and lengths. Indeed:


```r
class(res$p.value)
```

```
[1] "numeric"
```

```r
class(res$alternative)
```

```
[1] "character"
```

```r
length(res$p.value)
```

```
[1] 1
```

```r
length(res$conf.int)
```

```
[1] 2
```

This means that the object resulting from the t.test function is a list too.


## Wilcoxon test

Similarly to what we did above, we can apply a Wilcoxon test for these paired measurements and save results as an object. This can be done using:


```r
res <- wilcox.test(pulse$pulse1, pulse$pulse2, paired=TRUE)
```


Note that the syntax is the same as the one used for the t test. 

We can also assess names and the class of the object created by the Wilcoxon test:


```r
names(res)
```

```
[1] "statistic"   "parameter"   "p.value"     "null.value"  "alternative"
[6] "method"      "data.name"  
```

```r
class(res)
```

```
[1] "htest"
```

Note that the class of the object created by the wilcox.test function is the same as that for the object created by the t.test function.

## Other statistical tests

Other basic tests available include:

- `chisq.test`
- `fisher.test`
- `binom.test`



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](02_S3_objects.tasks.nocode.html#S3), and check your solution(s) [here](02_S3_objects.tasks.code.html#S3).

- - -
