lab12-hongling-lei
================

``` r
library(XML)
```

    ## Warning: package 'XML' was built under R version 3.4.4

``` r
library(xml2)
library(rvest)
```

    ## 
    ## Attaching package: 'rvest'

    ## The following object is masked from 'package:XML':
    ## 
    ##     xml

``` r
library(magrittr)
library(stringr)
```

    ## Warning: package 'stringr' was built under R version 3.4.4

``` r
basket <- "https://www.basketball-reference.com"
bos <- "/teams/BOS/2017.html"
bos_url <- paste0(basket, bos)
bos_roster <- readHTMLTable("bos-roster-2017.html")
nba_html <- paste0(basket, "/leagues/NBA_2017.html")
xml_doc <- read_html(nba_html)
xml_tables <- xml_doc %>%
  html_nodes("table") %>%
  extract(1:2)
```

Your Turn\*:
------------

``` r
# Store the href attributes in a character vector hrefs.
nodes <- html_nodes(xml_tables, "a")
hrefs <- html_attr(nodes, "href")

# Use string manipulation functions to create a character vector teams that contains just the team abbreviations: e.g. "BOS", "CLE", "TOR", ...
teams <- str_sub(hrefs, start=8, end = 10) # extract the 8th to the 10th character in hrefs

# Create a character vector files with elements: "BOS-roster-2017.csv", "CLE-roster-2017.csv", "TOR-roster-2017.csv"
files <- paste0(teams,"-roster-2017.csv")

# Use the object basket and the first element of hrefs (i.e. hrefs[1]) to assemble a team_url like the one used for gsw_url:
basket <- "https://www.basketball-reference.com"
bos <- hrefs[1]

# Read the html document of team_url.
team_url <- paste0(basket, bos)

# Use html_table() to extract the content of the html table as a data frame called roster.
download.file(team_url, "bos-roster-2017.html")
bos_roster <- read_html("bos-roster-2017.html")
roster_table <- html_table(bos_roster)

# Store the data frame in a csv file: "BOS-roster-2017.csv".
write.csv(roster_table, "BOS-roster-2017.csv")
```

Having making sure that your code above works, now generalize it to more teams. In theory, your code should be able to collect all 30 roster tables. However, since everyone will be making constant requests to the basketball-reference website at the same time, write code that scrapes a couple of roster tables (e.g. 5 or 7 teams).

``` r
# Create a for () loop to extract a handful of the roster tables as data frames.
for (i in 15:20){
  team_url <- paste0(basket, hrefs[i])
  download.file(team_url, paste(teams[i], "-roster-2017.html"))
  i_roster <- read_html(paste(teams[i], "-roster-2017.html"))
  roster_table <- html_table(i_roster)
  write.csv(roster_table, files[i])
}
```

Challenge\*:
------------

``` r
# Using all the saved csv files, how would you build a global table containing the extracted rosters, in a way that this table would also have a column for the team?
# Try getting such a global table and save it in a file nba-rosters-2017.csv
global_data <- read.csv(files[15], sep=",")
for (i in 16:20){
  temp <- read.csv(files[i], sep=",")
  global_data = rbind(global_data, temp)
}

write.csv(global_data, "nba-rosters-2017.csv")
read.csv("nba-rosters-2017.csv")
```

    ##     X.1  X No.                  Player Pos   Ht  Wt         Birth.Date
    ## 1     1  1  13              Quincy Acy  PF  6-7 240    October 6, 1990
    ## 2     2  2  13         Anthony Bennett  PF  6-8 245     March 14, 1993
    ## 3     3  3  44        Bojan Bogdanović  SF  6-8 216     April 18, 1989
    ## 4     4  4  35           Trevor Booker  PF  6-8 228  November 25, 1987
    ## 5     5  5   8       Spencer Dinwiddie  PG  6-6 210      April 6, 1993
    ## 6     6  6  10            Yogi Ferrell  PG  6-0 180        May 9, 1993
    ## 7     7  7   2              Randy Foye  SG  6-4 213 September 24, 1983
    ## 8     8  8  10          Archie Goodwin  SG  6-5 200    August 17, 1994
    ## 9     9  9  41         Justin Hamilton   C  7-0 260      April 1, 1990
    ## 10   10 10  12              Joe Harris  SG  6-6 218  September 6, 1991
    ## 11   11 11  24 Rondae Hollis-Jefferson  SF  6-7 217    January 3, 1995
    ## 12   12 12   6         Sean Kilpatrick  SG  6-4 210    January 6, 1990
    ## 13   13 13  22            Caris LeVert  SF  6-7 204    August 25, 1994
    ## 14   14 14   7              Jeremy Lin  PG  6-3 200    August 23, 1988
    ## 15   15 15  11             Brook Lopez   C  7-0 270      April 1, 1988
    ## 16   16 16   1        Chris McCullough  PF 6-11 200   February 5, 1995
    ## 17   17 17  14          K.J. McDaniels  SF  6-6 205   February 9, 1993
    ## 18   18 18  44        Andrew Nicholson  PF  6-9 250   December 8, 1989
    ## 19   19 19   4              Luis Scola  PF  6-9 240     April 30, 1980
    ## 20   20 20  21         Greivis Vásquez  PG  6-6 217   January 16, 1987
    ## 21   21 21  15        Isaiah Whitehead  PG  6-4 213      March 8, 1995
    ## 22   22  1  22             Matt Barnes  SF  6-7 226      March 9, 1980
    ## 23   23  2  21               Ian Clark  SG  6-3 175      March 7, 1991
    ## 24   24  3  30           Stephen Curry  PG  6-3 190     March 14, 1988
    ## 25   25  4  35            Kevin Durant  PF  6-9 240 September 29, 1988
    ## 26   26  5  23          Draymond Green  PF  6-7 230      March 4, 1990
    ## 27   27  6   9          Andre Iguodala  SF  6-6 215   January 28, 1984
    ## 28   28  7  15            Damian Jones   C  7-0 245      June 30, 1995
    ## 29   29  8  34        Shaun Livingston  PG  6-7 192 September 11, 1985
    ## 30   30  9   5            Kevon Looney   C  6-9 220   February 6, 1996
    ## 31   31 10  20    James Michael McAdoo  PF  6-9 230    January 4, 1993
    ## 32   32 11   0           Patrick McCaw  SG  6-7 185   October 25, 1995
    ## 33   33 12   1            JaVale McGee   C  7-0 270   January 19, 1988
    ## 34   34 13  27           Zaza Pachulia   C 6-11 270  February 10, 1984
    ## 35   35 14  11           Klay Thompson  SG  6-7 215   February 8, 1990
    ## 36   36 15  18        Anderson Varejão   C 6-10 273 September 28, 1982
    ## 37   37 16   2           Briante Weber  PG  6-2 165  December 29, 1992
    ## 38   38 17   3              David West   C  6-9 250    August 29, 1980
    ## 39   39  1  12       LaMarcus Aldridge  PF 6-11 260      July 19, 1985
    ## 40   40  2   1           Kyle Anderson  SF  6-9 230 September 20, 1993
    ## 41   41  3  30            Joel Anthony   C  6-9 245     August 9, 1982
    ## 42   42  4  42           Dāvis Bertāns  PF 6-10 225  November 12, 1992
    ## 43   43  5   3          Dewayne Dedmon   C  7-0 245    August 12, 1989
    ## 44   44  6  11             Bryn Forbes  SG  6-3 190      July 23, 1993
    ## 45   45  7  16               Pau Gasol   C  7-0 250       July 6, 1980
    ## 46   46  8  20           Manu Ginóbili  SG  6-6 205      July 28, 1977
    ## 47   47  9  14             Danny Green  SG  6-6 215      June 22, 1987
    ## 48   48 10  27    Nicolás Laprovíttola  PG  6-4 180   January 31, 1990
    ## 49   49 11  10               David Lee  PF  6-9 245     April 29, 1983
    ## 50   50 12   2           Kawhi Leonard  SF  6-7 230      June 29, 1991
    ## 51   51 13   8             Patty Mills  PG  6-0 180    August 11, 1988
    ## 52   52 14   5         Dejounte Murray  PG  6-5 170 September 19, 1996
    ## 53   53 15   9             Tony Parker  PG  6-2 185       May 17, 1982
    ## 54   54 16  17        Jonathon Simmons  SG  6-6 195 September 14, 1989
    ## 55   55  1   3           Ryan Anderson  PF 6-10 240        May 6, 1988
    ## 56   56  2   1            Trevor Ariza  SF  6-8 215      June 30, 1985
    ## 57   57  3   2        Patrick Beverley  SG  6-1 185      July 12, 1988
    ## 58   58  4  33            Corey Brewer  SF  6-9 186      March 5, 1986
    ## 59   59  5   8             Bobby Brown  PG  6-2 175 September 24, 1984
    ## 60   60  6  15            Clint Capela   C 6-10 240       May 18, 1994
    ## 61   61  7   7              Sam Dekker  PF  6-9 230        May 6, 1994
    ## 62   62  8   6             Tyler Ennis  PG  6-3 194    August 24, 1994
    ## 63   63  9  10             Eric Gordon  SG  6-4 215  December 25, 1988
    ## 64   64 10  13            James Harden  PG  6-5 220    August 26, 1989
    ## 65   65 11   5        Montrezl Harrell   C  6-8 240   January 26, 1994
    ## 66   66 12  42            Nenê Hilário   C 6-11 250 September 13, 1982
    ## 67   67 13  32          K.J. McDaniels  SF  6-6 205   February 9, 1993
    ## 68   68 14  21          Chinanu Onuaku   C 6-10 245   November 1, 1996
    ## 69   69 15  17           Isaiah Taylor  PG  6-3 170      July 11, 1994
    ## 70   70 16  12            Lou Williams  SG  6-1 175   October 27, 1986
    ## 71   71 17  14           Troy Williams  SF  6-7 218  December 30, 1994
    ## 72   72 18  30            Kyle Wiltjer  PF 6-10 240   October 20, 1992
    ## 73   73  1   9           Alan Anderson  SF  6-6 220   October 16, 1982
    ## 74   74  2  30            Brandon Bass  PF  6-8 250     April 30, 1985
    ## 75   75  3  11          Jamal Crawford  SG  6-5 185     March 20, 1980
    ## 76   76  4   2          Raymond Felton  PG  6-1 205      June 26, 1984
    ## 77   77  5  32           Blake Griffin  PF 6-10 250     March 16, 1989
    ## 78   78  6  10           Brice Johnson  PF 6-10 230      June 27, 1994
    ## 79   79  7  33          Wesley Johnson  SF  6-7 215      July 11, 1987
    ## 80   80  8   6          DeAndre Jordan   C 6-11 265      July 21, 1988
    ## 81   81  9  12        Luc Mbah a Moute  SF  6-8 230  September 9, 1986
    ## 82   82 10   3              Chris Paul  PG  6-0 175        May 6, 1985
    ## 83   83 11  34             Paul Pierce  SF  6-7 235   October 13, 1977
    ## 84   84 12   4             J.J. Redick  SG  6-4 200      June 24, 1984
    ## 85   85 13  25           Austin Rivers  SG  6-4 200     August 1, 1992
    ## 86   86 14   5       Marreese Speights   C 6-10 255     August 4, 1987
    ## 87   87 15   0           Diamond Stone   C 6-11 255  February 10, 1997
    ## 88   88  1  21           Joel Bolomboy  PF  6-9 235   January 28, 1994
    ## 89   89  2  10              Alec Burks  SG  6-6 214      July 20, 1991
    ## 90   90  3  33              Boris Diaw  PF  6-8 250     April 16, 1982
    ## 91   91  4  11              Dante Exum  PG  6-6 190      July 13, 1995
    ## 92   92  5  15          Derrick Favors  PF 6-10 265      July 15, 1991
    ## 93   93  6  27             Rudy Gobert   C  7-1 245      June 26, 1992
    ## 94   94  7  20          Gordon Hayward  SF  6-8 225     March 23, 1990
    ## 95   95  8   3             George Hill  PG  6-3 188        May 4, 1986
    ## 96   96  9   5             Rodney Hood  SG  6-8 206   October 20, 1992
    ## 97   97 10   2              Joe Ingles  SF  6-8 226    October 2, 1987
    ## 98   98 11   6             Joe Johnson  SF  6-7 240      June 29, 1981
    ## 99   99 12  41              Trey Lyles  PF 6-10 234   November 5, 1995
    ## 100 100 13   8            Shelvin Mack  PG  6-3 203     April 22, 1990
    ## 101 101 14  25               Raul Neto  PG  6-1 179       May 19, 1992
    ## 102 102 15  24             Jeff Withey   C  7-0 231      March 7, 1990
    ##     Var.7 Exp                                           College
    ## 1      us   4                                 Baylor University
    ## 2      ca   3                   University of Nevada, Las Vegas
    ## 3      ba   2                                                  
    ## 4      us   6                                Clemson University
    ## 5      us   2                            University of Colorado
    ## 6      us   R                                Indiana University
    ## 7      us  10                              Villanova University
    ## 8      us   3                            University of Kentucky
    ## 9      us   2 Iowa State University, Louisiana State University
    ## 10     us   2                            University of Virginia
    ## 11     us   1                             University of Arizona
    ## 12     us   2                          University of Cincinnati
    ## 13     us   R                            University of Michigan
    ## 14     us   6                                Harvard University
    ## 15     us   8                               Stanford University
    ## 16     us   1                               Syracuse University
    ## 17     us   2                                Clemson University
    ## 18     ca   4                        St. Bonaventure University
    ## 19     ar   9                                                  
    ## 20     ve   6                            University of Maryland
    ## 21     us   R                             Seton Hall University
    ## 22     us  13             University of California, Los Angeles
    ## 23     us   3                                Belmont University
    ## 24     us   7                                  Davidson College
    ## 25     us   9                     University of Texas at Austin
    ## 26     us   4                         Michigan State University
    ## 27     us  12                             University of Arizona
    ## 28     us   R                             Vanderbilt University
    ## 29     us  11                                                  
    ## 30     us   1             University of California, Los Angeles
    ## 31     us   2                      University of North Carolina
    ## 32     us   R                   University of Nevada, Las Vegas
    ## 33     us   8                        University of Nevada, Reno
    ## 34     ge  13                                                  
    ## 35     us   5                       Washington State University
    ## 36     br  12                                                  
    ## 37     us   1                  Virginia Commonwealth University
    ## 38     us  13                                 Xavier University
    ## 39     us  10                     University of Texas at Austin
    ## 40     us   2             University of California, Los Angeles
    ## 41     ca   9                   University of Nevada, Las Vegas
    ## 42     lv   R                                                  
    ## 43     us   3                 University of Southern California
    ## 44     us   R                         Michigan State University
    ## 45     es  15                                                  
    ## 46     ar  14                                                  
    ## 47     us   7                      University of North Carolina
    ## 48     ar   R                                                  
    ## 49     us  11                             University of Florida
    ## 50     us   5                        San Diego State University
    ## 51     au   7                Saint Mary's College of California
    ## 52     us   R                          University of Washington
    ## 53     be  15                                                  
    ## 54     us   1                             University of Houston
    ## 55     us   8                          University of California
    ## 56     us  12             University of California, Los Angeles
    ## 57     us   4                            University of Arkansas
    ## 58     us   9                             University of Florida
    ## 59     us   2            California State University, Fullerton
    ## 60     ch   2                                                  
    ## 61     us   1                           University of Wisconsin
    ## 62     ca   2                               Syracuse University
    ## 63     us   8                                Indiana University
    ## 64     us   7                          Arizona State University
    ## 65     us   1                          University of Louisville
    ## 66     br  14                                                  
    ## 67     us   2                                Clemson University
    ## 68     us   R                          University of Louisville
    ## 69     us   R                     University of Texas at Austin
    ## 70     us  11                                                  
    ## 71     us   R                                Indiana University
    ## 72     us   R                                Gonzaga University
    ## 73     us   7                         Michigan State University
    ## 74     us  11                        Louisiana State University
    ## 75     us  16                            University of Michigan
    ## 76     us  11                      University of North Carolina
    ## 77     us   6                            University of Oklahoma
    ## 78     us   R                      University of North Carolina
    ## 79     us   6        Iowa State University, Syracuse University
    ## 80     us   8                              Texas A&M University
    ## 81     cm   8             University of California, Los Angeles
    ## 82     us  11                            Wake Forest University
    ## 83     us  18                              University of Kansas
    ## 84     us  10                                   Duke University
    ## 85     us   4                                   Duke University
    ## 86     us   8                             University of Florida
    ## 87     us   R                            University of Maryland
    ## 88     ua   R                            Weber State University
    ## 89     us   5                            University of Colorado
    ## 90     fr  13                                                  
    ## 91     au   1                                                  
    ## 92     us   6                   Georgia Institute of Technology
    ## 93     fr   3                                                  
    ## 94     us   6                                 Butler University
    ## 95     us   8 Indiana University-Purdue University Indianapolis
    ## 96     us   2     Mississippi State University, Duke University
    ## 97     au   2                                                  
    ## 98     us  15                            University of Arkansas
    ## 99     ca   1                            University of Kentucky
    ## 100    us   5                                 Butler University
    ## 101    br   1                                                  
    ## 102    us   3                              University of Kansas
