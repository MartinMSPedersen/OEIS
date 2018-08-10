#https://cran.r-project.org/web/packages/hashmap/README.html

library(hashmap)

in_a_interval <- function(v) {
  FALSE
}

add_value <- function(v) {
}

low <- hashmap(0, 0)
high <- hashmap(0, 0)

step <- 1
value <- 0

cat("0 0\n")
while (step < 10) {
	if ((value-step>0) && (!in_a_interval(value-step))) {
		value <- value - step
	} else {
		value <- value + step
	}
	cat(step,value,"\n")
	add_value(value)
	step <- step + 1
}










