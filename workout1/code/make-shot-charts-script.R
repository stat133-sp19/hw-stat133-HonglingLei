
# title: shot-charts
# description: plotting of chots
# inputs:
# outputs:

library(ggplot2)
library(jpeg)
library(grid)

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

# save the graph as a pdf in the /images file
pdf("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle("Shot Chart: Klay Thompson (2016 season)")+
  theme_minimal()
dev.off()

  
  
  
  
  