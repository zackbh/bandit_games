getdistance <- function(loc, trueloc){
  if(trueloc == 1){
    if(loc == 1){
      d<-0
    }
    if(loc == 2 | loc == 6){
      d<-1
    }
    if(loc == 3 | loc == 5){
      d<-2
    }
    if(loc == 4){
      d<-3
    }
  }
  if(trueloc == 2){
    if(loc == 2){
      d<-0
    }
    if(loc == 1 | loc == 3){
      d<-1
    }
    if(loc == 6 | loc == 4){
      d<-2
    }
    if(loc == 5){
      d<-3
    }
  }
  if(trueloc == 3){
    if(loc == 3){
      d<-0
    }
    if(loc == 2 | loc == 4){
      d<-1
    }
    if(loc == 1 | loc == 5){
      d<-2
    }
    if(loc == 6){
      d<-3
    }
  }
  if(trueloc == 4){
    if(loc == 4){
      d<-0
    }
    if(loc == 3 | loc == 5){
      d<-1
    }
    if(loc == 2 | loc == 6){
      d<-2
    }
    if(loc == 1){
      d<-3
    }
  }
  if(trueloc == 5){
    if(loc == 5){
      d<-0
    }
    if(loc == 4 | loc == 6){
      d<-1
    }
    if(loc == 3 | loc == 1){
      d<-2
    }
    if(loc == 2){
      d<-3
    }
  }
  if(trueloc == 6){
    if(loc == 6){
      d<-0
    }
    if(loc == 1 | loc == 5){
      d<-1
    }
    if(loc == 2 | loc == 4){
      d<-2
    }
    if(loc == 3){
      d<-3
    }
  }
  return(d)
}