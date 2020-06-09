---
title: "Projects and scripts"
date: "09 juni 2020"
---



# Projects and scripts

## Projects

We are going to read our first data set into R. To structure this, we are going to make a `project`.

### Opening a new project

Choose File...New project...New directory... and create a new folder on your computer for this R course.

Projects are a feature of RStudio to organize all files and scripts that you need for a single project and to keep them separate from other projects. From now on in this course you are going to work within the new R course project you created.

Look top right in the RStudio window to check which project you are working in. There, you can also switch between projects.

RStudio has created a `.Rproj` file for you that you can use to open Rstudio. You end up in the right project immediately.


### Creating a folder

In our new project we are going to create a folder that contains our data sets

Choose the files tab and click `new folder` to create a `data` folder, or type at the prompt


```r
dir.create('data')
```

From the course webpage, download the data set `pulse.txt` from the course webpage and store them in the new data folder you created.

Check in Rstudio that the files are indeed in the right folder.

### Quick exercise

- Close RStudio and open it again. Make sure you are in the right project.

## Reading data

Now we can read data into R. 

### Reading tab-delimited text

The file `pulse.txt` is a tab-delimited text file. We can read it into R with 


```
# To get 'pulse.txt' directly from the server, use:
# pulse <- read.table( url( "https://github.com/rxmenezes/RcourseNKI/tree/master/data/pulse.txt" ), header = TRUE, sep = "\t" )
```

```r
pulse <- read.delim( "data/pulse.txt" )
```

We added `data/` because the file is in the data subfolder we just created.

Note that we assigned `<-` the result of `read.delim` to `pulse`. We have given our dataset the name `pulse`.

### View

To check that you've read the data correctly 


```r
View(pulse)
```

Note the capital V.


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](03_projects_and_scripts.tasks.nocode.html#firstLoad), and check your solution(s) [here](03_projects_and_scripts.tasks.code.html#firstLoad).

- - -

## Scripts

So far we have been typing at the prompt. What we type at the prompt is executed and lost. Using scripts allows repeating things and make our results reproducible.

### Making a script

We will open an R  script File...New file...R script. An R script is just a text editor. Type some R code into the script


```r
2^6
14+15
3-4
```

We can `run` (Ctrl+Enter) part of this code by sending it to the prompt. Check what happens if we run when

- The cursor is in a line
- We made a bock of several lines
- We made a block of part of a line

We can `source` to run the whole script.

We can save a script. Use the `.R` extension.

### Using a script

The script should contain the analysis you want to reproduce later.

Type at the prompt only to try things out.

To check that the script works, close RStudio and open again. Run the script.

More advanced way of working with scripts: R markdown (later in the course)


### Comments

R ignores everyting in a line after `#`. Use to put human readable text in your scripts (explanation).



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](03_projects_and_scripts.tasks.nocode.html#firstScript), and check your solution(s) [here](03_projects_and_scripts.tasks.code.html#firstScript).

- - -
