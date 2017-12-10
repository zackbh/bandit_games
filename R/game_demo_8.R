gamedemo8 <- function(rounds = 20, print=FALSE){
  
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 needed for this function to work. Please install it.",
         call. = FALSE)
  }
  
  
  # Load helper scripts
  devtools::load_all()
  
  
  numloc <- 8
  trueloc <- sample(1:numloc, 1)
  locchoice <- rep(0, numloc)
  locreward <- matrix(0, nrow = rounds + 1, ncol = numloc)
  locaverage <- rep(0, numloc)
  totalreward <- rep(0, rounds)
  totalcost <- 0
  for (t in 1:rounds){
    cat("It is round number", t, "\n")
    if(t == 1){
      for (i in 1:numloc){
        loc = i
        locchoice[loc] = 1
        d <- getdistance8(loc = loc, trueloc = trueloc)
        w.shape = 3
        w.scale = 30
        reward <- rweibull(1, shape = w.shape, scale= w.scale * ((10-d) / 10)) 
        epsilon <- runif(1)
        if(epsilon >= .5){
          shock <- rnorm(1, -4, 1)
        }else{
          shock <- rnorm(1, 4, 1)
        }
        reward <- reward + shock
        locreward[t,loc] <- reward
        locaverage[loc] <- sum(locreward[, loc]) / locchoice[loc] 
      }
      loc <- sample(1:numloc,1)
      currentloc <- loc
      cat("You begin at location:", loc, "\n")
    }
    else{
      loc <- as.integer(readline(prompt = "Choose a location:"))
    }
    if(loc == currentloc){
      cost = 0
    }
    else{
      cost = 15
    }
    foo <- plotloc8(loc = loc)
    plot(foo)
    locchoice[loc] <- locchoice[loc] + 1
    d <- getdistance8(loc = loc, trueloc = trueloc)
    w.shape = 3
    w.scale = 30
    reward <- rweibull(1,shape = w.shape, scale= w.scale * ((10-d)/10)) #rgamma(1, shape = 30/d, rate=1) 
    epsilon <- runif(1)
    if(epsilon >= .5){
      shock <- rnorm(1, -4, 1)
    }else{
      shock <- rnorm(1, 4, 1)
    }
    currentloc <- loc
    reward <- reward + shock
    cat("You receive:",format(reward, digits=1),"\n")
    if(cost > 0){
      cat("You pay moving cost:", cost,"\n")
      cat("Making your payoff =", format(reward-cost, digits=1),"\n")
    }
    totalcost <- totalcost + cost
    locreward[t,loc] <- reward
    locaverage[loc] <- sum(locreward[,loc])/locchoice[loc] 
    totalreward[t] <- sum(reward) - cost
    totreward <- sum(totalreward)
    avgreward <- totreward/t
    cat("Your total rewards so far:", format(totreward, digits=1), "\n")
    cat("Your location choices so far: \n", paste("{", locchoice, "}"), sep=" . ", fill=TRUE)
    cat("Your obsered average reward by location: \n",paste("{", format(locaverage, digits=1), "}"), sep=" . ","\n")
  }
  
  cat("Your optimal location was location",trueloc,"\n")
  cat("You spent",locchoice[trueloc]/t,"of your time there \n")
  cat("Your total regret is", format((rounds-1)*(w.scale * gamma(1+(1/w.shape))) - totreward - 15, digits=2), "\n")
  cat("You spent",totalcost,"moving between locations \n")
}