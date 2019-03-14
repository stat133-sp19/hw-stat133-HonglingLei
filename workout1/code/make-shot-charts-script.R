
# title: shot-charts
# description: plotting of shots
# inputs: nba-court.jpg, five previous .csv files, the combined .csv file
# outputs: plotting of shots, separately and combined, in PDF and PNG formats

library(ggplot2)
library(jpeg)
library(grid)

iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)


thompson_scatterplot = ggplot(data = thompson)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))
thompson_scatterplot

# court_image (to be used as background of plot)
court_file = "../images/nba-court.jpg"

# create raste object
court_image = rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))
court_image

# shot chart with court background
klay_shot_chart = ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson (2016 season)")+
  theme_minimal()
klay_shot_chart

# save the graphs as a pdf in the /images file
pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson (2016 season)")+
  theme_minimal()
dev.off()

pdf("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = iguodala)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Andre Iguodala (2016 season)")+
  theme_minimal()
dev.off()

pdf("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Draymond Green (2016 season)")+
  theme_minimal()
dev.off()  

pdf("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = durant)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Kevin Durant (2016 season)")+
  theme_minimal()
dev.off()  

pdf("../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = curry)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Stephen Curry (2016 season)")+
  theme_minimal()
dev.off()  
  
# Create one graph, using facetting, to show all the shot charts in one image
shots_data.csv = read.csv("../data/shots_data.csv")

# save this file in PDF format
pdf("../images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = shots_data.csv)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  facet_wrap(~name)+
  ggtitle("Shot Charts: GSW (2016 season)")+
  theme(legend.position="top")+
  theme(legend.title = element_blank())
dev.off()
  
# save this file in PNG format
png("../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 200) # THE DEFAULT SIZE IS IN PX RATHER THAN INCH!!!
ggplot(data = shots_data.csv)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  facet_wrap(~name)+
  ggtitle("Shot Charts: GSW (2016 season)")+
  theme(legend.position="top")+
  theme(legend.title = element_blank())
dev.off()

# I also saved all the individual plottings as .PNG, as I'll use them in the report
png("../images/klay-thompson-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson (2016 season)")+
  theme_minimal()
dev.off()

png("../images/andre-iguodala-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Andre-Iguodala (2016 season)")+
  theme_minimal()
dev.off()

png("../images/draymond-green-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Draymond Green (2016 season)")+
  theme_minimal()
dev.off() 

png("../images/keven-durant-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Kevin Durant (2016 season)")+
  theme_minimal()
dev.off() 

png("../images/stephen-curry-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Stephen Curry (2016 season)")+
  theme_minimal()
dev.off() 
