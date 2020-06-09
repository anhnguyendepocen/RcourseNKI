---
title: "Basics"
date: "09 juni 2020"
---



# Basics

## R as a calculator

### Calculations

At the prompt `>` you can do any calculations you like. Press enter to see the result.


```r
2*8
```

```
[1] 16
```

```r
4+5
```

```
[1] 9
```

```r
2/8
```

```
[1] 0.25
```

```r
5^2  # ^ = to the power
```

```
[1] 25
```

Note: decimals always with `.`, never `,`.

### Parentheses

Use parentheses as much as possible to make sure the calculations are done in the right order.


```r
12/2*3
```

```
[1] 18
```

```r
12/(2*3)
```

```
[1] 2
```

RStudio will automatically insert a closing parenthesis. If you don't like this, change using Tools...Global options...Code...Editing.

### Arithmetic functions

Useful functions.


```r
sqrt(10)             # square root
```

```
[1] 3.162278
```

```r
log(10)              # natural logarithm
```

```
[1] 2.302585
```

Terminology: the _function_ (e.g. `log`) is applied to its _argument_ (e.g. `10`). The argument of a function is always between parentheses.

Other useful functions 

- `log2` (logartithm base 2) 
- `log10` (logarithm base 10)
- `abs` (absolute value)


### Multiline commands

Use up/down arrow to retrieve previous/next commands. Use Ctrl-R to see command history and type letters to select a line.

Getting a `+` as a prompt means the command is not finished yet. Continue typing or press _Esc_.

```r
5*(1+1
)
```

```
[1] 10
```

### (*) Integer division and remainders

The remainder of one number after division by another.


```r
17 %/% 5    # integer division
```

```
[1] 3
```

```r
17 %% 5     # remainder
```

```
[1] 2
```

`17 %/% 5` evaluates to 3 because `17 = 3*5+2`, so 5 fits into 17 3 times.
`17 %% 5` evaluates to 2 because `17 = 3*5+2`, so 2 is the remainder of 17 when divided by 5.



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](02_basics.tasks.nocode.html#firstCalculations), and check your solution(s) [here](02_basics.tasks.code.html#firstCalculations).

- - -


## Variables

### Variable names

Variables store values or results of calculations. Choose the names of variables freely.

```r
x <- 5
my_calculation <- 6 + x
```

To find out what the value of a variable is: type the name.

```r
x
```

```
[1] 5
```

Rstudio has autocomplete (with `tab`). Useful for long variable names.

### Legal variable names

Note that `_` and `.` are allowed in variable names. Numbers are allowed too. 

Not allowed:

- names containing a space
- names containing a one of @#!%$^()-+=!~?,<>}{][`
- for, while, repeat, if, else, TRUE, FALSE, Inf, NA, NaN (reserved names)
- a name that starts with a number

Variable names in R are case sensitive. Everything else too!

Choose meaningful variable names for readable code.

### Assignment

Arrow is called "assignment". Also allowed: `=`.


```r
x = 5
```

Assignments are needed to store a result. No assignment: printed to screen and lost.


```r
x+1
```

```
[1] 6
```

```r
x
```

```
[1] 5
```

You have asked R what `x+1` is, but `x` did not change. To change the value of a variable, reassign.


```r
x <- x + 1
x
```

```
[1] 6
```

Remember: _no assignment, no change_

Important: variables are stored in memory, not on disk. If you close R, all variables are lost (if save workspace image = no)

Your RStudio has an *environment* tab that lists all the variables you made.

### (*) The workspace

To list the variable(s) you have defined:

```r
ls()
```

```
 [1] "catLinkTaskSection" "catLoad"            "catReadCsv"        
 [4] "catReadDelim"       "catReadLines"       "catReadTable"      
 [7] "catSlot"            "catTopic"           "my_calculation"    
[10] "params"             "x"                 
```

Note that this is a function with no arguments.

To remove a variable from memory:

```r
rm(x)
```

You only need to remove a variable from memory when:

1. The variable is large and you want to free memory
2. You have accidentaly overwritten one of R's fixed constants

Note that `rm` is definitive and you cannot _undo_ it!



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](02_basics.tasks.nocode.html#firstVariables), and check your solution(s) [here](02_basics.tasks.code.html#firstVariables).

- - -


## Vectors 

Vectors are the basic building blocks of the R language. 

### Vector basics

Variables can contain _vectors_ of numbers. A vector can be e.g. just any sequence of numbers.

You can make a vector using `c` (combine):

```r
x <- c(3, 6, 7, 2)
```

Calculations or functions often work on vectors elementwise. This is helpful to do many calculations simultaneously:

```r
x^2
```

```
[1]  9 36 49  4
```

```r
x - 18
```

```
[1] -15 -12 -11 -16
```

```r
sqrt(x)
```

```
[1] 1.732051 2.449490 2.645751 1.414214
```

Some functions summarize a vector to a single number:

```r
sum(x)
```

```
[1] 18
```

To find out the number of elements in a vector:

```r
length(x)
```

```
[1] 4
```

### Simple sequences

A simple regular sequence you can make with `:` (colon) operator:

```r
y <- 1:10
7:9
```

```
[1] 7 8 9
```

### Simple selection

To see only part of a vector use square brackets. Combine with `:` to select more than one element:

```r
x[1]
```

```
[1] 3
```

```r
x[3:4]
```

```
[1] 7 2
```



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](02_basics.tasks.nocode.html#exercisesBasics), and check your solution(s) [here](02_basics.tasks.code.html#exercisesBasics).

- - -
