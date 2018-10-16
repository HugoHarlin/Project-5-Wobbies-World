makeOwnController = function(maze){
  decideAction = function(cont, maze_) {
    list(move = sample(c(2, 4, 6, 8), 1), control = cont)
  }
  update = function(cont, maze_) {
    return(cont)
  }
  show(maze)
  list(decideAction = decideAction, update = update, doRand = TRUE)
}