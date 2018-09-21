# computes and store the first 1.000.000 values of the Kolakoski sequence

SIZE <- 1e6
kolakoski <- vector("integer", SIZE)
OUTPUT <- TRUE


# init
kolakoski[1] <- 1
kolakoski[2] <- 2
kolakoski[3] <- 2
read_idx <- 3
write_idx <- 4

while (write_idx < SIZE) {
	kolakoski[write_idx] <- 3-kolakoski[write_idx-1]
	write_idx <- write_idx + 1
	if (kolakoski[read_idx] == 2) {
		kolakoski[write_idx] <- kolakoski[write_idx-1]
		write_idx <- write_idx + 1
	} 
	read_idx <- read_idx + 1
}
if (write_idx == SIZE) {
	kolakoski[write_idx] <- 3-kolakoski[write_idx-1]
}

if (OUTPUT) {
	for (idx in seq_along(kolakoski)) {	
		cat(idx," ",kolakoski[[idx]],"\n",sep="")
	}
}


	
