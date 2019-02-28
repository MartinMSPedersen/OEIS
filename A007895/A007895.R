# A007895

fib <- vector("numeric",1000)
fib[[1]] <- 1
fib[[2]] <- 1
for (idx in 3:1000) {
  fib[[idx]] <- fib[[idx - 1]] + fib[[idx - 2]]
}

zeckendorf <- function(num) {
  for (idx in 1:1000) {
    if (fib[[idx]] > num) {
      idx <- idx -1
      fnum <- fib[[idx]]
      num <- num - fnum
      if (num == 0) {
        return(fnum)
      } else {
        return(c(fnum, c(zeckendorf(num))))
      }
    }
  }
}

cat("0 0")
for (idx  in 1:50) {
  l <- zeckendorf(idx)
  cat(idx, length(l))
  #cat(idx,":",paste(l,sep = ""),":",length(l))
  cat("\n")
}


