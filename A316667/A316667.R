# computing A316667

xcoord <- function(n) {
	ifelse(n == 1,
	       1,
	       round(xcoord(n-1) + sin((floor(sqrt(4*(n-2)+1))%%4)*pi/2))
	)
}

ycoord <- function(n) {
	ifelse(n == 0,
	       1,
	       round(ycoord(n-1) - cos((floor(sqrt(4*(n-1)+1))%%4)*pi/2))
	)
}


