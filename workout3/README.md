README
================

Overview
--------

`"binomial"` is an R package that provides functions to check whether the inputs are valid, calculate the probability based on given parameters, graph the distribution and display a summary of expected value, variance, etc.

-   `bin_choose()` calculates the number of combinations given number of trials and success
-   `bin_probability()` calculates the probaility of getting k success out of n trials, given probability per trial
-   `bin_distribution()` generates a table with all the possible success and corresponding overall probability, given the number of trials and probability of success per trial
-   `bin_cum()` calculates cumulative probability based on the table with success and probability derived
-   `plot()` gives graphs of data frames derived
-   `bin_variable()` creates a binomial variable
-   `bin_summary()` generates a summary of the binomial variable
-   `bin_mean()` calculates the mean of the binomial distribution
-   `bin_variance()` calculates the variance of the binomial distribution
-   `bin_mode()` calculates the mode of the binomial distribution
-   `bin_skewness()` calculates the skewness the given binomial distribution
-   `bin_kurtosis()` calculates the kurtosis the given binomial distribution

Motivation
----------

This package has been developed to illustrate the mechanism and usage of binomial distribution

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "cointoss" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-HonglingLei/workout3/binomial")

# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-HonglingLei/workout3/binomial", build_vignettes = TRUE)
```

Usage
-----

``` r
library(binomial)

# calculate number of combinations given number of trials and success
bin_choose(n=5,k=2)
#> [1] 10

# calculate the possibility of getting k success out of n trials, given the prob of success per trial
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125

# generate a table with all the possible success and corresponding overall probability
dis1 <- bin_distribution(trials = 5, prob = 0.5)
dis1
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# Calculate cumulative probability by adding up the previous probability based on the table with success and probability we get
bin_cum<- bin_cumulative(trials = 5, prob = 0.5)
bin_cum
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

# Calculate summary measures
bin_mean(10,0.5)
#> [1] 5
bin_variance(10,0.5)
#> [1] 2.5
bin_mode(10,0.5)
#> [1] 5
bin_skewness(10,0.5)
#> [1] 0
bin_kurtosis(10,0.5)
#> [1] -0.2

# Create a binomial variable
bin_var <- bin_variable(trials=5, prob=0.5)
bin_var
#> [1] "Binomial variable"
#> [1] " "
#> [1] "Paramaters"
#> [1] "- number of trials: 5"
#> [1] "- prob of success : 0.5"

# Obtain a summary of the binomial variable
bin_sum <- summary(bin_var)
bin_sum
#> [1] "Summary Binomial"
#> [1] ""
#> [1] "Paramaters"
#> [1] "- number of trials: 5"
#> [1] "- prob of success : 0.5"
#> [1] ""
#> [1] "Measures"
#> [1] "- mean    : 2.5"
#> [1] "- variance: 1.25"
#> [1] "- mode    : 3" "- mode    : 2"
#> [1] "- skewness: 0"
#> [1] "- kurtosis: -0.4"

# If you want to plot graphs of the distribution, you can see more details in vignettes/Introduction.Rmd
```
