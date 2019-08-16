lab08-hongling-lei
================

Your Turn\*: Summation Series
-----------------------------

``` r
series_sum_2 <- function(n){
  sum = 0
  vec = rep(0, n)
  if (n < 1){
    stop("n should be greater than 1")
  }else{
    for (k in 0:n){
    sum = sum + 1/(2^k)
    vec[k] = sum
    }
  }
  return(sum)
}
```

``` r
# test:
1 + 1/2 == series_sum_2(1)
```

    ## [1] TRUE

``` r
1 + 1/2 + 1/2^2 == series_sum_2(2)
```

    ## [1] TRUE

``` r
# does the series converge as n increases?
series_sum_2(100)
```

    ## [1] 2

``` r
series_sum_2(1000)
```

    ## [1] 2

``` r
series_sum_2(10000)
```

    ## [1] 2

So yes, the series converges to 2 as n increases to infinity.

``` r
series_sum_9 <- function(n){
  sum = 0
  vec = rep(0, n)
  if (n < 1){
    stop("n should be greater than 1")
  }else{
    for (k in 0:n){
    sum = sum + 1/(9^k)
    vec[k] = sum
    }
  }
  return(sum)
}
```

``` r
# test:
1 + 1/9 == series_sum_9(1)
```

    ## [1] TRUE

``` r
1 + 1/9 + 1/9^2 == series_sum_9(2)
```

    ## [1] TRUE

``` r
# does the series converge as n increases?
series_sum_9(100)
```

    ## [1] 1.125

``` r
series_sum_9(1000)
```

    ## [1] 1.125

``` r
series_sum_9(10000)
```

    ## [1] 1.125

So yes, the series converges to 1.125 as n increases to infinity.

Your Turn\*: Arithmetic Series
------------------------------

``` r
ari_series <- function(n){
  a_1 = 3
  d = 3
  sum = 0
  vec = rep(0, n)
  for (i in (1:n)){
    a_i = a_1 + (i-1)*d
    sum = sum + a_i
    vec[i] = sum
  }
  return(sum)
}
```

``` r
# test: calculate 3 + 6 + 9 + 12 + 15
3 + 6 + 9 + 12 + 15 == ari_series(5)
```

    ## [1] TRUE

``` r
# does the series converge as n increases?
ari_series(3000) - ari_series(2000)
```

    ## [1] 7501500

``` r
ari_series(2000) - ari_series(1000)
```

    ## [1] 4501500

Since the gap is increasing as n is increasing, the series doesn't converge as n increases.

Your Turn\*: Geometric Sequence
-------------------------------

``` r
geo_series <- function(n){
  a_1 = 3
  r = 2
  sum = 0
  vec = c()
  for (i in (1:n)){
    a_i = a_1 * r^(i-1)
    sum = sum + a_i
    vec = c(vec, sum)
  }
  return(sum)
}
```

``` r
# test: calculate 3 + 6 + 12 + 24
3 + 6 + 12 + 24 == geo_series(4)
```

    ## [1] TRUE

``` r
# does the series converge as n increases?
geo_series(2000) - geo_series(1000)
```

    ## [1] Inf

No, the series doesn't converge as n increases.

Your Turn\*: Sine Approximation
-------------------------------

``` r
sine <- function(x, n){
  sum = x
  vec = c(0)
  for (i in 1:n){
    x_i = (-1)^i * (x^(2*i+1) / prod(1:(2*i+1)))
    sum = sum + x_i
    vec = c(vec, sum)
  }
  return(sum)
}
```

``` r
# test:
x = 0.5 * pi
sine(x, 5)
```

    ## [1] 0.9999999

``` r
sine(x, 10)
```

    ## [1] 1

``` r
sine(x, 50)
```

    ## [1] 1

``` r
sine(x, 100)
```

    ## [1] 1

``` r
# compare your results with sin(x)
sin(x)
```

    ## [1] 1

Your Turn\*: Average
--------------------

``` r
# using for loop:
avg_loop <- function(x){
  sum = 0
  for (i in 1:length(x)){
    sum = sum + x[i]
  }
  avg = sum / length(x)
  return(avg)
}

# using while:
avg_while <- function(x){
  sum = 0
  i = 1
  while (i <= length(x)){
    sum = sum + x[i]
    i = i + 1
  }
  avg = sum / length(x)
  return(avg)
}

# using repeat:
avg_rep <- function(x){
  sum = 0
  i = 1
  repeat{
    sum = sum + x[i]
    i = i + 1
    if (i > length(x)){
      break
    }
  }
  avg = sum / length(x)
  return(avg)
}
```

``` r
# test:
x = c(1:100)
avg_loop(x) == mean(x)
```

    ## [1] TRUE

``` r
avg_while(x) == mean(x)
```

    ## [1] TRUE

``` r
avg_rep(x) == mean(x)
```

    ## [1] TRUE

Your Turn\*: Standard Deviation:
--------------------------------

``` r
# using for loop:
sd_loop <- function(x){
  sum = 0
  for (i in 1:length(x)){
    sum = sum + (x[i] - mean(x))^2
  }
  sd = sqrt(sum / (length(x) - 1))
  return(sd)
}

# using while:
sd_while <- function(x){
  sum = 0
  i = 1
  while (i <= length(x)){
    sum = sum + (x[i] - mean(x))^2
    i = i + 1
  }
  sd = sqrt(sum / (length(x) - 1))
  return(sd)
}

# using repeat:
sd_rep <- function(x){
  sum = 0
  i = 1
  repeat{
    sum = sum + (x[i] - mean(x))^2
    i = i + 1
    if (i > length(x)){
      break
    }
  }
  sd = sqrt(sum / (length(x) - 1))
  return(sd)
}
```

``` r
# test:
x = c(1:50) 
sd_loop(x) == sd(x)
```

    ## [1] TRUE

``` r
sd_while(x) == sd(x)
```

    ## [1] TRUE

``` r
sd_rep(x) == sd(x)
```

    ## [1] TRUE

Your Turn\*: Geomatric Mean
---------------------------

``` r
# using for loop:
geo_loop <- function(x){
  product = 1
  for (i in 1:length(x)){
    product = product * (x[i])
  }
  geo_mean = (product)^(1/length(x))
  return(geo_mean)
}

# using while:
geo_while <- function(x){
  product = 1
  i = 1
  while (i <= length(x)){
    product = product * (x[i])
    i = i + 1
  }
  geo_mean = (product)^(1/length(x))
  return(geo_mean)
}

# using repeat:
geo_rep <- function(x){
  product = 1
  i = 1
  repeat{
    product = product * (x[i])
    i = i + 1
    if (i > length(x)){
      break
    }
  }
  geo_mean = (product)^(1/length(x))
  return(geo_mean)
}
```

``` r
# test:
x = c(1:50) 
geo_loop(x)
```

    ## [1] 19.48325

``` r
geo_while(x)
```

    ## [1] 19.48325

``` r
geo_rep(x)
```

    ## [1] 19.48325

Your Turn\*: Distance Matrix of Letters
---------------------------------------

``` r
# The following code generates a random matrix distances 
# with arbitrary distance values among letters in English:

# random distance matrix
num_letters <- length(LETTERS)
set.seed(123)
values <- sample.int(num_letters) 
distances <- values %*% t(values)
diag(distances) <- 0
dimnames(distances) <- list(LETTERS, LETTERS)

# first five rows:
distances[1:5, 1:5]
```

    ##     A   B   C   D   E
    ## A   0 160  80 168 184
    ## B 160   0 200 420 460
    ## C  80 200   0 210 230
    ## D 168 420 210   0 483
    ## E 184 460 230 483   0

``` r
# (E to D) + (D to A)
483 + 168
```

    ## [1] 651

Your Turn\*:
------------

``` r
get_dist <- function(dist = distances, ltrs){
  a = 0
  for (i in 1:(length(ltrs) - 1)){
    if (ltrs[i] %in% LETTERS == TRUE){
      a = a + dist[ltrs[i], ltrs[i + 1]]
    }
    else{
      stop("Unrecognized character")
    }
  }
  return(a)
}

cal <- c('C', 'A', 'L')
stats <- c('S', 'T', 'A', 'T', 'S')
oski <- c('O', 'S', 'K', 'I')
zzz <- rep('Z', 3)
lets <- LETTERS
# a vector first with letters for your first name
first = c('H', 'O', 'N', 'G', 'L', 'I', 'N', 'G')
# a vector last for your last name
last = c('L', 'E', 'I')

get_dist(distances, cal)
```

    ## [1] 136

``` r
get_dist(distances, stats)
```

    ## [1] 990

``` r
get_dist(distances, oski)
```

    ## [1] 834

``` r
get_dist(distances, zzz)
```

    ## [1] 0

``` r
get_dist(distances, lets)
```

    ## [1] 4800

``` r
get_dist(distances, first)
```

    ## [1] 1191

``` r
get_dist(distances, last)
```

    ## [1] 713

``` r
# use your own 'first' and 'last' objects
strings <- list(
  cal = cal,
  stats = stats,
  oski = oski,
  zzz = zzz,
  lets = lets,
  first = first,
  last = last
)
```

``` r
# At each iteration, store the calculated distances in a list called strings_dists
strings_dists = list(
  cal = 0, # set all the initial values as 0, and replace them later
  stats = 0,
  oski = 0,
  zzz = 0,
  lets = 0,
  first = 0,
  last = 0
)

for (i in 1:length(strings)) {
  strings_dists[[i]] = get_dist(distances, strings[[i]])
}

strings_dists
```

    ## $cal
    ## [1] 136
    ## 
    ## $stats
    ## [1] 990
    ## 
    ## $oski
    ## [1] 834
    ## 
    ## $zzz
    ## [1] 0
    ## 
    ## $lets
    ## [1] 4800
    ## 
    ## $first
    ## [1] 1191
    ## 
    ## $last
    ## [1] 713
