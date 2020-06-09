---
title: "Functions and help files"
date: "09 juni 2020"
---





# Functions and help files

## Function arguments

### Functions may have multiple arguments

Example `round`:

```r
round(pi,3)
```

```
[1] 3.142
```

```r
round(pi,5)
```

```
[1] 3.14159
```

Optional arguments may be left out:

```r
round(pi)
```

```
[1] 3
```

### Getting help for a function

Functions do calculations for you based on one or more arguments. To find out what arguments a function has and how they work, check the help file of the function. Two ways of getting help for a function

```r
help(round)
?round
```

We see that `round` has two arguments and that the default of the second argument is 0.


### Specifying arguments by name

Function arguments may be either given in the right order or specified explicitly by name.


```r
round(pi, digits = 3)
```

```
[1] 3.142
```

The latter option is especially useful for functions with many arguments.

### Default arguments

Look at the help file of `cor`. We see that the argument `method` has a vector of three options as a default. This means that the first mentioned value (`pearson`) is the default and the others (`kendall`, `spearman`) are alternative options.

### (*) the `...` argument

The argment `...` means that a variable number of arguments may be given. See e.g. `sum` has a `...` argument since it sums all arguments together

```r
sum(1,4,5:7,1)
```

```
[1] 24
```
Arguments appearing after `...` must always be specified by name.



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](06_help.tasks.nocode.html#signif), and check your solution(s) [here](06_help.tasks.code.html#signif).

- - -


## Other help file aspects

Help files typically explain the type of object that is returned by the function.

Help files also contain examples that can be run.

### Help search

Finding help if you don't know the function name

```r
help.search("mean")
??mean
```

Usually better: use the r help mailing list: <http://www.r-project.org/mail.html>. Someone has usually asked the same question you want to ask. The r mailing list is well indexed in google.

Or ask some local expert. 


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](06_help.tasks.nocode.html#help), and check your solution(s) [here](06_help.tasks.code.html#help).

- - -



