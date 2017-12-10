plotloc <- function(loc = loc){
  
  df6 <- data.frame(
    group = c("A", "B", "C", "D", "E", "F"),
    value = c(100/6, 100/6, 100/6, 100/6, 100/6, 100/6)
  )

  if(loc == 1){
    y <- 9
  }
  if(loc == 2){
    y <- 25
  }
  if(loc == 3){
    y <- 40
  }
  if(loc == 4){
    y <- 60
  }
  if(loc == 5){
    y <- 75
  }
  if(loc == 6){
    y <- 92
  }
  
  ggplot2::ggplot(data=df6, aes(x=factor(1), y=value, fill=factor(group), label=group)) +
    geom_bar(width=1, stat="identity") +
    coord_polar(theta="y") +
    ylab("") +
    xlab("") +
    labs(fill="") +
    theme(legend.position = "none",   ### Solution to part 1, no legend
          axis.ticks = element_blank(), 
          panel.grid = element_blank(), 
          axis.text  = element_blank())+ annotate("point", x = 1, y = y, size=5)+annotate("text", x=1.6,y=9,label="1")+
    annotate("text", x=1.6,y=25,label="2")+annotate("text", x=1.6,y=40,label="3")+annotate("text", x=1.6,y=60,label="4")+
    annotate("text", x=1.6,y=75,label="5")+annotate("text", x=1.6,y=91,label="6") 
}