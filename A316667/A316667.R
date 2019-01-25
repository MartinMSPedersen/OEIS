# computing A316667

spiralCoordinate <- function(n) {
  xcoord <- function(n) {
    ifelse(n == 1,
           0,
           round(xcoord(n-1) + sin((floor(sqrt(4*(n-2)+1))%%4)*pi/2))
    )
  }
  ycoord <- function(n) {
    ifelse(n == 1,
           0,
           round(ycoord(n-1) -cos((floor(sqrt(4*(n-2)+1))%%4)*pi/2))
    )
  }
  c(xcoord(n),ycoord(n))
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
 

for (x in 5:-5) {
  for (y in -5:5) {
    cat(sprintf("%3d ",spiralValue(x,y),""))
  }
  cat("\n")
}

spiralCoordinate(101)
 