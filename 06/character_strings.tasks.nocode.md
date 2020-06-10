---
title: "Character strings & Pattern matching (tasks)"
date: "10 juni 2020"
---



# Character strings & Pattern matching (tasks)

## Tasks

### concatenation {#characterVectors}

The `survey` data is used throughout the exercises.


```r
#survey <- read.delim("https://barmsijs.lumc.nl/R_course/data/survey.txt") 
survey <- read.delim("../data/survey.txt")
# Use subject names (column name) in survey data set
surveyNames <- as.vector(survey$name)
# Domain names
domains    <- c("lumc.nl", "leidenuniv.nl", "vumc.nl")
```


1. Generate a vector of e-mail addresses `@leidenuniv.nl` for all names in `surveyNames`.  



2. Mailing list: create a single string with all e-mail addresses separated by ';'. 



3. Create a mailing list of all names randomly assigned to `domains` (hint: let recycling do the semi-random selection.) 




4. Predict the output for the following statements, note that paste0(...) <=> paste(...,sep="") and rev(x) reverses `x`: 


```r
paste(c("a","b"),"c",letters[1:3], sep="")
paste0(paste0(letters[19:20],collapse = ""),"a", paste0(rev(letters[19:20]), collapse = ""))
```

5. Plot a histogram of name lengths. (hint: ?hist, ?nchar)



### strsplit {#strsplit}

1. Recreate the vector of e-mail addresses  from the *mailingList* ( previous exercise (paste: nr.3) ) using `strsplit(...)` function.



2. Given the vector of e-mail addresses just obtained retrieve the user names only (hint: ?do.call.)



3. Create a frequency table of the number of users per domain (hint ?`table`).



### grep/grepl/sub {#grep}

1. Create a list with elements 'lumc', 'leidenuniv' and 'vumc' containing  the corresponding e-mails using the vector `emails` from concatenation (1.1.1) exercise 3. 



2. Create a mailing-list (semi-colon separated) with all user names containing pattern 'in'. 




3. Find the most popular letter which names start with.



4. Find the names that start with the most popular first letter you found in the previous exercise. (*)



## Extra exercises {#extra}

1. Find the names that end with the most popular last character of all names.



2. In the vector of e-mail addresses . 

Swap students between the two domains `lumc.nl` and `vumc.nl`. 



3. Some names are duplicated in the survey data set. Create a unique vector of e-mail addresses for these duplicated names by number suffixes, e.g. Barbra1, Barbra2 etc. 



4. Find top (most frequent) name initial for males and females.




5. Order survey table by `name` character length (?order).




