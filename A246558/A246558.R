library(gmp)


candidate <- 0
while (candidate < 1e9) {
	x <- as.character(fibnum(candidate))
	product <- 1
	for (i in 1:nchar(x)) {
		sum <- product * as.integer(substr(x,i,i))
		if (sum == 0) break
	}
	if (sum != 0) {
		print(candidate)
	}
	if (candidate %% 1e3 == 0) {
	 	cat("CHECKPOINT: ")
		cat(candidate)
		cat("\n")
	}
	candidate <- candidate + 1
}
