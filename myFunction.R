myFunction = function (maze){
  
  decideAction = function(cont, maze_) {
    if(is.null(cont$Q)){
      #show("nu skapas Q!!")
      # nr sates: 27*27
      # nr moves per state: 5
      Q = rep(0,27*5*27)
      cont$Q = Q
      cont$moves = c(2,4,5,6,8)
      cont$oldQindex = 0
      # alpha - probability of random move (exploration)
      # lambda - learning rate 
      # gamma - Q' learning rate
      cont$alpha = 0.6
      cont$lambda = 0.01
      cont$gamma = 1
      
      visits = rep(1,27*5*27)
      cont$visits = visits
      
      cont$doRand = TRUE
    }
    
    # wobbies and monsters node NR
    nodeNr_wobbie = which(maze_$maze$x == maze_$wobbie[1] & maze_$maze$y == maze_$wobbie[2])
    nodeNr_monster = which(maze_$maze$x == maze_$monster1[1] & maze_$maze$y == maze_$monster1[2])
    
    # Q-vals of the five possible moves in this state (5 element vector)
    Q_vals = cont$Q[(nodeNr_monster-1)*27*5 + (nodeNr_wobbie-1)*5+ c(1,2,3,4,5)]
    #show("Q_vals")
    #show(Q_vals)
    
    # selecting the best move
    moves = which(max(Q_vals) == Q_vals)
    #show("moves")
    #show(moves)
    if(length(moves) > 1){
      bestMove = sample(moves,1)
    }
    else{
      bestMove = moves
    }
    
    #show("bestMove")
    #show(bestMove)
    finalMove = cont$moves[bestMove]
    
    # sampling random move with probability alpha
    
    
    if (cont$doRand){
      if(runif(1) < cont$alpha){
        finalMove = sample(cont$moves,1)
      }
    }
    
    #show("finalMove")
    #show(finalMove)
    
    #saving oldQindex
    
    cont$oldQindex = (nodeNr_monster-1)*27*5 + (nodeNr_wobbie-1)*5 + which(finalMove == cont$moves)
    cont$visits[cont$oldQindex] = cont$visits[cont$oldQindex] + 1
    #show("cont$oldQindex")
    #show(cont$oldQindex)
    
    return(list(move = finalMove, control = cont, doRand = TRUE))
  }
  
  update = function(cont, maze_) {
    # wobbies and monsters node NR
    nodeNr_wobbie = which(maze_$maze$x == maze_$wobbie[1] & maze_$maze$y == maze_$wobbie[2])
    nodeNr_monster = which(maze_$maze$x == maze_$monster1[1] & maze_$maze$y == maze_$monster1[2])
    
    # Q-vals of the five possible moves in this state (5 element vector)
    Q_prime = cont$Q[(nodeNr_monster-1)*27*5 + (nodeNr_wobbie-1)*5 + c(1,2,3,4,5)]
    Q_prime = max(Q_prime)*cont$gamma + maze_$reward

    cont$lambda = 60/(60 + cont$visits[cont$oldQindex])
    cont$alpha = 60/(60 + cont$visits[cont$oldQindex])
    #show("lambda")
    #show(cont$lambda)
    
    cont$Q[cont$oldQindex] = cont$Q[cont$oldQindex] - cont$lambda*(cont$Q[cont$oldQindex] - Q_prime)
    #if (maze_$finished == TRUE || maze_$alive == FALSE){
      #show("alpha")
      #show(cont$alpha)
      #
      #cont$alpha = cont$alpha - 0.005
      #if (cont$alpha > 0.001){
      #   cont$alpha = cont$alpha - 0.0008
      #} else {
      #  cont$alpha = cont$alpha/2
      #}
      #cont$alpha = cont$alpha - 0.0001
    #}
    #if (cont$alpha<0.001){
    #  cont$lambda = 0.004;
    #}
    #if( cont$lambda > 0.01)
    #  cont$lambda = cont$lambda -0.01
    ##show("maze_")
    ##show(maze_)
    ##show("cont")
    ##show(cont)
    #show("----------------------------")
    return(cont)
  }
  
  return(list(decideAction = decideAction, update = update, doRand = TRUE))
  
}