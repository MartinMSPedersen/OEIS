# computes and store the first 1.000.000 values of the Kolakoski sequence
library(magick)

SIZE <- 64
SIZE_SQUARE <- SIZE*SIZE

kolakoski <- vector("integer", SIZE_SQUARE)
OUTPUT <- FALSE


# init
kolakoski[1] <- 1
kolakoski[2] <- 2
kolakoski[3] <- 2
read_idx <- 3
write_idx <- 4

while (write_idx < SIZE_SQUARE) {
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

kolakoski_cum <- cumsum(kolakoski*2-3)
k <- matrix(as.logical(kolakoski-1),SIZE, byrow = TRUE)
k <- t(apply(k,2,rev))
png("kolakoski-64x64.png", width = SIZE*8, height = SIZE*8)
#  no margin
par(mar = rep(0, 4))
image(k, axes = FALSE, col = grey(seq(0, 1, length = 256)))
dev.off()
