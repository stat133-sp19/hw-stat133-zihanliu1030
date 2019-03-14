Workout 1
================
Zihan Liu

``` r
library(readr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)
library(jpeg)
library(grid)
shots_data <- read.csv('../data/shots-data.csv')
twoPT_Effective_Shooting <- arrange(
  summarise(
    group_by(shots_data, name),
    total = sum(shot_type == '2PT Field Goal'),
    made = sum((shot_type == '2PT Field Goal' & shot_made_flag == 'shot_yes')),
    perc_made = made/total),
  desc(perc_made)
)
twoPT_Effective_Shooting
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Graymond Green   346   171     0.494

``` r
threePT_Effective_Shooting <- arrange(
  summarise(
    group_by(shots_data, name),
    total = sum(shot_type == '3PT Field Goal'),
    made = sum((shot_type == '3PT Field Goal' & shot_made_flag == 'shot_yes')),
    perc_made = made/total),
  desc(perc_made)
)
threePT_Effective_Shooting
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Graymond Green   232    74     0.319

``` r
Effective_Shooting <- arrange(
  summarise(
    group_by(shots_data, name),
    total = sum((shot_type == '2PT Field Goal' | shot_type == '3PT Field Goal')),
    made = sum(((shot_type == '2PT Field Goal' | shot_type == '3PT Field Goal') & shot_made_flag == 'shot_yes')),
    perc_made = made/total),
  desc(perc_made)
)
Effective_Shooting
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Graymond Green   578   245     0.424

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

*Narrative:*
============
