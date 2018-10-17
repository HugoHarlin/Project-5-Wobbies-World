myFunction = function (maze){
  
  decideAction = function(cont, maze_) {
    if(is.null(cont$Q)){
      show("nu skapas Q!!")
      # nr sates: 27*27
      # nr moves per state: 5
      Q = rep(0,27*5*27)
      cont$Q = Q
      cont$moves = c(2,4,5,6,8)
      cont$alpha = 0.01
    }
    # wobbies and monsters node NR
    nodeNr_wobbie = which(maze_$maze$x == maze_$wobbie[1] & maze_$maze$y == maze_$wobbie[2])
    nodeNr_monster = which(maze_$maze$x == maze_$monster1[1] & maze_$maze$y == maze_$monster1[2])
    
    # Q-vals of the five possible moves in this state (5 element vector)
    Q_vals = cont$Q[(nodeNr_monster-1)*27*5 + (nodeNr_wobbie-1)*5+ c(1,2,3,4,5)]
    show("Q_vals")
    show(Q_vals)
    
    # selecting the best move
    moves = which(max(Q_vals) == Q_vals)
    show("moves")
    show(moves)
    if(length(moves) > 1){
      bestMove = sample(moves,1)
    }
    else{
      bestMove = moves
    }
    
    show("bestMove")
    show(bestMove)
    finalMove = cont$moves[bestMove]
    
    # sampling random move with probability alpha
    if(runif(1) < cont$alpha){
      finalMove = sample(cont$moves,1)
    }
    show("finalMove")
    show(finalMove)
    
    return(list(move = finalMove, control = cont))
  }
  
  update = function(cont, maze_) {
    #show("maze_")
    #show(maze_)
    #show("cont")
    #show(cont)
    show("----------------------------")
    return(cont)
  }
  
  return(list(decideAction = decideAction, update = update, doRand = TRUE))
  
}