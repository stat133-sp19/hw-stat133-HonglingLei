lab07-hongling-lei
================

Your Turn\*: Area of a circle
-----------------------------

``` r
# area of circle with radius 2
r = 2
area = pi * r^2
area
```

    ## [1] 12.56637

``` r
#' @title area of a circle
#' @description calculates the area of a circle
#' @param radius radius of the circle (numeric)
#' @return computed area

circle_area <- function(radius = 1){
  if (radius < 0){
    stop("radius cannot be negative")
  }
  area <- pi * radius^2
  return(area)
}

# test
circle_area()
```

    ## [1] 3.141593

``` r
circle_area(radius = 3)
```

    ## [1] 28.27433

``` r
circle_area(radius = -2)
```

    ## Error in circle_area(radius = -2): radius cannot be negative

Your Turn\*: Surface area of a cylinder
---------------------------------------

``` r
# cylinder variable
r = 2 # radius
h = 3 # height

# area of cylinder
2 * pi * r * h + 2 * pi * r^2
```

    ## [1] 62.83185

``` r
#' @title area of a cylinder
#' @description calculates the area of a cylinder
#' @param radius radius of the circle (numeric)
#' @param height height of the cylinder (numeric)
#' @return computed area
cylinder_area <- function(radius = 1, height = 1){
  if (radius < 0){
    stop("radius cannot be negative") 
  }
  if (height < 0){
    stop("heihgt cannot be negative")
  }
  area <- 2 * pi * radius * height + 2 * circle_area(radius)
  return(area)
}

# test
# default (radius 1, height 1)
cylinder_area()
```

    ## [1] 12.56637

``` r
# radius 2, height 3
cylinder_area(radius = 2, height = 3)
```

    ## [1] 62.83185

``` r
# bad radius
cylinder_area(radius = -2, height = 1)
```

    ## Error in cylinder_area(radius = -2, height = 1): radius cannot be negative

``` r
# bad height
cylinder_area(radius = 2, height = -1)
```

    ## Error in cylinder_area(radius = 2, height = -1): heihgt cannot be negative

``` r
# bad radius and height 
cylinder_area(radius = -2, height = -1)
```

    ## Error in cylinder_area(radius = -2, height = -1): radius cannot be negative

Your Turn\*: Volume of a cylinder
---------------------------------

``` r
#' @title volume of a cylinder
#' @description calculates the volume of a cylinder
#' @param radius radius of the circle (numeric)
#' @param height height of the cylinder (numeric)
#' @return computed volume
cylinder_volume <- function(radius = 1, height = 1){
  if (radius < 0){
    stop("radius cannot be negative") 
  }
  if (height < 0){
    stop("heihgt cannot be negative")
  }
  volume <- height * circle_area(radius)
  return(volume)
}
```

``` r
# test
# default (radius 1, height 1)
cylinder_volume()
```

    ## [1] 3.141593

``` r
cylinder_volume(radius = 3, height = 10)
```

    ## [1] 282.7433

``` r
cylinder_volume(height = 10, radius = 3)
```

    ## [1] 282.7433

Your Turn\*: Even number
------------------------

``` r
#' @title even number or not
#' @description determines whether a number is even or not
#' @param number the number to be determined (numeric)
#' @return TRUE or FALSE
is_even <- function(number){
  if (mode(number) != "numeric"){
    print("NA")
  }else if (mode(number) == 'numeric'){
    if(number %% 2 == 0){
      print("TRUE")
    }else if (number %% 2 == 1){
      print("FALSE")
    }
  }
}

# test
# even number
is_even(10)
```

    ## [1] "TRUE"

``` r
# odd number
is_even(33)
```

    ## [1] "FALSE"

``` r
# not a number
is_even('a')
```

    ## [1] "NA"

Your Turn\*: Odd number
-----------------------

``` r
#' @title odd number or not
#' @description determines whether a number is odd or not
#' @param number the number to be determined (numeric)
#' @return TRUE or FALSE
is_odd <- function(number){
  if (mode(number) != "numeric"){
    print("NA")
  }else if (mode(number) == 'numeric'){
    if(number %% 2 == 0){
      print("FALSE")
    }else if (number %% 2 == 1){
      print("TRUE")
    }
  }
}

# test
# even number
is_odd(1)
```

    ## [1] "TRUE"

``` r
# odd number
is_odd(4)
```

    ## [1] "FALSE"

``` r
# not a number
is_odd('a')
```

    ## [1] "NA"

Your Turn\*: A grading function
-------------------------------

``` r
#' @title grading range
#' @description determines which grade range the score falls into
#' @param score score of the exam (numeric)
#' @return "A", "B", "C", "D" or "F"
grade <- function(score){
  letter = "A"
  if (score < 90 & score >= 80){
    letter = "B"
  } else if (score < 80 & score >= 70){
    letter = "C"
  } else if (score < 70 & score >= 60){
    letter = "D"
  } else if (score < 60 & score >= 0){
    letter = "F"
  } else if (score < 0 | score > 100){
    stop("score must be a number between 0 and 100")
  }
  return(letter)
}

# test
# grade "A"
grade(score = 90)
```

    ## [1] "A"

``` r
# grade "B"
grade(score = 89.9999)
```

    ## [1] "B"

``` r
# grade "C"
grade(score = 70.000001)
```

    ## [1] "C"

``` r
# grade "F"
grade(score = 50)
```

    ## [1] "F"
