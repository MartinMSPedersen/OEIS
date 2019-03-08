#https://oeis.org/A228474

SIZE <- 8000

in_a_interval <- function(v) {
	for (interval in intervals) {
		if (v>=interval[["low"]] && v<=interval[["high"]]) return(TRUE)
	}
	FALSE
}

# don't call this if in_a_interval(v) is TRUE
add_value <- function(v) {
	found <- FALSE
	found_high <- FALSE
	found_low <- FALSE
	for (idx in seq_along(intervals)) {
		low <- intervals[[idx]]["low"]
		high <- intervals[[idx]]["high"]

		if (v+1 == low) {
			found_low <- TRUE
			found <- TRUE
			low_idx <- idx
		} else 
		if (v-1 == high) {
			found_high <- TRUE
			found <- TRUE
			high_idx <- idx
		}
		if (found_high && found_low) break
	}
	if (!found) {
		intervals <<- append(intervals,list(c(low = v, high = v)))
		return(invisible())
	}
	if (found_low) {
		if (found_high) {
			intervals[[low_idx]][["low"]] <<- intervals[[high_idx]][["low"]]
			intervals[[high_idx]] <<- NULL
		} else {
			intervals[[low_idx]][["low"]] <<- v
		}
			
		return(invisible())
	}
	if (found_high) {
		intervals[[high_idx]]["high"] <<- v
		return(invisible())
	}
	stop("This should never happen")
}

#intervals <- list(c(low = 0, high = 0))
start_value <- 0

while (start_value < SIZE) {
	value <- start_value
	step <- 0
	intervals <- list()
	add_value(value)
	while (value != 0) {
		step <- step + 1
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
