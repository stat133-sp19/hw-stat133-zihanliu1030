# title: Shot Data Preparation.
# description: Prepare data files that will contain the required variables to be used in the visualization phase.
# input(s): https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/andre-iguodala.csv;
# https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/draymond-green.csv;
# https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/kevin-durant.csv;
# https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/klay-thompson.csv;
# https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/data/stephen-curry.csv.
# output(s): combined, curry, durant, green, iguodala, thompson,
# andre-iguodala-summary.txt, draymond-green-summary.txt,kevin-durant-summary.txt, klay-thompson-summary.txt,stephen-curry-summary.txt,
# shots-data.csv, shots-data-summary.txt.

library(readr)
library(dplyr)

setwd("C:/Users/zihan/Desktop/WORK-OUTs/workout01/data")
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala$name <- rep('Andre Iguodala',nrow(iguodala))
iguodala <- iguodala[c(ncol(iguodala),1:(ncol(iguodala)-1))]
green$name <- rep('Graymond Green',nrow(green))
green <- green[c(ncol(green),1:(ncol(green)-1))]
durant$name <- rep('Kevin Durant',nrow(durant))
durant <- durant[c(ncol(durant),1:(ncol(durant)-1))]
thompson$name <- rep('Klay Thompson',nrow(thompson))
thompson<- thompson[c(ncol(thompson),1:(ncol(thompson)-1))]
curry$name <- rep('Stephen Curry',nrow(curry))
curry <- curry[c(ncol(curry),1:(ncol(curry)-1))]

iguodala$shot_made_flag[iguodala$shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[iguodala$shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[green$shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[green$shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[durant$shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[durant$shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[curry$shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[curry$shot_made_flag == 'y'] <- 'shot_yes'

iguodala$minute <- 12 * iguodala$period - iguodala$minutes_remaining
green$minute <- 12 * green$period - green$minutes_remaining
durant$minute <- 12 * durant$period - durant$minutes_remaining
thompson$minute <- 12 * thompson$period - thompson$minutes_remaining
curry$minute <- 12 * curry$period - curry$minutes_remaining

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()
sink("../output/draymond-green-summary.txt")
summary(green)
sink()
sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()
sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()
sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()

combined <- rbind(iguodala,green,durant,thompson,curry)
combined

write.csv(combined,"../data/shots-data.csv")

sink("../output/shots-data-summary.txt")
summary(combined)
sink()