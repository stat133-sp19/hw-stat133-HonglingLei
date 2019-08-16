warmup02-hongling-lei
================

### 1. Vectors

``` r
number = as.integer(c(30, 35, 23, 9, 11, 27, 34, 6, 3, 0))
player = c("Stephen Curry", "Kevin Durant", "Draymond Green", "Andre Iguodala", "Klay Thompson", 
           "Zaza Pachulia", "Shaun Livingston", "Nick Young", "David West", "Patrick McCaw")
position = factor(as.character(c("PG", "PF", "PF", "SF", "SG", "C", "PG", "SG", "C", "SG")))
height = as.character(c("6-3", "6-9", "6-7", "6-6", "6-7", "6-11", "6-7", "6-7", "6-9", "6-7"))
weight = as.double(c(190, 240, 230, 215, 215, 270, 192, 210, 250, 185))
birthdate = c("March 14, 1988", "September 29, 1988", "March 4, 1990", "January 28, 1984",
             "February 8, 1990", "February 10, 1984", "September 11, 1985", "June 1, 1985", 
             "August 29, 1980", "October 25, 1995")
experience = as.integer(c(8, 10, 5, 13, 6, 14, 12, 10, 14, 1))
college = c("Davidson College", "University of Texas at Austin", "Michigan State University",
            "University of Arizona", "Washington State University", "NA", "NA", 
            "University of Southern California", "Xavier University", "University of Nevada, Las Vegas")
```

``` r
player[which.max(weight)]
```

    ## [1] "Zaza Pachulia"

1.1 The heaviest player is named **Zaza Pachulia**.

``` r
college[height == '6-6']
```

    ## [1] "University of Arizona"

1.2 The college of the player that has a height of 6-6 is **University of Arizona**.

``` r
position[which.max(experience)]
```

    ## [1] C
    ## Levels: C PF PG SF SG

1.3 The position of players with more years of experience is **C**.

``` r
number[which.min(weight)]
```

    ## [1] 0

1.4 The number of the lightest player is **0**.

``` r
table(position)
```

    ## position
    ##  C PF PG SF SG 
    ##  2  2  2  1  3

1.5 The frequencies of the position values are above.

``` r
sum(table(number[weight > mean(weight)]))
```

    ## [1] 4

1.6 **Four** players have a weight larger than the average weight.

``` r
sum(table(number[experience >= 9 & experience <=12]))
```

    ## [1] 3

1.7 **Three** players have between 9 and 12 years of experience (inclusive).

``` r
mean(experience[position == 'SG'])
```

    ## [1] 5.666667

1.8 The mean years of experience of Shooting Guard players is **5.666667**

``` r
median(weight[position != 'C'])
```

    ## [1] 212.5

1.9 The median weight of those players with a position different of Center(C) is **212.5**

``` r
quantile(experience[position == 'PF' | position == 'SG'])
```

    ##   0%  25%  50%  75% 100% 
    ##    1    5    6   10   10

1.10 The first quartile is **5**.

### 2. List for GSW

``` r
gsw <- list(
  player = player,
  number = number,
  position = position,
  weight = weight,
  experience = experience
)
```

``` r
gsw <- list(
  player = player,
  number = number,
  position = position,
  weight = weight,
  experience = experience
)
subset(gsw$number, gsw$weight == max(gsw$weight))
```

    ## [1] 27

2.1 The number of the heaviest player is **27**.

``` r
subset(gsw$position, gsw$experience == min(gsw$experience))
```

    ## [1] SG
    ## Levels: C PF PG SF SG

2.2 The position of the player with less experience is **SG**.

``` r
library(plyr)
sum(table(subset(gsw$player, gsw$experience<8 | gsw$experience>11)))
```

    ## [1] 7

2.3 **Seven** players have less than 8 or more than 11 years of experience.

``` r
quantile(subset(gsw$experience, gsw$position == 'PF' | gsw$position == 'SG'))
```

    ##   0%  25%  50%  75% 100% 
    ##    1    5    6   10   10

2.4 The third quartile is **10**.

``` r
gsw$diff = (gsw$weight - mean(gsw$weight))
subset(gsw$player, gsw$diff == max(gsw$diff))
```

    ## [1] "Zaza Pachulia"

2.5 The player whose weight is furthest from the average weight (of all players) is named **Zaza Pachulia**.

### 3. More Lists

``` r
hp <- list(
  first = 'Harry',
  last = 'Potter',
  courses = c('Potions', 'Enchantments', 'Spells'), 
  sport = 'quidditch',
  age = 18L,
  gpa = 3.9
)
class(hp)
```

    ## [1] "list"

3.1 The class of hp is **"list"**.

``` r
length(hp)
```

    ## [1] 6

3.2 **Six** elements are in the list.

``` r
length(hp$courses)
```

    ## [1] 3

3.3 The length of courses is **3**.

``` r
typeof(hp$age)
```

    ## [1] "integer"

3.4 The data type of age is **integer**.

``` r
typeof(hp$gpa)
```

    ## [1] "double"

3.5 The data type of gpa is **double**.

``` r
NewVec <- c(hp$age, hp$gpa)
typeof(NewVec)
```

    ## [1] "double"

3.6 The type of the new vector is **double**.

### 4. Technical Questions

4.1 Coercion.
Because 1 is a number and TRUE is a logical element whose value equals 1. When you call a function with an argument of the wrong type, R will try to coerce values to a different type so that the function will work.
In this case, 1 and TRUE are of different types but R automatically transforms the logical vector into a numerical number.

``` r
"-2" > 0
```

    ## [1] FALSE

``` r
"2" > 0
```

    ## [1] TRUE

``` r
typeof("-2")
```

    ## [1] "character"

``` r
typeof(0)
```

    ## [1] "double"

4.2 Although "-2" is a character while 0 is a double, they are all transformed/coerced as double when R tries to compare them. Since -2 &gt; 0 is mathematically wrong, the running result is FALSE.
To check that the FALSE isn't because we are comparing two different types of data, I run "2" &gt; 0 and the result is TRUE.

4.3 By running (10 &lt;= 5) &gt;= 0 we get TRUE because R first run (10 &lt;= 5) and this part generates a FALSE, which equals 0 in number. Then R compares 0 with 0. Since 0 &gt;= 0, the final result is TRUE.

``` r
# command A
1 + !TRUE
```

    ## [1] 1

``` r
# command B
!TRUE + 1
```

    ## [1] FALSE

4.4 They are different because of the order of calculation and coercion.
Command A generates 1 because 1 appears first, so the later !TRUE is transformed to integer; since !TRUE means FALSE, it has the value 0. Therefore, 1 + !TRUE = 1 + 0 = 1.
Command B generates FALSE because !TRUE appears first as a logical element, so the command basically equals !(TRUE + 1); the later 1 is coerced as TRUE. The command is then treated as !(TRUE + TRUE), with the "+" meaning "and", so it gets !(TRUE) and then gets FALSE.

### 5. Subsetting

``` r
lord <- c('v', 'o', 'l', 'd', 'e', 'm', 'o', 'r', 't')
lord[TRUE]
```

    ## [1] "v" "o" "l" "d" "e" "m" "o" "r" "t"

5.1 Subsetting and recycling.
To do logical subsetting, the vector that we put inside the brackets should match the length of the manipulated vector. **If we pass a shorter vector inside brackets, R will apply its recycling rules.**
So in this command, there's only one logical value inside the bracket, so it automatically recycles and creates three other *TRUE*s. Then *lord\[TRUE\]* equals \*lord\[c(TRUE, TRUE, TRUE, TRUE)\], and displays all the elements in lord.

``` r
lord[length(lord) + 1]
```

    ## [1] NA

5.2 Subsetting. length(lord) = 9, so *length(lord) + 1* = 10. Then the command becomes lord\[10\], but there are only 9 elements in it, so the result is NA because there's no such the 10th element.

``` r
lord[seq(from = length(lord), to = 1, by = -2)]
```

    ## [1] "t" "o" "e" "l" "v"

5.3 Subsetting.
*seq(from = length(lord), to = 1, by = -2)* -&gt; seq(from = 9, to = 1, by = -2)
-&gt; 9, 7, 5, 3, 1
-&gt; the original command is equal to:
-&gt; lord\[9\], lord\[7\], lord\[5\], lord\[3\], lord\[1\]
-&gt; "t", "o", "e", "l", "v"

``` r
lord[lord == "o"]
```

    ## [1] "o" "o"

5.4 Subsetting with logical indices.
*lord == "o"* get us *FALSE TRUE FALSE FALSE FALSE FALSE TRUE FALSE FALSE*, and *lord\[\]* only displays those with a *TRUE* position. So only *lord\[2\]* and *lord\[7\]* are displayed, which are *"o" and "o"*.

``` r
lord[lord != "e" & lord != "o"]
```

    ## [1] "v" "l" "d" "m" "r" "t"

5.5 Subsetting with logical indices.
We can see the command inside the bracket as a condition to satisfy if we want the outer command to work. *lord !="e" & lord != "o"* means that the element cannot be "e" nor "o". Therefore, the remaining elements after excluding "e" and "o" are "v", "l", "d", "m", "r" and "t".

``` r
lord[lord %in% c('a', 'e', 'i', 'o', 'u')]
```

    ## [1] "o" "e" "o"

5.6 Subsetting. *%in%* is a tool to search whether the vectors before and after *%in%* have any overlap. In this example, "voldemort" and "aeiou" have "e" and "o" in common, so the result displays all "e"s and "o"s in the vector lord; first appear, first display. So we get "o", "e", "o".

``` r
lord %in% c('a', 'e', 'i', 'o', 'u')
```

    ## [1] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE

5.6 (Cont.) Alternatively, we can think this way: R runs the inner command *lord %in% c('a', 'e', 'i', 'o', 'u')* first, and we get *FALSE TRUE FALSE FALSE TRUE FALSE TRUE FALSE FALSE*, then under the outer command *lord*, only the elements in *TRUE* positions are displayed, which are "o", "e", "o".

``` r
toupper(lord[!(lord %in% c('a', 'e', 'i', 'o', 'u'))])
```

    ## [1] "V" "L" "D" "M" "R" "T"

5.7 Subsetting.
step 1: run *lord %in% c('a', 'e', 'i', 'o', 'u')* and get *FALSE TRUE FALSE FALSE TRUE FALSE TRUE FALSE FALSE*
step 2: with the *!* ahead, we get the inverse logical vector *TRUE FALSE TRUE TRUE FALSE TRUE FALSE TRUE TRUE*
step 3: with *lord\[\]* outside, we then get *"v" "l" "d" "m" "r" "t"*
step 4: with *toupper\[\]* outside, R present all the results in upper case, so we finally get *"V" "L" "D" "M" "R" "T"*

``` r
paste(lord, collapse = '')
```

    ## [1] "voldemort"

5.8 *paste(collapse)* puts seperate elements in a vector together, and *''* is the interval, which is basically no interval here.
So the letters are put together without any space between one another.

``` r
lord[is.na(lord)]
```

    ## character(0)

5.9 Subsetting. Running *is.na(lord)* gives us *FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE*;
So with *lord\[\]* outside, no element will be displayed; the character length is 0.

``` r
sum(!is.na(lord))
```

    ## [1] 9

5.10 Subsetting and coercion.
Running *is.na(lord)* gives us *FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE*;
With a *!* ahead, we get the inverse *TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE*.
With *sum()* ahead, R automatically turns logical vectors into numbers (coercion), i.e. *1 1 1 1 1 1 1 1 1*. So we get sum = 9.

### 6. 2D Arrays

``` r
vol <- matrix(lord, nrow = 3, ncol = 3)
vol
```

    ##      [,1] [,2] [,3]
    ## [1,] "v"  "d"  "o" 
    ## [2,] "o"  "e"  "r" 
    ## [3,] "l"  "m"  "t"

6.1

``` r
vol[1,]
```

    ## [1] "v" "d" "o"

6.2

``` r
vol[1:2, 2:1]
```

    ##      [,1] [,2]
    ## [1,] "d"  "v" 
    ## [2,] "e"  "o"

6.3

``` r
mat6 <- vol[3:1, 1:3] 
# I named it mat6 because I didn't realize that I would use this matrix until I alrealdy named mat5
mat6
```

    ##      [,1] [,2] [,3]
    ## [1,] "l"  "m"  "t" 
    ## [2,] "o"  "e"  "r" 
    ## [3,] "v"  "d"  "o"

6.4

``` r
matrix(c(vol[,1], vol[,2], vol[,2]), nrow = 3, ncol = 3)
```

    ##      [,1] [,2] [,3]
    ## [1,] "v"  "d"  "d" 
    ## [2,] "o"  "e"  "e" 
    ## [3,] "l"  "m"  "m"

6.5

``` r
mat1 <- matrix(c(vol[,3], vol[,2], vol[,1]), nrow = 3, ncol = 3)
mat2 <- matrix(c(mat1[3,], mat1[2,], mat1[1,]), nrow = 3, ncol = 3, byrow = TRUE)
mat2
```

    ##      [,1] [,2] [,3]
    ## [1,] "t"  "m"  "l" 
    ## [2,] "r"  "e"  "o" 
    ## [3,] "o"  "d"  "v"

6.6

``` r
mat3 <- matrix(c(mat2[,1], mat2[,2]), nrow = 3)
```

``` r
mat4 <- matrix(c(mat1[1,], mat1[2,], mat1[3,]), nrow = 3, ncol = 3, byrow = TRUE)
```

``` r
mat5 <- matrix(c(mat3[,1], mat4[,1], mat3[,2], mat4[,2], mat3[,2], mat4[,2], mat3[,1], mat4[,1]), ncol = 4)
mat5
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,] "t"  "m"  "m"  "t" 
    ## [2,] "r"  "e"  "e"  "r" 
    ## [3,] "o"  "d"  "d"  "o" 
    ## [4,] "o"  "d"  "d"  "o" 
    ## [5,] "r"  "e"  "e"  "r" 
    ## [6,] "t"  "m"  "m"  "t"

6.7

``` r
mat7 <- matrix(c(vol[,1], vol[,2], vol[,3]), nrow = 3, ncol = 3)
mat8 <- matrix(c(mat6[,1], mat7[,1], mat6[,2], mat7[,2], mat6[,3], mat7[,3]), ncol = 3)
mat9 <- matrix(c(mat8[,1], mat8[,2], mat8[,3], mat8[,3], mat8[,2], mat8[,1]), ncol = 6)
mat9
```

    ##      [,1] [,2] [,3] [,4] [,5] [,6]
    ## [1,] "l"  "m"  "t"  "t"  "m"  "l" 
    ## [2,] "o"  "e"  "r"  "r"  "e"  "o" 
    ## [3,] "v"  "d"  "o"  "o"  "d"  "v" 
    ## [4,] "v"  "d"  "o"  "o"  "d"  "v" 
    ## [5,] "o"  "e"  "r"  "r"  "e"  "o" 
    ## [6,] "l"  "m"  "t"  "t"  "m"  "l"
