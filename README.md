-   [Using R for data analysis](#using-r-for-data-analysis)
    -   [Teachers](#teachers)
    -   [Goals & Topics](#goals-topics)
    -   [Prerequisites](#prerequisites)
    -   [Materials](#materials)
    -   [Programme](#programme)
        -   [First NKI edition, June 15th, 16th, 18th
            2020](#first-nki-edition-june-15th-16th-18th-2020)
    -   [Slots](#slots)
    -   [Useful links](#useful-links)

Using R for data analysis
=========================

[R](https://www.r-project.org/) is an open-source, free environment for
statistical computing and graphics. It provides a large repository of
statistical analysis methods, both classic and new. However, R has a
steep learning curve, due partly to its using a command-line type of
user interface, rather than the usual pull-down menus. The course aims
at helping researchers climb this curve, enabling them to perform basic
data analysis and graphic displays at the end of the course, as well as
giving a platform from which they can deepen their R knowledge later on
if necessary.

Teachers
--------

-   [Renee Menezes](http://www.bigstatistics.nl/renee), Biostatistics
    Unit, NKI (**coordinator**)
-   Renaud Tissier, Biostatistics Unit, NKI
-   Miriam Haaksma, PSOE, NKI

Goals & Topics
--------------

After the course you will be able to:

-   understand and write simple R scripts
-   use R to perform simple statistical analyses of your own data
-   use and adapt R scripts and functions
-   generate analysis reports from your own data in html format

We will cover the following topics:

-   R expressions
-   R data objects (vectors (arrays), data frames (tables), lists)
    creation and usage
-   [R Markdown](http://rmarkdown.rstudio.com/) for building
    reproducible reports \[[cheat
    sheet](http://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)\]
-   R functions for descriptive statistics and linear model fitting; R
    formula objects
-   histograms, scatter plots, boxplots (in basic R)

Prerequisites
-------------

The course assumes no prior programming knowledge. Elementary statistics
knowledge is necessary.

Participants must **bring own laptops** capable of running
[RStudio](https://www.rstudio.com/products/rstudio/).

Before the course **please prepare your laptop**:

1.  install [R](https://www.r-project.org/), an open-source, free
    environment for statistical computing and graphics. You can find
    instructions for downloading and installing it from one of the CRAN
    mirrors, for example from the [Univ. of
    Gent](https://lib.ugent.be/CRAN/) or from the [Imperial
    College](https://cran.ma.imperial.ac.uk/). A full list of mirrors
    can be found [here](https://cran.r-project.org/mirrors.html).

2.  install RStudio. Go to [the RStudio download
    page](https://www.rstudio.com/products/rstudio/download/#download),
    select a version of RStudio appropriate for your laptop, download it
    and then install. Please check whether you can start RStudio.

3.  install [RMarkdown](https://rmarkdown.rstudio.com/), a very nice and
    easy tool to produce reports using RStudio. It is made available as
    an R package for Rstudio. One easy way to install it is as follows:

<!-- -->

1.  open RStudio

2.  click on the “File” menu on the top left, and choose “New
    file”&gt;“R Markdown”. If RMarkdown is not yet installed on your
    machine, this will prompt you to install it and any packages
    required. Just follow the instructions that appear on the screen.

<!-- -->

1.  download the course materials [.zip
    file](https://github.com/rxmenezes/RcourseNKI/R_course.zip) (see
    below) to your laptop. Unpack the zip file to a directory, and
    please check whether you can open `index.html` file from the
    directory.

Materials
---------

After the course material .zip file is downloaded, the course material
can be assessed:

-   as HTML pages by opening `index.html` in any browser
-   by clicking on the `RcourseNKI.Rproj` file, which will open the
    entire course as an R project
-   via [the course source git
    repository](https://github.com/rxmenezes/RcourseNKI)

The materials contain a [`data`
directory](https://github.com/rxmenezes/RcourseNKI/tree/master/data)
with the **data** **files** used in the presentations/tasks. The
directory can be also accessed at
<a href="https://github.com/rxmenezes/RcourseNKI/tree/master/data" class="uri">https://github.com/rxmenezes/RcourseNKI/tree/master/data</a>

Programme
---------

### First NKI edition, June 15th, 16th, 18th 2020

This course will be given online via Zoom. All course days are in the
period 9:00-16:00, with the last hour reserved for general Q&A.

Slots
-----

-   Slot 1, Basics of R:
    -   [Course data sets](01_new2018/00_datasets.html)
    -   [Introduction](01_new2018/01_introduction.html)
    -   [Basics](01_new2018/02_basics.html)
        \[[tasks](01_new2018/02_basics.tasks.nocode.html)\]
        \[[solutions](01_new2018/02_basics.tasks.code.html)\]
    -   [Projects and scripts](01_new2018/03_projects_and_scripts.html)
        \[[tasks](01_new2018/03_projects_and_scripts.tasks.nocode.html)\]
        \[[solutions](01_new2018/03_projects_and_scripts.tasks.code.html)\]
    -   [Data frames (basics)](01_new2018/04_dataframes.html)
        \[[tasks](01_new2018/04_dataframes.tasks.nocode.html)\]
        \[[solutions](01_new2018/04_dataframes.tasks.code.html)\]
    -   [Basic data types](01_new2018/05_character_factor_basics.html)
        \[[tasks](01_new2018/05_character_factor_basics.tasks.nocode.html)\]
        \[[solutions](01_new2018/05_character_factor_basics.tasks.code.html)\]
    -   [Functions and help files](01_new2018/06_help.html)
        \[[tasks](01_new2018/06_help.tasks.nocode.html)\]
        \[[solutions](01_new2018/06_help.tasks.code.html)\]
-   Slot 2, Data types, part 1:
    -   [Basic data types
        (cont.)](02_new2018/01_basic_data_types_cont.html)
        \[[tasks](02_new2018/01_basic_data_types_cont.tasks.nocode.html)\]
        \[[solutions](02_new2018/01_basic_data_types_cont.tasks.code.html)\]
    -   [Selecting/indexing/subsetting](02_new2018/02_selecting.html)
        \[[tasks](02_new2018/02_selecting.tasks.nocode.html)\]
        \[[solutions](02_new2018/02_selecting.tasks.code.html)\]
    -   [Data frames (cont.)](02_new2018/03_data_frames.html)
        \[[tasks](02_new2018/03_data_frames.tasks.nocode.html)\]
        \[[solutions](02_new2018/03_data_frames.tasks.code.html)\]
    -   [Matrices](02_new2018/05_matrices.html)
        \[[tasks](02_new2018/05_matrices.tasks.nocode.html)\]
        \[[solutions](02_new2018/05_matrices.tasks.code.html)\]
-   Slot 3, Data types, part 2:
    -   [Combining text, scripts and output:
        RMarkdown](03_new2018/02_rmarkdown.html)
        \[[tasks](03_new2018/02_rmarkdown.tasks.nocode.html)\]
        \[[solutions](03_new2018/02_rmarkdown.tasks.code.html)\]
    -   [Lists](03_new2018/01_lists.html)
        \[[tasks](03_new2018/01_lists.tasks.nocode.html)\]
        \[[solutions](03_new2018/01_lists.tasks.code.html)\]
    -   [Basic statistical tests](03_new2018/02_S3_objects.html)
        \[[tasks](03_new2018/02_S3_objects.tasks.nocode.html)\]
        \[[solutions](03_new2018/02_S3_objects.tasks.code.html)\]
    -   [Regression and formula objects](03_new2018/03_regression.html)
        \[[tasks](03_new2018/03_regression.tasks.nocode.html)\]
        \[[solutions](03_new2018/03_regression.tasks.code.html)\]
    -   [Factors (advanced)](03_new2018/04_advanced_factors.html)
        \[[tasks](03_new2018/04_advanced_factors.tasks.nocode.html)\]
        \[[solutions](03_new2018/04_advanced_factors.tasks.code.html)\]
-   slot 4:
    -   [Control flow and user-defined
        functions](https://github.com/rxmenezes/RcourseNKI/04_new2018/01_userDefinedFunctions.html)
        \[[tasks](https://github.com/rxmenezes/RcourseNKI/04_new2018/01_userDefinedFunctions.tasks.nocode.html)\]
        \[[solutions](https://github.com/rxmenezes/RcourseNKI/04_new2018/01_userDefinedFunctions.tasks.code.html)\]
-   slot 5:
    -   [Character string processing & Pattern
        matching](https://github.com/rxmenezes/RcourseNKI/06/character_strings.html)
        \[[tasks](https://github.com/rxmenezes/RcourseNKI/06/character_strings.tasks.nocode.html)\]
        \[[solutions](https://github.com/rxmenezes/RcourseNKI/06/character_strings.tasks.code.html)\]
    -   [S3 and S4
        classes](https://github.com/rxmenezes/RcourseNKI/08/s3s4.html)
        \[[tasks](https://github.com/rxmenezes/RcourseNKI/08/s3s4.tasks.nocode.html)\]
        \[[solutions](https://github.com/rxmenezes/RcourseNKI/08/s3s4.tasks.code.html)\]
-   slot 6:
    -   [Making errors the right
        way](https://github.com/rxmenezes/RcourseNKI/05.renee/03_makingErrors.html)
    -   Reproducible research

<!-- - [Regression](https://github.com/rxmenezes/RcourseNKI/07.2017/01_regression.html)
        [[tasks](https://github.com/rxmenezes/RcourseNKI/07.2017/01_regression.tasks.nocode.html)]
        [[solutions](https://github.com/rxmenezes/RcourseNKI/07.2017/01_regression.tasks.code.html)] 
    - [[Extra exercises](https://github.com/rxmenezes/RcourseNKI/07.2017/02_plenty.tasks.nocode.html)]
        [[solutions](https://github.com/rxmenezes/RcourseNKI/07.2017/02_plenty.tasks.code.html)] -->
Useful links
------------

-   [R for Data Science](http://r4ds.had.co.nz/)
-   [RStudio Cheat
    Sheets](https://www.rstudio.com/resources/cheatsheets/)
-   [LUMC Git course](https://git.lumc.nl/courses/gitcourse)
-   [A curated list of R tutorials for Data Science, NLP and Machine
    Learning](https://github.com/ujjwalkarn/DataScienceR)
-   [Great R packages for data import, wrangling and
    visualization](http://www.computerworld.com/article/2921176/business-intelligence/great-r-packages-for-data-import-wrangling-visualization.html)
-   [ggplot2: great R package for beautiful plots - cheat
    sheet](http://www.rstudio.com/wp-content/uploads/2015/12/ggplot2-cheatsheet-2.0.pdf)
