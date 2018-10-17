learn = function (n = 10000, maze = makeWobbiesWorld(), control = makeRandomController(maze), 
          verbose = TRUE, doPlot = TRUE, every = 100, col = 1, ymin = -1000) 
{
  plotStarted = FALSE
  score = c()
  turns = c()
  for (i in 1:n) {
    res = runGame(maze, control)
    
    
    if (verbose) 
      cat("\nRun:", i, " Turn:", res$turn, " Score:", res$score)
    score = c(score, res$score)
    turns = c(turns, res$turn)
    control = res$control
    if (doPlot && i%%every == 0) {
      if (plotStarted) {
        points(i/every, mean(score[(i - every):i]), col = col)
      }
      else {
        plot(i/every, mean(score[(i - every):i]), xlim = c(0, 
                                                           n/every), ylim = c(ymin, 1000), col = col, 
             xlab = paste("Batch of ", every, "runs"), ylab = "Average Score")
        plotStarted = T
      }
    }
  }
  list(control = control, score = score, turns = turns)
}