# A290000

library(gmp)

record <- 0
p1 <- 297501075797

i <- 1

#setwd("OEIS/A290000")
while(TRUE) {
  p2 <- nextprime(p1) 
  if (p2-p1 > record) {
    sink("b290000.txt", append = TRUE)
    cat(i,as.character(p1),"\n")
    i <- i + 1
    cat(i,as.character(p2),"\n")
    sink()
    i <- i + 1
    record <- (p2-p1)
  }
  p1 <- p2
}
