---
title: "Extra exercises"
date: "10 juni 2020"
---

# Exercises

The exercises below use various parts of the material seen so far. They are also intended to handle situations we encounter in practice.

## Table and Histogram

The Union of Statistics Undergraduate Students includes many local offices, spread around the world. The local offices regularly organize meetings, with the frequency varying. They Union has made an inventory of all meetings organized. You must analyse this data to answer some of the questions they have.

- Read in the data that contains the overview of meetings: "meetings_locations.txt". Check which and what types of variables it has. What is the total number of meetings?



- The location given is that of a meeting that took place. How many locations have held a meeting a single time? Tip: tabulate the table of locations.



- To get an idea about the typical number of participants, make a histogram. For this, the number of participants should be a numeric variable, but it is not - you may check that it is not possible to make a histogram with the variable as it now is. The reason for this is that some values are actually characters ("combined") and, while reading in the file, R stores this variable as a factor. This stands for a code to indicate that the meeting was held in combination with other meetings, and somehow the organizers could not evaluate the number of participants of their meeting only. In order to be able to work with this variable, we need to transform it to numeric. To do so, first change values that are not naturally numeric to NA. Then transform it to numeric by first transforming it to character, and only then to numeric. Compare this transformed variable with one where the step of transforming to character is skipped. Do you see a difference? Why do you think they are different?



- The Union also wants to have an overview of the number of meetings per year. For this, first make a table of the number of meetings per year. Then make a bar plot using this table as input (Hint: use the function barplot() ). Change the  labels on the x-axis so that they are visible (Hint:  display them vertically using the slot "las" of the function par() ).



## Using `apply`

The Puromycin data has enzyme reaction velocities under different concentrations and different treatments. There are two measurements per concentration/treatment combination. We want to summarize the results in a table that gives the average of the two measurements for every combination of concentration and treatment.

- Note that the second argument of tapply may be a list, so that we can summarize by two or more variables simultaneously. Make a list containing the two variables conc and state.



- Use tapply() to make the summarizing table.



##  Apply and functions

The OrchardSprays dataset has a so-called Latin Square design. This means that a field is divided into regular subfields by rows and columns, and that every row and column position is used exactly once for each treatment (like in a Sudoku).

- Find the row positions corresponding to treatment A.



- Does every measurement for treatment A have a different row position? Hint: use duplicated.



- Turn your check for treatment A into a function, and use that function to repeat the same check for treatment B.



- Check the same for all other treatments. Hint: use sapply and LETTERS.



- We will now visualize the Latin square design. Make a matrix of 8 rows and 8 columns, with entries of the matrix giving the treatment used in that row and column. Hint: make sure the data matrix is ordered first by column and then by row (use order), and use the command matrix.



- Display the measured decrease values in their proper location in the Latin Square.



## Read.table

The file tweedekamer.txt contains historical data on numbers of parliament seats of parties in the Dutch parliament from 1956 to the present. Download the file to your computer.

- Find out what the current working directory of your R session is. Hint: use getwd.



-	Set the current working directory to the location where you downloaded the file tweedekamer.txt.



-	Use read.table to read the file tweedekamer2012.txt. Make sure you set the argument quote="".



-	Check whether row and column names have been read correctly. Hint: use head. If necessary, adjust the arguments of read.table. Hint: look at check.names.



- How many parties and how many elections are in the data? Hint: use dim.



-	Try reading the file without using quote="". Find out what goes wrong by using read.table with the argument fill=TRUE.



-	Write the result to an R-readable .RData file using save.



## Logical vectors, rowSums and apply

Load the tweedekamer2012.txt data set again using read.table or load.

-	Convert the data.frame into a matrix.



-	Create a numeric election year variable from the column names of your matrix. Hint: use as.numeric.



-	Calculate the number of parties represented in parliament after each election, and plot this number as a function of time as a line plot. Hint: Use colSums and logicals.



-	Make the same plot as a barplot. Make the labels perpendicular to the axis for readability. Hint: see las in ?par.



-	Find the names of all parties that have (so far) only been present in a single parliament.



-	Find the name of the largest party in each parliament.



-	Plot the number of seats of the largest party as a function of time in a barplot. Color the bars by the name of the largest party, and make a proper legend.




## Combining information from multiple tables

Load the data set politics2012.RData, with information on parliament and cabinets in the Netherlands since 1956. Part of this data you have already seen. 

- Check which objects this file contains by using the function show() with argument "load("politics2012.RData")". Then load the file.



-  How many prime ministers have there been, and how many different parties have they come from? Hint: use unique.



- Make a list of character vectors out of the coalition variable using strsplit(). Give this list the names of the cabinets.



- Make a barplot of the number of coalition partners as a function of time.



- The parliament variable in the cabinet data.frame gives the election year of the active parliament and the time of the cabinet and links the cabinet data.frame to the parliament data. Find the vector of distribution of parliament seats at the time of the Biesheuvel I cabinet.



- Find the largest party in parliament at the time of the Biesheuvel I cabinet.



- Turn your code for the previous exercise into a function, and calculate the largest party in parliament at the time of the cabinet for each cabinet.



- How often was the prime minister a member of the largest party in parliament?



- How many seats in parliament did the parties in the Biesheuvel I cabinet have in total? Hint: use %in%.



- Turn your code for the previous question into a function, calculate the number of coalition seats for every cabinet, and display the result in a barplot.



