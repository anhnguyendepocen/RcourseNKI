---
title: "Good programming practice (GPP)"
author: ''
date: "09 juni 2020"
---







## Goal

- General coding conventions and style 
- User-defined Functions 

## Some general coding conventions 

To improve *readability* and *maintenance* easier:

  - File Names: end in .R
  - Identifiers: FunctionName, variableName, kConstantName
  - Line Length: maximum 70-80 characters
  - Indentation
  - Curly Braces: first on same line, last on own line
  - else: Surround else with braces
  - Assignment: use <-, not =
  - Semicolons: don't use them
  - General layout and ordering  (library, functions, main)
  - Use existing R functions if possible.
  - Write generic parts as functions
  - Inline documentation
  - Record sessionInfo() into project results. 



 
## R functions


```r
intersect
```

```
function (x, y) 
{
    y <- as.vector(y)
    unique(y[match(as.vector(x), y, 0L)])
}
<bytecode: 0x55e0193468a8>
<environment: namespace:base>
```

```r
class
```

```
function (x)  .Primitive("class")
```

```r
typeof
```

```
function (x) 
.Internal(typeof(x))
<bytecode: 0x55e01792b0a0>
<environment: namespace:base>
```


## Running example : GC content



- DNA/RNA are sequences of nucleobases with DNA={A,C,G,T} and RNA={A,C,G,U}
- GC frequency is the proportions of G's and C's in a sequence.


```r
( DNA1 <- paste(sample(c("A", "C", "G", "T"), 20, replace=TRUE), collapse="") )
```

```
[1] "TTCCATGAACTTCGCCCGCT"
```

```r
( RNA1 <- paste(sample(c("A", "C", "G", "U"), 20, replace=TRUE), collapse="") )
```

```
[1] "CCUCUUAUUUGUGGACACCG"
```




```
DNA GC frequency:
```

```
[1] 0.55
```

```
RNA GC frequency:
```

```
[1] 0.5
```


## GC content in a DNA sequence


```r
DNA1
```

```
[1] "TTCCATGAACTTCGCCCGCT"
```

```r
( nucleotides <- unlist(strsplit(DNA1,"")) )
```

```
 [1] "T" "T" "C" "C" "A" "T" "G" "A" "A" "C" "T" "T" "C" "G" "C" "C" "C" "G" "C"
[20] "T"
```

```r
sum(grepl("[CG]", nucleotides))
```

```
[1] 11
```

```r
sum(grepl("[CG]", nucleotides))/nchar(DNA1)
```

```
[1] 0.55
```


## gcFrequency function


```r
gcFrequency <- function(sequence) {
  seqLength   <- nchar(sequence)
  nucleotides <- unlist(strsplit(sequence,""))
  gcCounts    <- sum(grepl("[CG]", nucleotides))
  return(gcCounts/seqLength)
}

DNA1
```

```
[1] "TTCCATGAACTTCGCCCGCT"
```

```r
gcFrequency(DNA1)
```

```
[1] 0.55
```


## Function arguments


```r
( DNA2 <- paste(sample(c("a", "c", "g", "t"), 20, replace=TRUE), collapse="") ) 
```

```
[1] "tgtttggagctttcgcagca"
```

```r
gcFrequency(DNA2)
```

```
[1] 0
```

```r
( DNA3 <- 12345 )
```

```
[1] 12345
```

```r
gcFrequency(DNA3) 
```

```
Error in strsplit(sequence, ""): non-character argument
```

## stop(...)/warning(...)

When to issue:
 
 - **Warnings** : possibility of recovery and no potential harm to the end result
 
 - **Errors**   : no possibility for recovery and potential harm to the end result


```r
stop("your error message !")
```

```
Error in eval(expr, envir, enclos): your error message !
```

```r
warning("your warning message !")
```

```
Warning: your warning message !
```


##  Function argument check


```r
gcFrequency <- function(sequence) {
  sequence    <- as.character(sequence) 
  seqLength   <- nchar(sequence)
  nucleotides <- unlist(strsplit(sequence,""))
  # Check if the sequence is a proper DNA sequence
  if(sum(grepl("[ACGT]", nucleotides)) != nchar(sequence))
    stop(paste("The sequence:", sequence, " is not a DNA sequence !"))
  gcCounts <- sum(grepl("[CG]", nucleotides))
  gcCounts/seqLength
}


DNA1
```

```
[1] "TTCCATGAACTTCGCCCGCT"
```

```r
gcFrequency(DNA1) 
```

```
[1] 0.55
```

```r
DNA2
```

```
[1] "tgtttggagctttcgcagca"
```

```r
gcFrequency(DNA2)
```

```
Error in gcFrequency(DNA2): The sequence: tgtttggagctttcgcagca  is not a DNA sequence !
```

```r
DNA3
```

```
[1] 12345
```

```r
gcFrequency(DNA3)
```

```
Error in gcFrequency(DNA3): The sequence: 12345  is not a DNA sequence !
```

## Function argument check (cont.)


```r
gcFrequency <- function(sequence) {
  # Function 'toupper' coerces objects to character
  SEQUENCE    <- toupper(as.character(sequence))  
  seqLength   <- nchar(SEQUENCE)
  nucleotides <- unlist(strsplit(SEQUENCE,""))
  # Check if the sequence is a proper DNA sequence
  if(sum(grepl("[ACGT]", nucleotides)) != nchar(SEQUENCE))
    stop(paste("The sequence:", sequence, "is not a DNA sequence!"))
  gcCounts <- sum(grepl("[CG]", nucleotides))
  gcCounts/seqLength
}

DNA2 
```

```
[1] "tgtttggagctttcgcagca"
```

```r
gcFrequency(DNA2)
```

```
[1] 0.5
```


## Tasks

  1.  Update `gcFrequency` such that it can handle RNA sequences.
    - RNA sequences contain `Uracil` (U) instead of `Thymine` (T)
  2.  Modify the function, if necessary, so it can distinguish between DNA and RNA. Test it by an invalid input such as :  `uuuatataggguctggctat`. 

















