kolakoski <- function(initVector, how_many) {
  kolakoski <- initVector

  read_idx <- length(initVector) # hmm
  write_idx <- length(initVector) + 1
  while (write_idx < how_many) {
	  kolakoski[write_idx] <- 3-kolakoski[write_idx-1]
	  write_idx <- write_idx + 1
	  if (kolakoski[read_idx] == 2) {
	  	kolakoski[write_idx] <- kolakoski[write_idx-1]
	  	write_idx <- write_idx + 1
	  } 
	  read_idx <- read_idx + 1
  }
  if (write_idx == how_many) {
	  kolakoski[write_idx] <- 3-kolakoski[write_idx-1]
  }
  kolakoski
}

result <- kolakoski(c(1,2,2), 20)

for (idx in seq_along(result)) {	
	cat(idx," ",result[[idx]],"\n",sep="")
}
