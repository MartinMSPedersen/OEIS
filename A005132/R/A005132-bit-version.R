library(bit)

DEBUG <- TRUE
SIZE <- Inf

visited <- bit(2e9)

in_a_interval <- function(v) {
	visited[[v+1]] 
}

add_value <- function(v) {
	visited[[v+1]] <<- TRUE
}

add_value(0)
step <- 1
value <- 0

if (DEBUG) cat("0 0\n")
while (step < SIZE) {
	if ((value-step>0) && (!in_a_interval(value-step))) {
		value <- value - step
	} else {
		value <- value + step
	}
	add_value(value)
	if (DEBUG) cat(step,value,"\n")
	step <- step + 1
}

cat(step, value,"\n")

