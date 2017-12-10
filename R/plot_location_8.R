plotloc8 <- function(loc = loc){

  df8 <- data.frame(
    group = c("A", "B", "C", "D", "E", "F", "G","H"),
    value = c(100/8, 100/8, 100/8, 100/8, 100/8, 100/8, 100/8, 100/8)
  )
  
  if(loc == 1){
    y <- 7
  }
  if(loc == 2){
    y <- 19
  }
  if(loc == 3){
    y <- 31
  }
  if(loc == 4){
    y <- 43
  }
  if(loc == 5){
    y <- 57
  }
  if(loc == 6){
    y <- 69
  }
  if(loc == 7){
    y <- 81
  }
  if(loc == 8){
    y <- 94
  }
  ggplot2::ggplot(data = df8, aes(x = factor(1), y=value, fill = factor(group), label=group)) +
    geom_bar(width=1, stat="identity") +
    coord_polar(theta="y") +
    scale_fill_brewer(palette = "Spectral")+
    ylab("") +
    xlab("") +
    labs(fill="") + theme_bw()+
    theme(legend.position = "none",
          axis.ticks = element_blank(), 
          panel.grid = element_blank(), 
          axis.text  = element_blank())+ annotate("point", x = 1, y = y, size=5)+annotate("text", x=1.6,y=7,label="1")+
    annotate("text", x=1.6,y=19,label="2")+annotate("text", x=1.6,y=31,label="3")+annotate("text", x=1.6,y=43,label="4")+
    annotate("text", x=1.6,y=57,label="5")+annotate("text", x=1.6,y=69,label="6")+annotate("text", x=1.6,y=81,label="7")+
    annotate("text", x=1.6,y=94,label="8")  
}