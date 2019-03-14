
# title: shots-data
# description: prepare data for further analysis and graphing, by adding some columns, merging separate tables, export summaries, etc.
# input(s): the five .csv files from the /data folder
# output(s): added name, calculated minute, replacement of "y" & "n" with "shot_yes" & "shot_no", summary of individual files, combination of all the five files, summary of the combined file

# read files using relative paths
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

# Add a column name to each imported data frame, that contains the name of the corresponding player
iguodala$name <- c(rep("Andre Iguodala", nrow(iguodala)))
green$name <- c(rep("Draymond Green", nrow(green)))
durant$name <- c(rep("Kevin Durant", nrow(durant)))                
thompson$name <- c(rep("Klay Thompson", nrow(thompson)))
curry$name <- c(rep("Stephen Curry", nrow(curry)))

# Change the original values of shot_made_flag to more descriptive values
# replace "n" with "shot_no", and "y" with "shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"

# Add a column minute that contains the minute number where a shot occurred
# according to the example, minute = 12 * period - remaining
iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
thompson$minute = thompson$period * 12 - thompson$minutes_remaining
curry$minute = curry$period * 12 - curry$minutes_remaining

# Use sink() to send the summary() output of each imported data frame into individuals text files
getwd()
sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

# Use the row binding function rbind() to stack the tables into one single data frame (or tibble object)
stacked = rbind(iguodala, green, durant, thompson, curry)
stacked

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder data/
write.csv(stacked, file = "../data/shots_data.csv")

# Use sink() to send the summary() output of the assembled table
sink(file = "../output/shots_data_summary.txt")
summary(stacked)
sink()




