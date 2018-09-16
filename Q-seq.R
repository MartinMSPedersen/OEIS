# Q(n) = Q(n-Q(n-1)) + Q(n-Q(n-2))

cache <- vector("integer", 0)
cache[1] <- 1
cache[2] <- 1

Q <- function(n) {
  if (is.na(cache[n])) {
    value <- Q(n-Q(n-1)) + Q(n-Q(n-2))
    cache[n] <<- value
  }
  cache[n]
}

df <- data.frame()

for (idx in 1:250000) {
  df <- rbind(df, c(idx, Q(idx)/idx))
}

png( filename = "Q-sequence.png", width = 5000, height = 5000)

plot(df, type = 'l', ylim = c(0.4,0.6), xlab = "n", ylab = "Q(n)/n")

dev.off()