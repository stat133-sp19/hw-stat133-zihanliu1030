# title: Shot Data Charts.
# description: Visualization of data files prepared during the previous phase.
# input(s): combined, curry, durant, green, iguodala, thompson,
# andre-iguodala-summary.txt, draymond-green-summary.txt,kevin-durant-summary.txt, klay-thompson-summary.txt,stephen-curry-summary.txt,
# shots-data.csv, shots-data-summary.txt.
# https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg.
# output(s): klay_scatterplot, court_file, court_image;
# iguodala_shot_chart, green_shot_chart, durant_shot_chart, thompson_shot_chart, curry_shot_chart, facetted;
# andre-iguodala-shot-chart.pdf, draymond-green-shot-chart.pdf, kevin-durant-shot-chart.pdf,
# klay-thompson-shot-chart.pdf, stephen-curry-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png.

library(readr)
library(dplyr)
library(ggplot2)
library(jpeg)
library(grid)

klay_scatterplot <- ggplot(data = thompson) +
  geom_point(aes(x = x, y = y, color = shot_made_flag))

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave("../images/andre-iguodala-shot-chart.pdf", plot = iguodala_shot_chart, width = 6.5, height = 5, units = "in")

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave("../images/draymond-green-shot-chart.pdf", plot = green_shot_chart, width = 6.5, height = 5, units = "in")

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave("../images/kevin-durant-shot-chart.pdf", plot = durant_shot_chart, width = 6.5, height = 5, units = "in")

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave("../images/klay-thompson-shot-chart.pdf", plot = thompson_shot_chart, width = 6.5, height = 5, units = "in")

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave("../images/stephen-curry-shot-chart.pdf", plot = curry_shot_chart, width = 6.5, height = 5, units = "in")

facetted <- ggplot(data = combined) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name)
ggsave("../images/gsw-shot-charts.pdf", plot = facetted, width = 8, height = 7, units = "in")
ggsave("../images/gsw-shot-charts.png", plot = facetted, width = 8, height = 7, units = "in")