---
title: "Character string processing & Pattern matching"
date: "10 juni 2020"
---



# Character string processing & Pattern matching

## Learning goals

- Character string manipulation : string concatenation,splitting, etc. 
- Pattern matching and replacement  

## Quotes and escape characters (characters with special meaning)

```
\n  newline                   \v	vertical tab
\r	carriage return           \\	backslash \
\t	tab                       \'	ASCII apostrophe '
\b	backspace                 \"	ASCII quotation mark "
\a	alert (bell)              \`	ASCII grave accent (backtick) `
\f	form feed                 \\.   dot (escaped twice ; special meaning in RE)
```

## Character string

Character string or simply `character`, as it is called in R, is a sequence of characters and a character vector is vector of character strings. 



```r
( cs <- "This is a character string" ) 
```

```
[1] "This is a character string"
```

```r
( cv <- c(cs, "and this is another !") )
```

```
[1] "This is a character string" "and this is another !"     
```

Single and double quotes can be used interchangeably, however, double quotes are preferred.


```r
"string" 
```

```
[1] "string"
```

```r
'string' 
```

```
[1] "string"
```

```r
"'strings'"
```

```
[1] "'strings'"
```

```r
'"string"'   
```

```
[1] "\"string\""
```

Formatting the output with `print` and `cat` functions. The function `print` does more formatting than `cat`. On the other hand `cat` interprets escape characters such as whitespaces [\\t\\n\\r,...], note that the behavior will differ depending on the platform. The function `cat` is useful and often used to print progress and/or debugging information in functions. 


```r
print(1:50)
```

```
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
[26] 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
```

```r
cat(1:50)
```

```
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
```

```r
print("separate\nlines")
```

```
[1] "separate\nlines"
```

```r
cat("separate\nlines") 
```

```
separate
lines
```

```r
cat("column1\tcolumn2") 
```

```
column1	column2
```

Some useful function:


```r
letters
```

```
 [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s"
[20] "t" "u" "v" "w" "x" "y" "z"
```

```r
LETTERS
```

```
 [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S"
[20] "T" "U" "V" "W" "X" "Y" "Z"
```

```r
month.name
```

```
 [1] "January"   "February"  "March"     "April"     "May"       "June"     
 [7] "July"      "August"    "September" "October"   "November"  "December" 
```

```r
month.abb
```

```
 [1] "Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"
```

## paste(..., sep = " ", collapse = NULL) : 

Concatenates one or more vectors into a character vector.  


```r
paste("Bonnie","@", "lumc.nl")
```

```
[1] "Bonnie @ lumc.nl"
```

```r
paste("Travis","@", "lumc.nl", sep="")
```

```
[1] "Travis@lumc.nl"
```

```r
paste("Travis", "lumc.nl", sep="@")
```

```
[1] "Travis@lumc.nl"
```

```r
paste("Travis", 1,"@", "lumc.nl", sep="") # convert numeric to character 
```

```
[1] "Travis1@lumc.nl"
```

```r
paste("Travis","@","lumc.nl",";","Bonnie","@","lumc.nl", sep="")
```

```
[1] "Travis@lumc.nl;Bonnie@lumc.nl"
```

```r
paste(c("Bonnie","Travis"),"@", "lumc.nl", sep="") # recycling 
```

```
[1] "Bonnie@lumc.nl" "Travis@lumc.nl"
```

Recycling occurs in expressions involving multiple vectors of different sizes. The rule is that smaller vectors are recycled, partially if necessary, as often as possible to match the size of the largest vector.



```r
paste(c("Bonnie","Travis"),"@", "lumc.nl", sep="") 
```

```
[1] "Bonnie@lumc.nl" "Travis@lumc.nl"
```

```r
paste(c("Bonnie","Travis"),"@", "lumc.nl", sep="", collapse = ";") 
```

```
[1] "Bonnie@lumc.nl;Travis@lumc.nl"
```

```r
paste(c("Bonnie","Travis"), "lumc.nl", sep="@", collapse = ";")
```

```
[1] "Bonnie@lumc.nl;Travis@lumc.nl"
```



## Pulse data set




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
allNames <- as.vector(pulse$name)
head(allNames)
```

```
[1] "Bonnie"   "Melanie"  "Consuelo" "Travis"   "Lauri"    "George"  
```

```r
length(allNames)
```

```
[1] 110
```

```r
( pulseNames <- sample(allNames, size = 5) ) # select randomly 5 names from allNames
```

```
[1] "Ernest"  "Adeline" "John"    "Crystal" "Erik"   
```

```r
domains <- c("lumc.nl", "leidenuniv.nl", "vumc.nl")
emails  <- paste(pulseNames,domains, sep="@") 
emails
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```

## tolower, toupper, nchar


```r
toupper(emails) # convert to uppercase
```

```
[1] "ERNEST@LUMC.NL"        "ADELINE@LEIDENUNIV.NL" "JOHN@VUMC.NL"         
[4] "CRYSTAL@LUMC.NL"       "ERIK@LEIDENUNIV.NL"   
```

```r
tolower(emails) # convert to lowercase
```

```
[1] "ernest@lumc.nl"        "adeline@leidenuniv.nl" "john@vumc.nl"         
[4] "crystal@lumc.nl"       "erik@leidenuniv.nl"   
```

```r
nchar(emails)   # nr. of characters in string
```

```
[1] 14 21 12 15 18
```



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](character_strings.tasks.nocode.html#characterVectors), and check your solution(s) [here](character_strings.tasks.code.html#characterVectors).

- - -

## Split character string : strsplit(x, split, ...) : 

The `strsplit` function splits each element of the character vector `x` by substring `split` into substrings and returns a list of character vectors as the result.



```r
strsplit("Bonnie@lumc.nl", "@")
```

```
[[1]]
[1] "Bonnie"  "lumc.nl"
```

```r
unlist( strsplit("Bonnie@lumc.nl", "@") )
```

```
[1] "Bonnie"  "lumc.nl"
```

```r
strsplit(c("Bonnie@lumc.nl","Melanie@lumc.nl"), "@")
```

```
[[1]]
[1] "Bonnie"  "lumc.nl"

[[2]]
[1] "Melanie" "lumc.nl"
```

```r
strsplit("Bonnie@lumc.nl", "n")
```

```
[[1]]
[1] "Bo"       ""         "ie@lumc." "l"       
```

```r
strsplit("Bonnie@lumc.nl", "") # useful
```

```
[[1]]
 [1] "B" "o" "n" "n" "i" "e" "@" "l" "u" "m" "c" "." "n" "l"
```

```r
userDomains <- strsplit(emails,"@")
userDomains
```

```
[[1]]
[1] "Ernest"  "lumc.nl"

[[2]]
[1] "Adeline"       "leidenuniv.nl"

[[3]]
[1] "John"    "vumc.nl"

[[4]]
[1] "Crystal" "lumc.nl"

[[5]]
[1] "Erik"          "leidenuniv.nl"
```


## rbind(...), cbind(...) : combine by rows or columns


```r
letters[1:3]
```

```
[1] "a" "b" "c"
```

```r
LETTERS[1:3]
```

```
[1] "A" "B" "C"
```

```r
rbind(letters[1:3], LETTERS[1:3])
```

```
     [,1] [,2] [,3]
[1,] "a"  "b"  "c" 
[2,] "A"  "B"  "C" 
```

```r
cbind(letters[1:3], LETTERS[1:3])
```

```
     [,1] [,2]
[1,] "a"  "A" 
[2,] "b"  "B" 
[3,] "c"  "C" 
```

## strsplit(x, split, ...)



```r
userDomains <- strsplit(emails,"@")
userDomains
```

```
[[1]]
[1] "Ernest"  "lumc.nl"

[[2]]
[1] "Adeline"       "leidenuniv.nl"

[[3]]
[1] "John"    "vumc.nl"

[[4]]
[1] "Crystal" "lumc.nl"

[[5]]
[1] "Erik"          "leidenuniv.nl"
```

```r
rbind(userDomains[[1]],userDomains[[2]],userDomains[[3]],userDomains[[4]],userDomains[[5]])
```

```
     [,1]      [,2]           
[1,] "Ernest"  "lumc.nl"      
[2,] "Adeline" "leidenuniv.nl"
[3,] "John"    "vumc.nl"      
[4,] "Crystal" "lumc.nl"      
[5,] "Erik"    "leidenuniv.nl"
```


## do.call(what, args, ...) : execute function on list of arguments


```r
do.call(rbind, userDomains) # <=>  rbind(userDomains[[1]],userDomains[[2]],...)
```

```
     [,1]      [,2]           
[1,] "Ernest"  "lumc.nl"      
[2,] "Adeline" "leidenuniv.nl"
[3,] "John"    "vumc.nl"      
[4,] "Crystal" "lumc.nl"      
[5,] "Erik"    "leidenuniv.nl"
```



- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](character_strings.tasks.nocode.html#strsplit), and check your solution(s) [here](character_strings.tasks.code.html#strsplit).

- - -

## grep(pattern, x, ignore.case = FALSE, value = FALSE, ... )

Search for matches of `pattern` in strings of character vector `x`.


```r
emails
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```

```r
grep("Dona", emails)
```

```
integer(0)
```

```r
grep("Dona", emails, value = TRUE) 
```

```
character(0)
```

```r
grep("dona", emails, value = TRUE) # case-sensitive
```

```
character(0)
```

```r
grep("dona", emails, value = TRUE, ignore.case = TRUE)
```

```
character(0)
```

```r
grep("dona", emails, value = TRUE, ignore.case = TRUE, invert = TRUE)
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```


## grepl(pattern, x, ignore.case = FALSE, ...) 

Same functionality as `grep` except it returns a logical vector of matches found. 


```r
emails
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```

```r
foundSubject <- grepl("Dona", emails)
foundSubject
```

```
[1] FALSE FALSE FALSE FALSE FALSE
```

```r
emails[foundSubject]       # value
```

```
character(0)
```

```r
emails[ ! foundSubject ]   # invert
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```


## substr(x, start, stop) : extract/replace substrings



```r
substr(x = "abc",start = 1,stop = 1)
```

```
[1] "a"
```

```r
substr("abc",1,nchar("abc"))
```

```
[1] "abc"
```

```r
(abcs <- rep("abc",3))
```

```
[1] "abc" "abc" "abc"
```

```r
substr(abcs,1,1:nchar("abc"))
```

```
[1] "a"   "ab"  "abc"
```

```r
(e <- head(emails))
```

```
[1] "Ernest@lumc.nl"        "Adeline@leidenuniv.nl" "John@vumc.nl"         
[4] "Crystal@lumc.nl"       "Erik@leidenuniv.nl"   
```

```r
substr(e,1,1) 
```

```
[1] "E" "A" "J" "C" "E"
```

```r
tolower(substr(e,1,1))
```

```
[1] "e" "a" "j" "c" "e"
```

```r
substr(e,1,1) <- tolower(substr(e,1,1)) # replace first character with its lowercase
e
```

```
[1] "ernest@lumc.nl"        "adeline@leidenuniv.nl" "john@vumc.nl"         
[4] "crystal@lumc.nl"       "erik@leidenuniv.nl"   
```

## gsub/sub(pattern, replacement, x, ignore.case = FALSE, ...)


```r
sub("@", "(at)", emails)
```

```
[1] "Ernest(at)lumc.nl"        "Adeline(at)leidenuniv.nl"
[3] "John(at)vumc.nl"          "Crystal(at)lumc.nl"      
[5] "Erik(at)leidenuniv.nl"   
```

```r
sub("\\.", "\n", "git.lumc.nl")   # first occurence only 
```

```
[1] "git\nlumc.nl"
```

```r
gsub("\\.", "\n", "git.lumc.nl") # global: apply to all occurrences 
```

```
[1] "git\nlumc\nnl"
```

```r
cat( gsub("\\.", "\n", "git.lumc.nl") )
```

```
git
lumc
nl
```


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](character_strings.tasks.nocode.html#grep), and check your solution(s) [here](character_strings.tasks.code.html#grep).

- - -


## Extra exercises 


- - -

> _Quick task(s)_:
> 
> Solve [the task(s)](character_strings.tasks.nocode.html#extra), and check your solution(s) [here](character_strings.tasks.code.html#extra).

- - -


