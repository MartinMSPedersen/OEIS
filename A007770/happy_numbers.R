# happy numbers
# http://web.archive.org/web/20050208042141/http://www.wschnei.de:80/digit-related-numbers/happy-numbers.html

library(magrittr)

happy_lgl <- vector('logical', 1e3) # 12 * 9^2 = 972 < 1e3

max_happy <- 10000
happy <- vector('integer', max_happy) # happy numbers up to 1e7
happy[[1]] <- "1"
happy_idx <- 2

DEBUG <- TRUE
#DEBUG <- FALSE


for (i in 1L:1e3L) {
  v <- i
  while (v != 1 && v != 4) {
    v <- sum(sapply(as.integer(unlist(strsplit(as.character(v),""))), function(x) x^2))
  }
  if (v == 1) {
    happy_lgl[[i]] <- TRUE
    if (DEBUG) cat(happy_idx,i,"\n")
    happy[[happy_idx]] <- i
    happy_idx <- happy_idx + 1
  }
}

i <- 1001L
while (TRUE) {
v <- 
  i %>% 
     sprintf("%d",.) %>% 
     strsplit(split = "") %>% 
     unlist %>% 
     sapply(function(x) { as.integer(x)^2 }) %>% 
     sum
  if (happy_lgl[[v]] == TRUE) {
    happy[[happy_idx]] <- i
    happy_idx <- happy_idx + 1
    if (DEBUG) cat(happy_idx,i,"\n")
    if (happy_idx > max_happy) break
  }
  i <- i + 1
}

