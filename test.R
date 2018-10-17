test = function (control, n = 500) 
{
  scrs = c()
  for (i in 1:n) scrs = c(scrs, runGame(control = control)$score)
  cat("\nScores Mean:", mean(scrs))
  cat("\nScore Std Dev:", sd(scrs))
  return(scrs)
}