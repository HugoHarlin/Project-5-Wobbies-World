myFunction = function (maze){
  
  decideAction = function(cont, maze_) {
    if(is.null(cont$Q)){
      show("nu skapas Q!!")
      # nr sates: 27*27
      # nr moves per state: 5
      Q = rep(0,27*5*27)
      cont$Q = Q
    }
    
    nodeNr = match(maxe_$wobbie[1],maze_$wobbie[,1]
    which(maze_maze)
    
    return(list(move = sample(c(2, 4, 6, 8), 1), control = cont))
  }

  update = function(cont, maze_) {
    show("maze_")
    show(maze_)
    #show("cont")
    #show(cont)
    show("----------------------------")
    return(cont)
  }
  
  return(list(decideAction = decideAction, update = update, doRand = TRUE))
  
}