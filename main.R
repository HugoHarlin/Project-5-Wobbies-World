rm(list = ls())
setwd("/Users/KGirl/Documents/GitHub/Project-5-Wobbies-World/")
#setwd("~/Teknisk Fysik/AI/Project-5-Wobbies-World")
library(WobbiesWorld)
source("makeOwnController.R")
res = runGame(control = makeOwnController(maze), doPlot = T)
#runWW(makeController = makeRandomController)

