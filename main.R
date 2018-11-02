rm(list = ls())
setwd("/Users/KGirl/Documents/GitHub/Project-5-Wobbies-World/")
#setwd("~/Teknisk Fysik/AI/Project-5-Wobbies-World")
library(WobbiesWorld)
source("myFunction.R")
source("makeOwnController.R")
#res = runGame(control = myFunction(maze), doPlot = T)

#set.seed(0)
#control = learn(n = 10000, control = myFunction(maze), verbose = FALSE)$control
#scores = test(control = control)
#runGame(control = control, doPlot = T)
#runGame(control = makeOwnController(maze), doPlot = T)
runWW(makeController = myFunction, doPlot = TRUE, seed = 0)

