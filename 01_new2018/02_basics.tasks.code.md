---
title: "Basics (tasks)"
date: "09 juni 2020"
---



# First calculations {#firstCalculations}

- Calculate 25 plus the square of 12

```r
25 + 12^2
```

```
[1] 169
```

- What is the square root of the number you have just calculated?

```r
sqrt(25 + 12^2)
```

```
[1] 13
```

- (*) Check what `%%` and `%\%` do when applied to negative numbers. What is the logic here?

```r
-5 %/% 2
```

```
[1] -3
```

```r
-5 %% 2
```

```
[1] 1
```

```r
5 %/% -2
```

```
[1] -3
```

```r
5 %% -2
```

```
[1] -1
```


# First variables {#firstVariables}

- Make a variable that contains your height in m.

```r
height_m <- 1.78
```

- Calculate your height in cm.

```r
height_m/100
```

```
[1] 0.0178
```

- Store the result of the previous calculation as a variable

```r
height_cm <- height_m/100
```


# Making a vector {#exercisesBasics}

Four patients had dietary intakes of 2314, 2178, 1922, 2004 kcalories.

- Make a vector of these four values.

```r
diet_kcal <- c(2314, 2178, 1922, 2004)
```
- Convert these values into in KJ using 1 kca = 4.184 kJ

```r
diet_kJ <- diet_kcal * 4.184
```
- (*) Sort the resulting values using the function `sort`.

```r
sort(diet_kJ)
```

```
[1] 8041.648 8384.736 9112.752 9681.776
```


# Regular sequences

-	Make a vector of all numbers between 1 and 100. Hint: use `:`.

```r
x <- 1:100
```

- Calculate 1+2+3+...+100. Hint: use `sum`.

```r
sum(x)
```

```
[1] 5050
```


# Vectorized calulation

- Degrees Celsius (Cel) can be calculated from degrees Fahrenheit (Fah) as Cel = 5/9 * (Fah - 32). How much is 60 degrees Fahrenheit in Celsius?

```r
5/9 * (60 - 32)
```

```
[1] 15.55556
```

-	Calculate a vector that contains degrees Celsius for 0,1,...,100 degrees Fahrenheit.

```r
Fah <- 1:100
Cel <- 5/9 * (Fah - 32)
```

- From your calculation in the previous exercise, select 10 Fahrenheit in Celcius.

```r
Cel[10]
```

```
[1] -12.22222
```


# (*) Removing variables

- R knows the value of `pi`. Type `pi` to check

```r
pi
```

```
[1] 3.141593
```

- Overwrite pi with a variable of your own 

```r
pi <- 3
pi
```

```
[1] 3
```

- Remove and check that the old pi is available again 

```r
rm(pi)
pi
```

```
[1] 3.141593
```


# (*) Integer division and vectors

- Use `%/%` to make a vector of length 16 with values 1,1,1,1,2,2,2,2,3,...

```r
1:16 %/% 4
```

```
 [1] 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3 4
```

- Use `%%` to make a vector of length 16 with values 1,2,3,4,1,2,3,4,1,...

```r
1:16 %% 4 + 1
```

```
 [1] 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1
```




