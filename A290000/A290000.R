# A290000

library(gmp)

record <- 0
p1 <- 2

i <- 1
while(p1<1e9) {
  p2 <- nextprime(p1)
  if (p2-p1 > record) {
    cat(i,as.character(p1),"\n")
    i <- i + 1
    cat(i,as.character(p2),"\n")
    i <- i + 1
    record <- (p2-p1)
  }
  p1 <- p2
}
