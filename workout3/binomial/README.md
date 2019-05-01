## Overview

`"binomial"` is an R package 
that provides functions to check whether the inputs are valid, calculate the probability based on given parameters, graph the distribution and display a summary of expected value, variance, etc.

* `bin_choose()` calculates the number of combinations given number of trials and success
* `bin_probability()` calculates the probaility of getting k success out of n trials, given probability per trial
* `bin_distribution()` generates a table with all the possible success and corresponding overall probability, given the number of trials and probability of success per trial
* `bin_cum()` calculates cumulative probability based on the table with success and probability derived
* `plot()` gives graphs of data frames derived
* `bin_variable()` creates a binomial variable
* `bin_summary()` generates a summary of the binomial variable
* `bin_mean()` calculates the mean of the binomial distribution  
* `bin_variance()` calculates the variance of the binomial distribution 
* `bin_mode()` calculates the mode of the binomial distribution  
* `bin_skewness()` calculates the skewness the given binomial distribution       
* `bin_kurtosis()` calculates the kurtosis the given binomial distribution  


## Motivation

This package has been developed to illustrate the mechanism and usage of binomial distribution


## Installation

Install the development version from GitHub via the package `"devtools"`:

```{r}
# development version from GitHub:
#install.packages("devtools") 

# install "cointoss" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-HonglingLei/workout3/binomial")

# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-HonglingLei/workout3/binomial", build_vignettes = TRUE)
```
