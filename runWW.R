runWW = function (makeController = makeRandomController, verbose = FALSE, 
          doPlot = FALSE, seed = NA) 
{
  startTime = Sys.time()
  if (!is.na(seed)) 
    set.seed(seed)
  maze = makeWobbiesWorld()
  control = learn(control = makeController(maze), verbose = verbose, 
                  doPlot = doPlot)$control
  control$doRand = FALSE
  scrs = test(control)
  endTime = Sys.time()
  timeTaken = as.numeric(endTime) - as.numeric(startTime)
  cat("\nTime taken:", timeTaken, "seconds.\n")
  c(mean(scrs), timeTaken)
}