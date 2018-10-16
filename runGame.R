runGame = function (maze = makeWobbiesWorld(), control = makeRandomController(maze), 
          seed = NA, doPlot = F, pause = 1) 
{
  if (!is.na(seed)) 
    set.seed(seed)
  score = 0
  turn = 0
  if (doPlot) 
    plot(maze, paste("Wobbie's World   Turn:", turn, " Score:", 
                     score), pause)
  while (maze$alive && !maze$finished) {
    turnRes = takeTurn(maze, control)
    maze = turnRes$maze
    control = turnRes$control
    turn = turn + 1
    score = score + maze$reward
    if (doPlot) 
      plot(maze, paste("Wobbie's World   Turn:", turn, 
                       " Score:", score), pause)
  }
  list(control = control, score = score, turn = turn)
}