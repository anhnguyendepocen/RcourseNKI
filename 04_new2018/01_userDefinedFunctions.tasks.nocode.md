---
title: "User-defined functions and control flow (tasks)"
date: "09 juni 2020"
---





# User-defined functions and control flow (tasks)

## Tasks

### functions (0) {#functions0}

- Write the function `even` which tests whether a number is even.



- Write an alternative version of function `even` using `odd` function.




- Write a function, given values `x` and `m`, that tests whether `x` is integer divisible by `m`.





- There are two systems for weight and height measurements, metric (cm,kg) and imperial (inch,lbs). The relation between the measurements in different systems is  (1 kg = 2.2 lbs) and  (1 inch = 2.54 cm). Write the following unit conversion functions:
    - cm2meter : convert cm to meter
    - lbs2kg   : convert weight unit pound to kg
    - inch2cm  : convert inch to cm


```r
# examples:
> inch2cm(70)
[1] 177.8
> lbs2kg(10)
[1] 4.545455
> cm2m(190)
[1] 1.9
```



- (*) Generate the following sequence:


```
 [1]  7 14 21 28 35 42 49 56 63 70 77 84 91 98
```




### functions (1) {#functions1}


  - The following table is a BMI classification. Write a function to determine 
the classification given a BMI value.

<center>
<table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
<thead>
<tr>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey;'> </th>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>classification</th>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>bmi</th>
</tr>
</thead>
<tbody>
<tr>
<td style='text-align: left;'>1</td>
<td style='text-align: center;'>underweight</td>
<td style='text-align: center;'><18.5</td>
</tr>
<tr style='background-color: #f7f7f7;'>
<td style='background-color: #f7f7f7; text-align: left;'>2</td>
<td style='background-color: #f7f7f7; text-align: center;'>normal</td>
<td style='background-color: #f7f7f7; text-align: center;'>18.5-24.9</td>
</tr>
<tr>
<td style='text-align: left;'>3</td>
<td style='text-align: center;'>overweight</td>
<td style='text-align: center;'>25-29.9</td>
</tr>
<tr style='background-color: #f7f7f7;'>
<td style='background-color: #f7f7f7; border-bottom: 2px solid grey; text-align: left;'>4</td>
<td style='background-color: #f7f7f7; border-bottom: 2px solid grey; text-align: center;'>obese</td>
<td style='background-color: #f7f7f7; border-bottom: 2px solid grey; text-align: center;'>\>30</td>
</tr>
</tbody>
</table>
</center>




```r
bmiClass <- function(bmi) {
  # Clissifies BMI value given as argument into categories:
  #
  #         {"underweight","normal","overweight","obese"}
  #
  # your code: 
  ...
}  
# examples:
> bmiClass(19)
[1] "normal"
> bmiClass(29.9)
[1] "overweight"
> bmiClass(30)
[1] "obese"
```




  
  
  

### functions (2)  {#functions}

  - Write a function calculating BMI with arguments weight(kg) and height(cm). BMI in the metric system is defined as weight/(height^2) with weight and height in units of kilogram (kg) and meter (m). Use `cm2m` function from previous exercise.   



  - Upgrade the functions `lbs2kg` and `inch2cm` as such that the conversions can be applied in the opposite direction. You can do this by adding an additional logical argument `invert`  to the function with the default value set to FALSE. For example a call like:
  
  

```r
lbs2kg(65, invert=TRUE) # convert kg to lbs
```

will reverse the conversion from kg to lbs. 



  
  - (*) Update BMI function with an additional logical argument `imperial` with the default value set to FALSE. The function will accept both systems of measurements (metric and imperial). Use the `imperial` argument in the function as a condition to convert imperial measurement to metric when the input values are in imperial. The function can be called  with values for `weight` and `height` in metric system (kg,cm) or imperial (lbs,inch).

  



### apply {#apply}

  - Calculate the mean age and height in survey data using apply function. Note that there are missing data (hint: see na.rm argument to mean). 
  


  - In the previous exercise we removed the missing values per variable. A more fair solution would be to remove the observation completely where one or both variables are missing. Hint : ?complete.cases
  
  


  
  - (*) Upgrade bmiClass function in the previous exercises to process a vector of BMI values. 
 



### function argument check {#argcheck}




  - Update the function bmiClass as such to error on wrong input type, e.g.


```r
bmiClass("a")
```

```
Error in bmiClass("a"): could not find function "bmiClass"
```
  
### Extra exercises {#extra}

  - Update survey data with a new variable `heightInch` with height in inch units (use sapply).


  
  - Update the pulse data with `BMI` variable using the *bmi* function (use apply).



  - Update the pulse data with BMI category variable `bmiClass` using the *bmiClass* function 
  from previous exercise (use sapply).
  


  
  
