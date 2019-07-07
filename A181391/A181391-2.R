vaneckw <-function(howmany = 100) {
	howmany = round(howmany[1])
	ve = c(0, 0)
	for (jj in 2:(howmany)) {
		thefind <- which(ve[1:(jj-1)] == ve[jj])
		if (length(thefind)) {
			ve <- c(ve, jj-thefind[length(thefind)])

		} else ve <- c(ve, 0)
	}
	return(invisible(ve))
}
