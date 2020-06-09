---
title: "Data frames (tasks)"
date: "09 juni 2020"
---



# Explore {#explore}

For the quick exercises we will mostly work with the `survey` data. Let's load them into R.

- Download the data in `survey.txt` and load them into R. Use the script you made!

```r
## survey <- read.delim("data/survey.txt")
```

- How many rows and columns does this data set have?

```r
dim(survey)
```

```
[1] 233  13
```

- Which variables are in the data?

```r
names(survey)
```

```
 [1] "name"     "gender"   "span1"    "span2"    "hand"     "fold"    
 [7] "pulse"    "clap"     "exercise" "smokes"   "height"   "m.i"     
[13] "age"     
```



# Data frame columns {#columns}

In the `survey` data 

- Calculate the difference between spans of the the writing and non-writing hands for each student

```r
diff <- survey$span1 - survey$span2
```

- Add the result of your calculation as a new column to your data set

```r
survey$diff <- diff
```

- What is the minimum age in the data set? Hint: use `min`.

```r
min(survey$age)
```

```
[1] 16.75
```

In the `pulse` data

- BMI is weight in kg divided by the square of height in cm. Add a column BMI for each student. HINT: height is given in `m`.

```r
pulse$BMI <-pulse$weight/(pulse$height/100)^2
```

- (*) Remove the BMI column you have just added to the pulse data.

```r
pulse$BMI <- NULL
```


# Exploring a new data.frame {#newFrame}

The `swiss` data set has demographic data on swiss provinces. It is an example data.frame that is available in R. Just type `swiss` at the prompt to see it.

-	Use the functions View, head and tail to get an overview of the data set

```r
head(swiss)
```

```
             Fertility Agriculture Examination Education Catholic
Courtelary        80.2        17.0          15        12     9.96
Delemont          83.1        45.1           6         9    84.84
Franches-Mnt      92.5        39.7           5         5    93.40
Moutier           85.8        36.5          12         7    33.77
Neuveville        76.9        43.5          17        15     5.16
Porrentruy        76.1        35.3           9         7    90.57
             Infant.Mortality
Courtelary               22.2
Delemont                 22.2
Franches-Mnt             20.2
Moutier                  20.3
Neuveville               20.6
Porrentruy               26.6
```

```r
tail(swiss)
```

```
             Fertility Agriculture Examination Education Catholic
Neuchatel         64.4        17.6          35        32    16.92
Val de Ruz        77.6        37.6          15         7     4.97
ValdeTravers      67.6        18.7          25         7     8.65
V. De Geneve      35.0         1.2          37        53    42.34
Rive Droite       44.7        46.6          16        29    50.43
Rive Gauche       42.8        27.7          22        29    58.33
             Infant.Mortality
Neuchatel                23.0
Val de Ruz               20.0
ValdeTravers             19.5
V. De Geneve             18.0
Rive Droite              18.2
Rive Gauche              19.3
```

- Have a look at the help file. What is this data set about?

```r
?swiss
```

- How many provinces are in this data set?

```r
nrow(swiss)
```

```
[1] 47
```

-	What is the largest percentage of catholics in any of these Swiss provinces? Hint: use `max`

```r
max(swiss$Catholic)
```

```
[1] 100
```

- Find the Fertility of `Lavaux`.

```r
swiss["Lavaux", "Fertility"]
```

```
[1] 65.1
```

- Make a new column in the swiss data that contains the percentage of protestants (100 minus the percentage of catholics)

```r
swiss$Protestant <- 100 - swiss$Catholic
```



