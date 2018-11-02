makeOwnController = function(maze){
  decideAction = function(cont, maze_) {
    #show(cont)
    show(maze_)
    show("Row number wobbie")
    a = which(maze_$maze$x == maze_$wobbie[1] & maze_$maze$y == maze_$wobbie[2])
    b = which(maze_$maze$x == maze_$monster1[1] & maze_$maze$y == maze_$monster1[2])
    show(a)
    show("Row number monster")
    show(b)
    Q = cont$Q
    if(is.null(Q)){
      show("creating Q first time")
      Q = rep(0,10)
      show("Q")
      show(Q)
    }
    #Q[1] = Q[1] + 1;
    #show("Q")
    #show(Q)
    m <- readline(prompt="Where do you want to move? 2 - down, 5 - stand still 4 - left, 6 - right 8 - up")
    m <- as.integer(m)
    cont$Q = Q
    #list(move = sample(c(2, 4, 6, 8), 1), control = cont)
    list(move = m, control = cont)
    
  }
  update = function(cont, maze_) {
    Q = cont$Q
    Q[1] = Q[1] + 1
    cont$Q = Q
    return(cont)
    if (maze_$finished == TRUE || maze_$alive == FALSE){
      #show("alpha")
      #show(cont$alpha)
      #
      #cont$alpha = cont$alpha - 0.005
      if (cont$alpha > 0.01){
        cont$alpha = cont$alpha - 0.006
      } else {
        cont$alpha = cont$alpha/2
      }
      #cont$alpha = cont$alpha - 0.0001
    }
    if (cont$alpha<0.001){
      cont$lambda = 0.004;
    }
  }
  list(decideAction = decideAction, update = update)
}