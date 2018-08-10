library(gmp)


candidate <- 3244369
while (candidate < 1e9) {
	if (isprime(fibnum(candidate))) {
		print(candidate)
	}
	#if (candidate %% 1e1 == 0) {
	 	cat("CHECKPOINT: ")
		cat(candidate)
		cat("\n")
	#}
	candidate <- candidate + 1
}
