# computing A316667
cacheY <- NULL
cacheX <- NULL

cacheY_reset <- function() {
  cacheY <<- new.env(TRUE, emptyenv())
  cacheY_set('1', 0)
}
cacheX_reset <- function() {
  cacheX <<- new.env(TRUE, emptyenv())
  cacheX_set('1', 0)
}

cacheY_set <- function(key, value) {
  assign(key, value, envir = cacheY)
}
cacheX_set <- function(key, value) {
  assign(key, value, envir = cacheX)
}

cacheY_get <- function(key) {
  get(key, envir = cacheY, inherits = FALSE)
}
cacheX_get <- function(key) {
  get(key, envir = cacheX, inherits = FALSE)
}

cacheY_has_key <- function(key) {
  exists(key, envir = cacheY, inherits = FALSE)
}
cacheX_has_key <- function(key) {
  exists(key, envir = cacheX, inherits = FALSE)
}

# Initialize the two caches
cacheY_reset()
cacheX_reset()


spiralCoordinates <- function(n) {
  ycoord <- function(n) {
    key <- as.character(n)
    if (cacheY_has_key(key)) return(cacheY_get(key))
    result <- round(ycoord(n-1) + sin((floor(sqrt(4*(n-2)+1))%%4)*pi/2))
    cacheY_set(key,result)
    result
  }
  
  xcoord <- function(n) {
    key <- as.character(n)
    if (cacheX_has_key(key)) return(cacheX_get(key))
    result <- round(xcoord(n-1) -cos((floor(sqrt(4*(n-2)+1))%%4)*pi/2))
    cacheX_set(key,result)
    result
  }
  list(x = xcoord(n),y = ycoord(n))
}

spiralValue <- function(x,y) {
  if (abs(y) > abs(x)) {
    if (y>0) {
      return(4*y*y-3*y+x+1)
    } else {
      return(4*y*y-y-x+1)
    }
  }
  if (x>0) {
   return(4*x*x-x-y+1)
  }
  4*x*x-3*x+y+1
}

knightMoves <- function(x, y) {
  result <- c(spiralValue(x - 1, y - 2),
              spiralValue(x - 1, y + 2),
              spiralValue(x + 1, y - 2),
              spiralValue(x + 1, y + 2),
              spiralValue(x - 2, y - 1),
              spiralValue(x - 2, y + 1),
              spiralValue(x + 2, y - 1),
              spiralValue(x + 2, y + 1))
}
 

pos <- list(x = 0, y = 0)
usedValues <- 1

print(paste("1",usedValues))
while (TRUE) {
  spiralValue(pos$x, pos$y)
  candidates <- setdiff(knightMoves(pos$x, pos$y),usedValues)
  if (length(candidates) == 0) break
  nextValue <- min(candidates)
  usedValues <- c(usedValues,nextValue)
  print(paste(length(usedValues),nextValue))
  pos <- spiralCoordinates(nextValue)
}

 
# for (x in 5:-5) {
#   for (y in -5:5) {
#     cat(sprintf("%2d ",spiralValue(x,y)))
#   }
#   cat("\n")
# }