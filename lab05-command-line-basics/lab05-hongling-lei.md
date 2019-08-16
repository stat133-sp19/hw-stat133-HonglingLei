lab05-hongling-lei
================

### 1) Your Turn\*: Lab Directory

``` r
# Open (or launch) the command line
pwd
# Use the command pwd to see what’s your current directory
cd /Users/Macbook/Desktop
# Use mkdir to create a new directory stat133-lab05
mkdir stat133-lab05
# Change directory to stat133-lab05
cd Desktop/stat133-lab05
# Use the command curl to download the following text file:
curl -O http://textfiles.com/food/bread.txt
curl -O http://textfiles.com/food/btaco.txt
curl -O http://textfiles.com/food/1st_aid.txt
curl -O http://textfiles.com/food/beesherb.txt
curl -O http://textfiles.com/food/bakebred.txt
curl -O http://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv
curl -O http://web.pdx.edu/~gerbing/data/cars.csv
curl -O http://web.pdx.edu/~gerbing/data/color.csv
curl -O http://web.pdx.edu/~gerbing/data/snow.csv
curl -O http://web.pdx.edu/~gerbing/data/mid1.csv
curl -O http://web.pdx.edu/~gerbing/data/mid2.csv
curl -O http://web.pdx.edu/~gerbing/data/minutes1.csv
curl -O http://web.pdx.edu/~gerbing/data/minutes2.csv
```

### 2) Your Turn\*: Inspecting a Directory

``` r
# Use the command ls to list the contents in your current directory
ls 
# Now try ls -l to list the contents in your current directory in long format
ls -1 
# Look at the man documentation of ls to find out how to list the contents in reverse order
man -1 ls 
# How would you list the contents in long format arranged by time
ls -l -t 
# Find out how to use the wildcard * to list all the files with extension .txt
ls *.txt 
# Use the wildcard * to list all the files with extension .csv in reverse order
ls *.csv -r 
# You can use the character ? to represent a single character: e.g. ls mid?.csv. 
ls mid?.csv 
# Find out how to use the wilcard ? to list .csv files with names made of 4 characters (e.g. mid1.csv, snow.csv)
ls ????.csv 
# The command ls *[1]*.csv should list .csv files with names containing the number 1 (e.g. mid1.csv, minutes1.csv). Adapt the command to list .csv files with names containing the number 2.
ls *[1]*.csv 
mid1.csv    minutes1.csv
ls *[2]*.csv 
# Find out how to list files with names containing any number.
ls *[0-9]*.csv
```

### 3) Moving Files

``` r
# Inside stat133-lab05 create a directory data
mkdir data
# Change directory to data
cd data
# Create a directory txt-files
mkdir txt-files
# Create a directory csv-files
mkdir csv-files
# Use the command mv to move the bread.txt file to the folder txt-files. Without changing directories, use ls to confirm that bread.txt is now inside txt-files.
mv ../bread.txt txt-files
ls ./txt-files/
# Use the wildcard * to move all the .txt files to the directory txt-files. Without changing directories, use ls to confirm that all the .txt files are inside txt-files.
mv ../*txt txt-files
ls ./txt-files/
# Use the wildcard * to move all the .csv files to the directory csv-files. Without changing directories, use ls to confirm that all the .csv files are inside csv-files.
mv ../*csv csv-files
ls ./csv-files/
# Try using the command tree to see a visual display of the filestructure. Warning: You may not have this command in git-bash or in another shell flavor.
tree
```

### 4) Your Turn\*: Copying Files

``` r
# Go back to the parent directory stat133-lab05
cd ../../Desktop/stat133-lab05
# Create a directory copies
mkdir copies
# Use the command cp to copy the bread.txt file (the one inside the folder txt-files) to the copies directory
cp data/txt-files/bread.txt copies
# Without changing directories, use ls to confirm that bread.txt is now inside copies.
ls copies
# Use the wildcard * to copy all the .txt files in the directory copies
cp data/txt-files/*.txt copies
# Without changing directories, use ls to confirm that all the .txt files is now inside copies.
ls copies
# Use the wildcard * to copy all the .csv files in the directory copies
cp data/csv-files/*.csv copies
# Try using the command tree to see a visual display of the filestructure.
tree
```

### 5) Your Turn\*: Renaming and Deleting Files

``` r
# Change to the directory copies
cd copies
# Use the command mv to rename the file bread.txt as bread-recipe.txt
mv bread.txt bread-recipe
# Rename the file cars.csv as autos.csv
mv cars.csv auto.csv
# Rename the file btaco.txt as breakfast-taco.txt
mv btaco.txt breakfast-taco.txt
# Change to the parent directory (i.e. stat133-lab05)
cd ..
# Rename the directory copies as copy-files
mv copies copy-files
# Find out how to use the rm command to delete the .csv files that are in copy-files
rm copy-files/*.csv
# Find out how to use the rm command to delete the directory copy-files
rm -rf copy-files
# List the contents of the directory txt-files displaying the results in reverse (alphabetical) order
ls -r data/txt-files 
```

### Exporting Objects from R to External Files

``` r
# Create a directory exports inside stat133-lab05.
mkdir exports
# The data that you will have to use is the built-in data frame mtcars
head(mtcars)
# get working directory
getwd()
write.csv(
  x = mtcars, # R object to be exported
  file = 'stat133-lab05/exports.csv'  # file path
)
summary(mtcars[ ,c('mpg', 'disp')])
```

``` r
# divert output to the specified file
sink(file = 'stat133-lab05/summary-mpg-disp.txt')
summary(mtcars[ ,c('mpg', 'disp')])
# closing sinking operation
sink()
```

``` r
# saving a scatterplot in png format
png(filename = "stat133-lab05/exports/scatterplot-mpg-disp.png")
plot(mtcars$mpg, mtcars$disp, pch = 20, 
     xlab = 'Miles per Gallon', ylab = 'Displacement')
dev.off()
```

### Abalone Dataset

### Your Turn:

``` r
# Change to the directory stat133-lab05
cd ../Desktop/stat133-lab05
# Create a directory abalone
mkdir abalone
# Change to abalone directory
cd abalone
# Use curl to download the file abalone.data
curl -O http://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data
# Use the file command to know what type of file is abalone.data.
file abalone.data
# Use the word count command wc to obtain information about: 1) newline count, 2) word count, and 3) byte count, of the abalone.data file.
wc abalone.data
# See the man documentation of wc and learn what option you should use to obtain only the number of lines in abalone.data.
man -1 wc
# Use head to take a peek at the first lines (10 lines by default) of abalone.data
wc -l abalone.data
# See the man documentation of head and learn what option you should use to display only the first 5 files in abalone.data.
man -1 head
head -n 5 abalone.data
# How would you display the first 15 files in abalone.data?
head -n 15 abalone.data
# Use tail to take a peek at the last lines (10 lines by default) of abalone.data
tail abalone.data
# See the man documentation of tail and learn what option you should use to display only the last 3 files in abalone.data.
man -1 tail
tail -n 3 abalone.data
# Use the less command to look at the contents of abalone.data (this command opens a paginator so you can move up and down the contents of the file). Press the key q to exit the paginator.
less abalone.data
q
# Rename abalone.data as abalone.csv
mv abalone.data abalone.csv
# Make a copy of abalone.csv, naming this copy dataset.csv
cp abalone.csv dataset.csv
# Move dataset.csv to the directory csv-files
mv dataset.csv csv-files
```

### Your Turn\*

``` r
# Export a data frame with columns mpg, disp, and hp, to a CSV file dataset.csv in the exports/ subdirectory.
library(dplyr)
car_data = select(mtcars, mpg, disp, hp)
write.csv(
  x = car_data, # R object to be exported
  file = 'stat133-lab05/exports/dataset.csv'  # file path
)

# Export the output of str() on mtcars to a text file called mtcars-structure.txt (inside the exports/ subdirectory).
sink(file = 'stat133-lab05/exports/mtcars-structure.txt')
str(mtcars)
sink()

# Export the summary() of the entire data frame mtcars to a text file summary-mtcars.txt, in the exports/ folder.
sink(file = 'stat133-lab05/exports/summary-mtcars.txt')
str(mtcars)
sink()

# Open the help documentation of png() and related graphic devices.
help("png()")

# Use png() to save a scatterplot of mpg and wt with plot(). Save the graph as scatterplot-mpg-wt.png in the exports/ folder.
png(filename = "stat133-lab05/exports/scatterplot-mpg-wt.png")
plot(mtcars$mpg, mtcars$wt, pch = 20,
     xlab = "Miles per Gallon", ylab = "Weight")
dev.off()

# Save another version of the scatterplot between hp and wt, but now try to get an image with higher resolution. Save the plot as scatterplot-hp-wt.png in exports/.
png(filename = "stat133-lab05/exports/scatterplot-hp-wt.png", res = 130)
plot(mtcars$hp, mtcars$wt, pch = 20,
     xlab = "Horsepower", ylab = "Weight")
dev.off()

# Save a histogram in JPEG format of mpg with dimensions (width x height) 600 x 400 pixels, name the file histogram-mpg.jpeg.
jpeg(filename = "stat133-lab05/exports/histogram-mpg.jpeg", width = 600, height = 400)
hist(mtcars$mpg, pch = 20)
dev.off

# Use pdf() to save the previous histogram of age in PDF format, with dimensions (width x height) 7 x 5 inches, name the file histogram-mpg.pdf.
pdf(file = 'stat133-lab05/exports/histogram-mpg.pdf', width = 7, height = 5)
hist(mtcars$mpg, pch = 20)
dev.off

# The package "ggplot2" comes with a wrapper function ggsave() that allows you to save ggplot graphics to a specified file. By default, ggsave() saves images in PDF format. Use ggplot() to make a scatterplot of mpg and disp, and store it in a ggplot object named gg_mpg_disp. Then use ggsave() to save the plot with dimensions (width x height) 7 x 5 inches, as scatterplot-mpg-disp.pdf.
library(ggplot2)
pdf(file = 'gg_mpg_disp.pdf', width = 7, height = 5)
graph = ggplot(data = mtcars) +
  geom_point(aes(x = mpg, y = disp))
dev.off
```
