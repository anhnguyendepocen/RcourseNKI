---
title: "Data frames (tasks)"
date: "10 juni 2020"
---



# Data frames (tasks)

## Tasks

### Reading a different format

#### Primary tasks

- Load the `pulse.csv` file into the `d` variable. Display the structure of `d` and the first few rows.

```r
d <- read.csv( "data/pulse.csv" );
```

```
# To get 'pulse.csv' directly from the server, use:
# d <- read.csv( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/pulse.csv" ) )
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

```r
head( d )
```

```
      id     name height weight age gender smokes alcohol exercise ran pulse1
1 1993_A   Bonnie    173     57  18 female     no     yes moderate sat     86
2 1993_B  Melanie    179     58  19 female     no     yes moderate ran     82
3 1993_C Consuelo    167     62  18 female     no     yes     high ran     96
4 1993_D   Travis    195     84  18   male     no     yes     high sat     71
5 1993_E    Lauri    173     64  18 female     no     yes      low sat     90
6 1993_F   George    184     74  22   male     no     yes      low ran     78
  pulse2 year
1     88 1993
2    150 1993
3    176 1993
4     73 1993
5     88 1993
6    141 1993
```

- Random sampling of rows:
    - Sample randomly 10 rows from table `d`. 
    - First create a variable `rows` which will contain the row numbers.
    - Show selected rows.

```r
rows <- sample( 1:nrow( d ), 10 )
d[ rows, ]
```

```
        id        name height weight age gender smokes alcohol exercise ran
74  1997_E    Julianne    165   48.0  19 female     no      no      low sat
15  1993_O    Salvador    180   72.0  18   male     no     yes moderate sat
87  1997_R Christopher    194   95.0  18   male     no     yes moderate ran
91  1997_V        Ross    175   78.5  19   male     no     yes      low ran
71  1997_B       Ralph    186   87.0  23   male     no     yes     high ran
40  1995_N       Tisha    155   49.0  18 female     no     yes moderate sat
88  1997_S       Perry    189   88.0  45   male     no      no moderate sat
89  1997_T       Maude    162   50.0  19 female     no     yes moderate ran
42  1995_P       Peter    178   63.0  23   male     no     yes      low sat
106 1998_N      Lizzie     93   27.0  19 female     no      no      low sat
    pulse1 pulse2 year
74      83     84 1997
15      69     67 1993
87      84    140 1997
91      85    131 1997
71      49     83 1997
40     104     92 1995
88      74     72 1997
89      90    160 1997
42      84     90 1995
106    119    120 1998
```

- Sorting (ordering) a table (by multiple keys):
    - Use `View( d )` to visualize the `d` data frame.
    - Understand: `rows <- order( d$age )`. Use `View` to visualize `d[ rows, ]`.
    - Understand: `rows <- order( d$age, d$weight )`. Use `View` to visualize `d[ rows, ]`.
    - Finally: display only columns `name`, `age` and `weight` of sorted `d`.
    - Note: for clarity, the solutions use only random 10 rows of `d`.

```r
set.seed( 1000 ) # for reproducible generation of random numbers
rows <- sample( 1:nrow( d ), 10 )
dd <- d[ rows, ]
dd
```

```
       id    name height weight age gender smokes alcohol exercise ran pulse1
68 1996_T  Robert    180     80  21   male     no     yes moderate sat     80
43 1995_Q  Lester    184     65  21   male    yes      no moderate sat     65
86 1997_Q   Lance    192    105  21   male     no      no moderate sat     80
51 1996_C Adeline    157     41  20 female     no      no moderate ran     70
88 1997_S   Perry    189     88  45   male     no      no moderate sat     74
29 1995_C   Oscar    189     60  19   male     no     yes moderate ran     78
99 1998_G  Ursula    155     55  20 female     no     yes     high sat     82
61 1996_M  Taylor    180     77  18 female     no      no moderate ran     47
18 1993_R Raymond    180     70  18   male     no     yes moderate ran     80
22 1993_V  Arlene    140     50  34 female     no      no      low ran     70
   pulse2 year
68     80 1996
43     67 1995
86     73 1997
51     95 1996
88     72 1997
29    168 1995
99     87 1998
61    136 1996
18    146 1993
22     98 1993
```

```r
rows <- order( dd$age )
dd[ rows, ]
```

```
       id    name height weight age gender smokes alcohol exercise ran pulse1
61 1996_M  Taylor    180     77  18 female     no      no moderate ran     47
18 1993_R Raymond    180     70  18   male     no     yes moderate ran     80
29 1995_C   Oscar    189     60  19   male     no     yes moderate ran     78
51 1996_C Adeline    157     41  20 female     no      no moderate ran     70
99 1998_G  Ursula    155     55  20 female     no     yes     high sat     82
68 1996_T  Robert    180     80  21   male     no     yes moderate sat     80
43 1995_Q  Lester    184     65  21   male    yes      no moderate sat     65
86 1997_Q   Lance    192    105  21   male     no      no moderate sat     80
22 1993_V  Arlene    140     50  34 female     no      no      low ran     70
88 1997_S   Perry    189     88  45   male     no      no moderate sat     74
   pulse2 year
61    136 1996
18    146 1993
29    168 1995
51     95 1996
99     87 1998
68     80 1996
43     67 1995
86     73 1997
22     98 1993
88     72 1997
```

```r
rows <- order( dd$age, dd$weight )
dd[ rows, ]
```

```
       id    name height weight age gender smokes alcohol exercise ran pulse1
18 1993_R Raymond    180     70  18   male     no     yes moderate ran     80
61 1996_M  Taylor    180     77  18 female     no      no moderate ran     47
29 1995_C   Oscar    189     60  19   male     no     yes moderate ran     78
51 1996_C Adeline    157     41  20 female     no      no moderate ran     70
99 1998_G  Ursula    155     55  20 female     no     yes     high sat     82
43 1995_Q  Lester    184     65  21   male    yes      no moderate sat     65
68 1996_T  Robert    180     80  21   male     no     yes moderate sat     80
86 1997_Q   Lance    192    105  21   male     no      no moderate sat     80
22 1993_V  Arlene    140     50  34 female     no      no      low ran     70
88 1997_S   Perry    189     88  45   male     no      no moderate sat     74
   pulse2 year
18    146 1993
61    136 1996
29    168 1995
51     95 1996
99     87 1998
43     67 1995
68     80 1996
86     73 1997
22     98 1993
88     72 1997
```

```r
dd[ rows, c( "name", "age", "weight" ) ]
```

```
      name age weight
18 Raymond  18     70
61  Taylor  18     77
29   Oscar  19     60
51 Adeline  20     41
99  Ursula  20     55
43  Lester  21     65
68  Robert  21     80
86   Lance  21    105
22  Arlene  34     50
88   Perry  45     88
```

- Selecting rows by a logical condition.
    - Goal: select rows with males of weight range 60-80
    - Build a logical vector `isMale` stating whether a row describes a male
    - Build a logical vector `isInWeightRange` stating whether a row describes a person with weight between 60 and 80
    - Select rows which are `isMale & isInWeightRange`
    - Note: for clarity, the solutions use only random 10 rows of `d`.

```r
set.seed( 1000 ) # for reproducible generation of random numbers
rows <- sample( 1:nrow( d ), 10 )
dd <- d[ rows, ]
isMale <- dd$gender == "male"
isMale
```

```
 [1]  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE
```

```r
isInWeightRange <- dd$weight >= 60 & dd$weight <= 80
isInWeightRange
```

```
 [1]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
```

```r
isMale & isInWeightRange
```

```
 [1]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
```

```r
dd[ isMale & isInWeightRange, ]
```

```
       id    name height weight age gender smokes alcohol exercise ran pulse1
68 1996_T  Robert    180     80  21   male     no     yes moderate sat     80
43 1995_Q  Lester    184     65  21   male    yes      no moderate sat     65
29 1995_C   Oscar    189     60  19   male     no     yes moderate ran     78
18 1993_R Raymond    180     70  18   male     no     yes moderate ran     80
   pulse2 year
68     80 1996
43     67 1995
29    168 1995
18    146 1993
```

#### Extra tasks

- Enforce a data frame type.
    - Observe below, that `d[ ,cols ]` might sometimes return a vector, and sometimes return a data frame.
    - Adding `drop = FALSE` argument enforces returning a data frame object.

```r
cols <- c( "weight", "height" )
class( d[ , cols ] )
```

```
[1] "data.frame"
```

```r
cols <- c( "weight" )
class( d[ , cols ] )
```

```
[1] "numeric"
```

```r
cols <- c( "weight" )
class( d[ , cols, drop = FALSE ] )
```

```
[1] "data.frame"
```

