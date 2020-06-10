---
title: "Data frames (basics)"
date: "10 juni 2020"
---



# Data frames (basics)

So we are now able to read in data sets (tables). A data set in R is called a `data.frame`. 


```
# To get 'pulse.txt' directly from the server, use:
# pulse <- read.table( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/pulse.txt" ), header = TRUE, sep = "\t" )
```

```r
pulse <- read.delim( "../data/pulse.txt" )
```


```
# To get 'survey.txt' directly from the server, use:
# survey <- read.table( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/survey.txt" ), header = TRUE, sep = "\t" )
```

```r
survey <- read.delim( "../data/survey.txt" )
```

R can have many data sets in memory simultaneously. You will always have to specify which data set you are working in.

## Exploring 

### Dimensions

Rows in a data.frame are typically subjects; columns are variables.

To find the size of a data.frame

```r
ncol(pulse)
```

```
[1] 12
```

```r
nrow(pulse)
```

```
[1] 110
```

```r
dim(pulse)
```

```
[1] 110  12
```

### Showing head and tail

To get a quick impression of a data.frame:

- `head` prints the first 6 rows
- `tail` prints the last 6 rows

If you want more or less than 6, add the number you want as a second argument to the function:

```r
head(pulse)
```

```
           name height weight age gender smokes alcohol exercise ran pulse1
1993_A   Bonnie    173     57  18 female     no     yes moderate sat     86
1993_B  Melanie    179     58  19 female     no     yes moderate ran     82
1993_C Consuelo    167     62  18 female     no     yes     high ran     96
1993_D   Travis    195     84  18   male     no     yes     high sat     71
1993_E    Lauri    173     64  18 female     no     yes      low sat     90
1993_F   George    184     74  22   male     no     yes      low ran     78
       pulse2 year
1993_A     88 1993
1993_B    150 1993
1993_C    176 1993
1993_D     73 1993
1993_E     88 1993
1993_F    141 1993
```

```r
tail(pulse, 3)
```

```
        name height weight age gender smokes alcohol exercise ran pulse1 pulse2
1998_P Chris    182     60  22   male     no     yes      low sat     86     84
1998_Q Lewis    170     65  18   male     no     yes     high sat     69     64
1998_R  Gene    185     85  19   male     no     yes moderate sat     75     68
       year
1998_P 1998
1998_Q 1998
1998_R 1998
```

We've already seen `View`.

With `names` (alternatively `colnames`) you find the names of the variables (columns) in the data.frame:

```r
names(pulse)
```

```
 [1] "name"     "height"   "weight"   "age"      "gender"   "smokes"  
 [7] "alcohol"  "exercise" "ran"      "pulse1"   "pulse2"   "year"    
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](04_dataframes.tasks.nocode.html#explore), and check your solution(s) [here](04_dataframes.tasks.code.html#explore).

- - -


## Extracting 

### Columns

To extract a column of a data.frame use `$`. The result is a vector:

```r
pulse$age
```

```
  [1] 18 19 18 18 18 22 20 18 19 23 20 19 22 18 18 22 19 18 21 19 19 34 20 26 19
 [26] 18 18 21 19 21 20 19 19 23 19 20 18 19 18 18 20 23 21 19 19 18 26 20 19 22
 [51] 20 20 20 18 20 20 20 18 19 20 18 20 18 20 21 19 20 21 19 22 23 19 20 19 20
 [76] 20 20 20 18 19 18 41 21 25 28 21 18 45 19 18 19 19 21 21 23 28 20 20 20 19
[101] 24 19 20 20 23 19 19 22 18 19
```

Note the autocomplete in RStudio that helps suggest the right column.

To add a column to a data.frame, use the assigmnent:

```r
pulse$pulse.diff <- pulse$pulse2 - pulse$pulse1
head( pulse )
```

```
           name height weight age gender smokes alcohol exercise ran pulse1
1993_A   Bonnie    173     57  18 female     no     yes moderate sat     86
1993_B  Melanie    179     58  19 female     no     yes moderate ran     82
1993_C Consuelo    167     62  18 female     no     yes     high ran     96
1993_D   Travis    195     84  18   male     no     yes     high sat     71
1993_E    Lauri    173     64  18 female     no     yes      low sat     90
1993_F   George    184     74  22   male     no     yes      low ran     78
       pulse2 year pulse.diff
1993_A     88 1993          2
1993_B    150 1993         68
1993_C    176 1993         80
1993_D     73 1993          2
1993_E     88 1993         -2
1993_F    141 1993         63
```


### Row names

A data.frame always has row names. Note that these names are not themselves a column of the data.frame!

```r
rownames(pulse)
```

```
  [1] "1993_A" "1993_B" "1993_C" "1993_D" "1993_E" "1993_F" "1993_G" "1993_H"
  [9] "1993_I" "1993_J" "1993_K" "1993_L" "1993_M" "1993_N" "1993_O" "1993_P"
 [17] "1993_Q" "1993_R" "1993_S" "1993_T" "1993_U" "1993_V" "1993_W" "1993_X"
 [25] "1993_Y" "1993_Z" "1995_A" "1995_B" "1995_C" "1995_D" "1995_E" "1995_F"
 [33] "1995_G" "1995_H" "1995_I" "1995_J" "1995_K" "1995_L" "1995_M" "1995_N"
 [41] "1995_O" "1995_P" "1995_Q" "1995_R" "1995_S" "1995_T" "1995_U" "1995_V"
 [49] "1996_A" "1996_B" "1996_C" "1996_D" "1996_E" "1996_F" "1996_G" "1996_H"
 [57] "1996_I" "1996_J" "1996_K" "1996_L" "1996_M" "1996_N" "1996_O" "1996_P"
 [65] "1996_Q" "1996_R" "1996_S" "1996_T" "1996_U" "1997_A" "1997_B" "1997_C"
 [73] "1997_D" "1997_E" "1997_F" "1997_G" "1997_H" "1997_I" "1997_J" "1997_K"
 [81] "1997_L" "1997_M" "1997_N" "1997_O" "1997_P" "1997_Q" "1997_R" "1997_S"
 [89] "1997_T" "1997_U" "1997_V" "1997_W" "1998_A" "1998_B" "1998_C" "1998_D"
 [97] "1998_E" "1998_F" "1998_G" "1998_H" "1998_I" "1998_J" "1998_K" "1998_L"
[105] "1998_M" "1998_N" "1998_O" "1998_P" "1998_Q" "1998_R"
```

Name of each row must be unique.

### Elements

An individual entry to a data.frame can be extracted using square brackets `[`, either using the names of row and column (note the quotes) or their indices. Row comes before the comma, column after.

```r
pulse["1993_E", "height"]
```

```
[1] 173
```

```r
pulse[5, 2]
```

```
[1] 173
```

You can also use ranges like with vectors

```r
pulse[4:6, 1:5]
```

```
         name height weight age gender
1993_D Travis    195     84  18   male
1993_E  Lauri    173     64  18 female
1993_F George    184     74  22   male
```

Much more about using square brackets later in the course.


### (*) Removing a column 

To remove a column from a data.frame, assign `NULL` to that column:

```r
pulse$pulse.diff <- NULL
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](04_dataframes.tasks.nocode.html#columns), and check your solution(s) [here](04_dataframes.tasks.code.html#columns).

- - -

## Example data

R contains many example data sets. To see which, see:

```r
data()
```

Example data are immediately accessible in R. For example:

```r
BOD
```

```
  Time demand
1    1    8.3
2    2   10.3
3    3   19.0
4    4   16.0
5    5   15.6
6    7   19.8
```

Some description is always available:

```r
?BOD
help("BOD")
```

We will make use of example data from the `MASS` package. Packages are bundles with additional functions and data. To make `MASS` available in your R session, say:

```r
library(MASS)
```

```

Attaching package: 'MASS'
```

```
The following object is masked _by_ '.GlobalEnv':

    survey
```
More about packages later.


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](04_dataframes.tasks.nocode.html#newFrame), and check your solution(s) [here](04_dataframes.tasks.code.html#newFrame).

- - -
