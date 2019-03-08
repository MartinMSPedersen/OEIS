#https://oeis.org/A228474
# simple and faster version but uses a lot of memory

SIZE <- 8000
DEBUG <- FALSE

visited_positive <- vector('logical', 1e8)
visited_negative <- vector('logical', 1e8)

in_a_interval <- function(v) {
	if (v > 0) { return(visited_positive[[v]]) }
        if (v < 0) { return(visited_negative[[-v]]) }
	return(FALSE) # v == 0
}

add_value <- function(v) {
	if (v > 0) { visited_positive[[v]] <<- TRUE }
	if (v < 0) { visited_negative[[-v]] <<- TRUE }
}


start_value <- 0

while (start_value < SIZE) {
	value <- start_value
	step <- 0
	visited_positive <- vector('logical', 1e8)
	visited_negative <- vector('logical', 1e8)
	add_value(value)
	while (value != 0) {
		step <- step + 1
		if (DEBUG) cat("DEBUG: ", value, step, "\n")
		if (value > 0) {
			if (!in_a_interval(value-step)) {
				value <- value - step
			} else {
				value <- value + step
			}
		} else {
			if (!in_a_interval(value+step)) {
				value <- value + step
			} else {
				value <- value - step
			}
		}
		add_value(value)	
	}
	cat(start_value, step, "\n")
	start_value <- start_value + 1
}
