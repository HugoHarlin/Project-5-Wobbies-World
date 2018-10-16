makeOwnController = function(maze){
  decideAction = function(cont, maze_) {
    #show(maze_)
    show(cont)
    m <- readline(prompt="Where do you want to move? 2 - down, 4 - left, 6 - right 8 - up")
    m <- as.integer(m)
    list(move = m, control = cont)
  }
  update = function(cont, maze_) {
    return(cont)
  }
  list(decideAction = decideAction, update = update, doRand = FALSE)
}