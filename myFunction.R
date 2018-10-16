myFunction = function (maze){
  row_names = c('monster', 'wobbie', 'action', 'Q')
  # nr of legal moves: 84
  # nr total moves: 26*5
  nr_states = 26*5*27+1
  Q = rep(0,nr_states)
  
  Q[nr_states] = 1000
  counter = 0
  for (i in seq(1, nr_states-1, by=27*5)) {
    for (j in 0:4) {
      Q[i+j+ counter] = -1000
    }
    counter = counter +5
  }
  


output = 0; 
return output;
}