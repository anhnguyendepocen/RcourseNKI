---
title: "Data frames"
date: "09 juni 2020"
---



# Data frames 

## What is a data frame

<center>![Vectors](Data_types_mdfl.png)</center>

Data frame is a collection of variables represented as vectors of the same length.

Therefore, all the vectors (columns) should have unique names.

Rows represent separate records.

Rows might have names as well (although for new code, better create a separate column with names).

## Creating

### From manually provided vectors

An example data frame built of `character`, `numeric` and `logical` vectors:


```r
ids <- c( "A", "B", "D", "E" );
ns <- c( "Amy", "Bob", "Dan", "Eve" )
as <- c( 40, NA, 6, 16 )
ss <- c( TRUE, NA, FALSE, FALSE )

d <- data.frame(
  row.names = ids,
  name = ns,
  age = as,
  smoker = ss
)
d
```

```
  name age smoker
A  Amy  40   TRUE
B  Bob  NA     NA
D  Dan   6  FALSE
E  Eve  16  FALSE
```

The class of `d` is:

```r
class( d )
```

```
[1] "data.frame"
```

Function `str` gives a compact display of an object structure/content:

```r
str( d )
```

```
'data.frame':	4 obs. of  3 variables:
 $ name  : Factor w/ 4 levels "Amy","Bob","Dan",..: 1 2 3 4
 $ age   : num  40 NA 6 16
 $ smoker: logi  TRUE NA FALSE FALSE
```

### Import from files

Datasets my come in various formats, e.g. `.tsv`, `.csv`, `.xls(x)`, `.sav`, `.txt` etc. R provides functions to import these formats as data.frame. 

_Note_: always after a file is read the columns must be checked whether their class and values are as expected. Additional conversions might be necessary (e.g. declaring factor levels, order of factor levels).

#### TSV file

For files stored in [tab-separated files (`tsv`) format](https://en.wikipedia.org/wiki/Tab-separated_values) use:


```r
d <- read.table( "data/pulse.tsv", header = TRUE, sep = "\t" )
```

```
# To get 'pulse.tsv' directly from the server, use:
# d <- read.table( url( "https://barmsijs.lumc.nl/R_course/data/pulse.tsv" ), header = TRUE, sep = "\t" )
```

```r
str( d )
```

```
'data.frame':	110 obs. of  12 variables:
 $ name    : Factor w/ 106 levels "Adeline","Adrian",..: 7 72 16 101 56 35 11 31 96 102 ...
 $ height  : int  173 179 167 195 173 184 162 169 164 168 ...
 $ weight  : num  57 58 62 84 64 74 57 55 56 60 ...
 $ age     : int  18 19 18 18 18 22 20 18 19 23 ...
 $ gender  : Factor w/ 2 levels "female","male": 1 1 1 2 1 2 1 1 1 2 ...
 $ smokes  : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
 $ alcohol : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
 $ exercise: Factor w/ 3 levels "high","low","moderate": 3 3 1 1 2 2 3 3 1 3 ...
 $ ran     : Factor w/ 2 levels "ran","sat": 2 1 1 2 2 1 2 2 2 1 ...
 $ pulse1  : int  86 82 96 71 90 78 68 71 68 88 ...
 $ pulse2  : int  88 150 176 73 88 141 72 77 68 150 ...
 $ year    : int  1993 1993 1993 1993 1993 1993 1993 1993 1993 1993 ...
```

#### CSV file

Data frames (tables) stored in files in [comma-separated values (`csv`) format](https://en.wikipedia.org/wiki/Comma-separated_values) can be read with:

```r
d <- read.csv( "data/pulse.csv" );
```

```
# To get 'pulse.csv' directly from the server, use:
# d <- read.csv( url( "https://barmsijs.lumc.nl/R_course/data/pulse.csv" ) )
```

```r
str( d )
```

```
'data.frame':	110 obs. of  13 variables:
 $ id      : Factor w/ 110 levels "1993_A","1993_B",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ name    : Factor w/ 106 levels "Adeline","Adrian",..: 7 72 16 101 56 35 11 31 96 102 ...
 $ height  : int  173 179 167 195 173 184 162 169 164 168 ...
 $ weight  : num  57 58 62 84 64 74 57 55 56 60 ...
 $ age     : int  18 19 18 18 18 22 20 18 19 23 ...
 $ gender  : Factor w/ 2 levels "female","male": 1 1 1 2 1 2 1 1 1 2 ...
 $ smokes  : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
 $ alcohol : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
 $ exercise: Factor w/ 3 levels "high","low","moderate": 3 3 1 1 2 2 3 3 1 3 ...
 $ ran     : Factor w/ 2 levels "ran","sat": 2 1 1 2 2 1 2 2 2 1 ...
 $ pulse1  : int  86 82 96 71 90 78 68 71 68 88 ...
 $ pulse2  : int  88 150 176 73 88 141 72 77 68 150 ...
 $ year    : int  1993 1993 1993 1993 1993 1993 1993 1993 1993 1993 ...
```

#### Microsoft Excel file

Reading Microsoft Excel files requires an additional library/package, which needs to be installed first. There exists several packages providing reading of Excel files.

##### With package readxl


```r
# install.packages( "readxl" )
library( readxl );
d <- read_excel( "data/pulse.xlsx", sheet = 1 );
str( d );
```

```
tibble [110 × 13] (S3: tbl_df/tbl/data.frame)
 $ id      : chr [1:110] "1993_A" "1993_B" "1993_C" "1993_D" ...
 $ name    : chr [1:110] "Bonnie" "Melanie" "Consuelo" "Travis" ...
 $ height  : num [1:110] 173 179 167 195 173 184 162 169 164 168 ...
 $ weight  : num [1:110] 57 58 62 84 64 74 57 55 56 60 ...
 $ age     : num [1:110] 18 19 18 18 18 22 20 18 19 23 ...
 $ gender  : chr [1:110] "female" "female" "female" "male" ...
 $ smokes  : chr [1:110] "no" "no" "no" "no" ...
 $ alcohol : chr [1:110] "yes" "yes" "yes" "yes" ...
 $ exercise: chr [1:110] "moderate" "moderate" "high" "high" ...
 $ ran     : chr [1:110] "sat" "ran" "ran" "sat" ...
 $ pulse1  : chr [1:110] "86" "82" "96" "71" ...
 $ pulse2  : chr [1:110] "88" "150" "176" "73" ...
 $ year    : num [1:110] 1993 1993 1993 1993 1993 ...
```

##### With package gdata

Please note that `gdata` package requires additional PERL packages to be installed; `readxl` seems to be easier to use.


```r
# install.packages( "gdata" )
library( gdata )
d <- read.xls( "data/pulse.xlsx", sheet = 1 )
str( d )
```

#### SPSS files

Reading SPSS files requires an additional library/package `foreign` (normally installed with R distribution). 


```r
library( foreign )
d <- read.spss( "data/pulse.sav", to.data.frame = TRUE )
str( d )
```

```
'data.frame':	110 obs. of  13 variables:
 $ id      : Factor w/ 110 levels "1993_A","1993_B",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ name    : Factor w/ 106 levels "Adeline    ",..: 7 72 16 101 56 35 11 31 96 102 ...
 $ height  : num  173 179 167 195 173 184 162 169 164 168 ...
 $ weight  : num  57 58 62 84 64 74 57 55 56 60 ...
 $ age     : num  18 19 18 18 18 22 20 18 19 23 ...
 $ gender  : Factor w/ 2 levels "female","male": 1 1 1 2 1 2 1 1 1 2 ...
 $ smokes  : Factor w/ 2 levels "no","yes": 1 1 1 1 1 1 1 1 1 1 ...
 $ alcohol : Factor w/ 2 levels "no","yes": 2 2 2 2 2 2 2 2 2 2 ...
 $ exercise: Factor w/ 3 levels "low","moderate",..: 2 2 3 3 1 1 2 2 3 2 ...
 $ ran     : Factor w/ 2 levels "sat","ran": 1 2 2 1 1 2 1 1 1 2 ...
 $ pulse1  : num  86 82 96 71 90 78 68 71 68 88 ...
 $ pulse2  : num  88 150 176 73 88 141 72 77 68 150 ...
 $ year    : Factor w/ 5 levels "1993","1995",..: 1 1 1 1 1 1 1 1 1 1 ...
 - attr(*, "codepage")= int 65001
```

## Properties

Let's discuss the data frame `pulse`:

```r
pulse <- read.table( "data/pulse.txt", header = TRUE, sep = "\t" )
```

```
# To get 'pulse.txt' directly from the server, use:
# pulse <- read.table( url( "https://barmsijs.lumc.nl/R_course/data/pulse.txt" ), header = TRUE, sep = "\t" )
```

To shorten output we will use the first 20 rows of the `pulse` data frame:

```r
pulse <- head( pulse, 20 )
```

### Dimensions

There are several functions to get dimensions of a data frame:

- `ncol( pulse )` provides the number of columns:

```r
ncol( pulse )
```

```
[1] 12
```

- `nrow( pulse )` provides the number of rows:

```r
nrow( pulse )
```

```
[1] 20
```

- `dim( pulse )` returns a vector with two elements: number of rows and number of columns

```r
dim( pulse )
```

```
[1] 20 12
```

### Columns/rows names

`colnames( pulse )` is used to get the names of the columns. In data frames, the same result is returned by `names( d )`:

```r
colnames( pulse )
```

```
 [1] "name"     "height"   "weight"   "age"      "gender"   "smokes"  
 [7] "alcohol"  "exercise" "ran"      "pulse1"   "pulse2"   "year"    
```

```r
names( pulse )
```

```
 [1] "name"     "height"   "weight"   "age"      "gender"   "smokes"  
 [7] "alcohol"  "exercise" "ran"      "pulse1"   "pulse2"   "year"    
```

To get names of the rows use:

```r
rownames( pulse )
```

```
 [1] "1993_A" "1993_B" "1993_C" "1993_D" "1993_E" "1993_F" "1993_G" "1993_H"
 [9] "1993_I" "1993_J" "1993_K" "1993_L" "1993_M" "1993_N" "1993_O" "1993_P"
[17] "1993_Q" "1993_R" "1993_S" "1993_T"
```

## Content

A column of a data frame might be accessed through the `$` operator.

Additionally, the content of a data frame can be accessed with the square bracket `[ ]` (square brackets) operator used in two different ways:

- with one argument `[ col(s) ]` referring to a column
- with two arguments `[ row(s), col(s) ]`

<!-- Note, that sometimes it is not obvious what is returned by those operators.
When a single column is requested, should it be:

- a vector with the column elements (so, a 1-dimensional structure)?
- a data frame with a single column (so, a 2-dimensional structure)? -->

### Dollar operator

The `$` method returns a _single_ column as a _vector_:

```r
pulse$weight
```

```
 [1]  57  58  62  84  64  74  57  55  56  60  75  58  68  59  72 110  56  70  56
[20]  50
```

When the column name is valid the returned value is a _vector_:

```r
class( pulse$weight )
```

```
[1] "numeric"
```

When the name is invalid, `NULL` is returned:

```r
pulse$wrong
```

```
NULL
```

Be careful, the `$` notation searches for a column name starting with a provided prefix:

```r
pulse$we
```

```
 [1]  57  58  62  84  64  74  57  55  56  60  75  58  68  59  72 110  56  70  56
[20]  50
```


### Square brackets operator, single argument

Square brackets notation with a single argument return requested columns as a _data frame_ (compare to the dollar operator section):

```r
pulse[ 'weight' ]
```

```
       weight
1993_A     57
1993_B     58
1993_C     62
1993_D     84
1993_E     64
1993_F     74
1993_G     57
1993_H     55
1993_I     56
1993_J     60
1993_K     75
1993_L     58
1993_M     68
1993_N     59
1993_O     72
1993_P    110
1993_Q     56
1993_R     70
1993_S     56
1993_T     50
```

```r
class( pulse[ 'weight' ] )
```

```
[1] "data.frame"
```


```r
pulse[ 3 ]
```

```
       weight
1993_A     57
1993_B     58
1993_C     62
1993_D     84
1993_E     64
1993_F     74
1993_G     57
1993_H     55
1993_I     56
1993_J     60
1993_K     75
1993_L     58
1993_M     68
1993_N     59
1993_O     72
1993_P    110
1993_Q     56
1993_R     70
1993_S     56
1993_T     50
```

```r
class( pulse[ 3 ] )
```

```
[1] "data.frame"
```

Since the returned object is a `data.frame`, multiple columns might be returned (for example in a different order):

```r
pulse[ c( 'height', 'weight' ) ]
```

```
       height weight
1993_A    173     57
1993_B    179     58
1993_C    167     62
1993_D    195     84
1993_E    173     64
1993_F    184     74
1993_G    162     57
1993_H    169     55
1993_I    164     56
1993_J    168     60
1993_K    170     75
1993_L    178     58
1993_M    170     68
1993_N    187     59
1993_O    180     72
1993_P    185    110
1993_Q    170     56
1993_R    180     70
1993_S    166     56
1993_T    155     50
```

When a name is invalid, an error is produced:

```r
pulse[ 'wrong' ]
```

```
Error in `[.data.frame`(pulse, "wrong"): undefined columns selected
```

### Square brackets operator, two arguments

Single brackets notation with two arguments `[ row(s), col(s) ]` might be used to get (multiple) row(s) and (multiple) column(s):

```r
pulse[ c( 1, 3 ), c( 'height', 'weight' ) ]
```

```
       height weight
1993_A    173     57
1993_C    167     62
```

```r
pulse[ c( "1993_C", "1993_A", "wrong" ), c( 'height', 'weight' ) ]
```

```
       height weight
1993_C    167     62
1993_A    173     57
NA         NA     NA
```

Warning: notice the difference of the class of the output when only a single column is requested:

```r
pulse[ , c( 'height', 'weight' ) ]
```

```
       height weight
1993_A    173     57
1993_B    179     58
1993_C    167     62
1993_D    195     84
1993_E    173     64
1993_F    184     74
1993_G    162     57
1993_H    169     55
1993_I    164     56
1993_J    168     60
1993_K    170     75
1993_L    178     58
1993_M    170     68
1993_N    187     59
1993_O    180     72
1993_P    185    110
1993_Q    170     56
1993_R    180     70
1993_S    166     56
1993_T    155     50
```

```r
class( pulse[ , c( 'height', 'weight' ) ] )
```

```
[1] "data.frame"
```


```r
pulse[ , c( 'weight' ) ]
```

```
 [1]  57  58  62  84  64  74  57  55  56  60  75  58  68  59  72 110  56  70  56
[20]  50
```

```r
class( pulse[ , c( 'weight' ) ] )
```

```
[1] "numeric"
```

Empty index field means "all" rows or columns:

```r
pulse[ , ]
```

```
            name height weight age gender smokes alcohol exercise ran pulse1
1993_A    Bonnie    173     57  18 female     no     yes moderate sat     86
1993_B   Melanie    179     58  19 female     no     yes moderate ran     82
1993_C  Consuelo    167     62  18 female     no     yes     high ran     96
1993_D    Travis    195     84  18   male     no     yes     high sat     71
1993_E     Lauri    173     64  18 female     no     yes      low sat     90
1993_F    George    184     74  22   male     no     yes      low ran     78
1993_G    Cherry    162     57  20 female     no     yes moderate sat     68
1993_H Francesca    169     55  18 female     no     yes moderate sat     71
1993_I     Sonja    164     56  19 female     no     yes     high sat     68
1993_J      Troy    168     60  23   male     no     yes moderate ran     88
1993_K    Roland    170     75  20   male     no     yes     high ran     76
1993_L Frederick    178     58  19   male     no      no      low sat     74
1993_M    Justin    170     68  22   male    yes     yes moderate sat     70
1993_N    Ernest    187     59  18   male     no     yes     high sat     78
1993_O  Salvador    180     72  18   male     no     yes moderate sat     69
1993_P    Mathew    185    110  22   male     no     yes      low sat     77
1993_Q    Leslie    170     56  19   male     no      no      low sat     64
1993_R   Raymond    180     70  18   male     no     yes moderate ran     80
1993_S    Nicole    166     56  21 female    yes      no moderate sat     83
1993_T     Maura    155     50  19 female     no      no moderate sat     78
       pulse2 year
1993_A     88 1993
1993_B    150 1993
1993_C    176 1993
1993_D     73 1993
1993_E     88 1993
1993_F    141 1993
1993_G     72 1993
1993_H     77 1993
1993_I     68 1993
1993_J    150 1993
1993_K     88 1993
1993_L     76 1993
1993_M     71 1993
1993_N     82 1993
1993_O     67 1993
1993_P     73 1993
1993_Q     63 1993
1993_R    146 1993
1993_S     79 1993
1993_T     79 1993
```

```r
pulse[ , c( 'height', 'weight' ) ]
```

```
       height weight
1993_A    173     57
1993_B    179     58
1993_C    167     62
1993_D    195     84
1993_E    173     64
1993_F    184     74
1993_G    162     57
1993_H    169     55
1993_I    164     56
1993_J    168     60
1993_K    170     75
1993_L    178     58
1993_M    170     68
1993_N    187     59
1993_O    180     72
1993_P    185    110
1993_Q    170     56
1993_R    180     70
1993_S    166     56
1993_T    155     50
```

```r
pulse[ c( "1993_C", "1993_A" ), ]
```

```
           name height weight age gender smokes alcohol exercise ran pulse1
1993_C Consuelo    167     62  18 female     no     yes     high ran     96
1993_A   Bonnie    173     57  18 female     no     yes moderate sat     86
       pulse2 year
1993_C    176 1993
1993_A     88 1993
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](03_data_frames.tasks.nocode.html#dataframes), and check your solution(s) [here](03_data_frames.tasks.code.html#dataframes).

- - -
