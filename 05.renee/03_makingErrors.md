---
title: "Making Errors The Right Way"
date: "09 juni 2020"
---





# Making errors the right way

There are two types of programming errors: the annnoying ones and the dangerous ones.

### Annoying errors

These are errors that yield an error message. Such errors can be avoided by including flags in your script, to check that all objects are as they are expected, their classes correspond to what they should be, etc. For example, when reading data into R, it should always be checked what was read, its dimensions, and the variable types. One such useful summary is given by `str()`:


```r
hw17 <- read.delim("height_weight17.txt")
str(hw17)
```

```
'data.frame':	41 obs. of  2 variables:
 $ height: num  1.6 1.67 1.68 1.81 1.69 ...
 $ weight: num  46.3 51.2 52.5 61.8 54.9 ...
```

It is also a good idea to make graphs (or tables, if more appropriate) of variables at different stages, to check if values are as expected.  In fact, any summary is helpful. Here we could compute the mean for each column in `hw17`:


```r
apply(hw17,2,mean)
```

```
  height   weight 
 1.71858 71.90145 
```

If you have different objects with same row or column names, it is a good idea to check that this property is preserved as well.

### How to correct (annoying) errors

All the above help us check that things are as they should, but it does not prevent errors from happening. To find the source or an error, it is useful to think "like R", and to follow what R does step-by-step. This may require splitting some expressions to enable intermediate checking. 

Say we read in a file with heights of female students in Amsterdam and in Rio de Janeiro:


```r
my.table <- read.table("heights_female_students.txt",header=TRUE,sep="\t")
str(my.table)
```

```
'data.frame':	100 obs. of  2 variables:
 $ Amsterdam     : num  174 180 173 180 180 ...
 $ Rio.de.Janeiro: num  166 165 165 166 166 ...
```

Now we want to use a t test to compare the two vectors of heights. We know we can do this by:


```r
t.test(my.table["Amsterdam"],my.table["Rio.de.Janeiro"])
```

```

	Welch Two Sample t-test

data:  my.table["Amsterdam"] and my.table["Rio.de.Janeiro"]
t = 19.381, df = 197.97, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 7.227782 8.865233
sample estimates:
mean of x mean of y 
 175.2078  167.1613 
```

Although the t test works, there is some doubt that the normality assumption holds, so we also run the Wilcoxon test with:


```r
wilcox.test(my.table["Amsterdam"], my.table["Rio.de.Janeiro"])
```

```
Error in wilcox.test.default(my.table["Amsterdam"], my.table["Rio.de.Janeiro"]): 'x' must be numeric
```

but this gives an error, complaining that `'x' must be numeric`. We know that the data was read in correctly from the str() result, so we check the class of the objects involved in the function call:


```r
class( my.table["Amsterdam"] )
```

```
[1] "data.frame"
```

Indeed, this sort of selection preserves the object class as data.frame, which is not numeric. If we do instead:


```r
class( my.table[ , "Amsterdam"] )
```

```
[1] "numeric"
```

we get a numeric object. So now we try this as argument in the `wilcox.test()`:


```r
wilcox.test(my.table[,"Amsterdam"],my.table[,"Rio.de.Janeiro"])
```

```

	Wilcoxon rank sum test with continuity correction

data:  my.table[, "Amsterdam"] and my.table[, "Rio.de.Janeiro"]
W = 9806, p-value < 2.2e-16
alternative hypothesis: true location shift is not equal to 0
```

and this works.

It is strange as we had used the same syntax as used in the `t.test()` call. If we look at the help files of these two functions, we notice that the `t.test()` accepts data.frames as arguments, whilst the `wilcox.test()` does not.

### Dangerous errors

These are errors that do not yield any error message. Such errors can remain silently in your code for ages (or many lines) before they are discovered.

We return to the example where we wish to compare the heights of students in Amsterdam and of students in Rio. We decide to not use the syntax with square brackets, due to the confusion between selecting columns that are numeric and selecting objects that are data.frames. Instead, we will select the columns using the `$` sign, which is commonly done with data.frames. So we use:


```r
wilcox.test(my.table$Ams, my.table$rio)
```

```

	Wilcoxon signed rank test with continuity correction

data:  my.table$Ams
V = 5050, p-value < 2.2e-16
alternative hypothesis: true location is not equal to 0
```

This seems OK, although the output is slightly different from the one we had above. The syntax used is very clear, though, so there should not be any differences. Just to check the syntax, we now apply the same test pretending it involves paired data (this is possible since the two vectors of heights have the same length).


```r
wilcox.test(my.table$Ams, my.table$rio, paired=TRUE)
```

```
Error in wilcox.test.default(my.table$Ams, my.table$rio, paired = TRUE): 'y' is missing for paired test
```

Now we get an error message, suggesting that 'y' is missing and mentioning the paired test, but in fact we have the data to use stated clearly. So we decide to check this once more by using another syntax, now selecting the columns according to their number:


```r
wilcox.test(my.table[, 1], my.table[, 2])
```

```

	Wilcoxon rank sum test with continuity correction

data:  my.table[, 1] and my.table[, 2]
W = 9806, p-value < 2.2e-16
alternative hypothesis: true location shift is not equal to 0
```

This now yields the same output as when we used `wilcox.test(my.table[, "Amsterdam"], my.table[, "Rio.de.Janeiro"])`, but not as `wilcox.test(my.table$Ams, my.table$rio)`. What could be going wrong here?

If we check carefully, the variable (column) names in `my.table` are:


```r
colnames(my.table)
```

```
[1] "Amsterdam"      "Rio.de.Janeiro"
```

So, what does the statement `my.table$rio` represent? Check:


```r
my.table$rio
```

```
NULL
```

It turns out that `y=NULL` is a valid input for the wilcox.test function. However, it was not what we wanted to do.



### How to avoid (dangerous) errors

We all make mistakes, and this does not stop when we are programming/scripting. In fact, this happens more often than we wish when programming, as we are required to write steps precisely but we may overlook internal working differences in functions.

The difference between a beginner and an experienced R user is that the beginner will take longer to sort the error out (typically - I am willing to be proven wrong!). This is partly because a beginner goes through phases like panic (due to the red error message appearing on the screen), followed by frustration (why did this script did not just run? why is this happening to me?), and finally by closing R down and opening Excel instead.

A more experienced R user will, when encountering an error or an unexpected result, first read the error message. This may sometimes give clues as to what is going wrong - although, agreed, not always. Then it is important to try to go back a few steps on the script and check if the objects created were as expected: check `class()` and object size (via `dim()`, `length()` and `str()` are here useful). If these fail to uncover anything unexpected, check the values contained in objects. Here it is useful to perform checks in small parts of the data, when handling large objects. With data.frames, this can be done via `head()` and `tail()`. Also check for the existence of NAs creeping into the objects, via the use of `sum()` onto a `is.na(object)`, possibly in combination with apply to yield row or column summaries. Plots are of course also very useful - both scatterplots as well as heatmaps can greatly help uncover strange values/patterns in the data. Retracing steps should continue until objects are found to contain the expected values/have the expected format. 

If in the few steps preceding the strange results nothing unexpected is found, then one way to continue searching for the problem source is by "peeling" of the code: this involves splitting the code into ever simpler operations, or re-writing them as we did in the wilcox.test example, and checking if these actions change the output.

What is important for any beginner in R to understand is that error messages are there to help us - by reading them carefully and performing checks we improve our understanding of how specific R functions work, and how they do not work!
