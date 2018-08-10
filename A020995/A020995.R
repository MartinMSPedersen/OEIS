library(gmp)


candidate <- 39001
while (candidate < 1e9) {
	x <- as.character(fibnum(candidate))
	sum <- 0
	for (i in 1:nchar(x)) {
		sum <- sum + as.integer(substr(x,i,i))
	}
	if (sum == candidate) {
		print(sum)
	}
	if (candidate %% 1e2 == 0) {
	 	cat("CHECKPOINT: ")
		cat(candidate)
		cat("\n")
	}
	candidate <- candidate + 1
}
