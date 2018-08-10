a055748 <- (function() {

    cache <- NULL

    cache_reset <- function() {
	    cache <<- new.env(TRUE, emptyenv())
	    cache_set('1', 1)
	    cache_set('2', 1)
    }

    cache_set <- function(key, value) {
	    assign(key, value, envir = cache)
    }

    cache_get <- function(key) {
	    get(key, envir = cache, inherits = FALSE)
    }

    cache_has_key <- function(key) {
	    exists(key, envir = cache, inherits = FALSE)
    }

    # Initialize the cache
    cache_reset()

    function(n) {
	    nc <- as.character(n)

	    # Check to see if n is an integer Do not use is.integer as that is very
	    # strict
	    if (length(n) > 1) {
		    return(sapply(n, a055748))
	    }

	    if (round(n, 0) != n)
		    return(NA)


	    # Cached cases
	    if (cache_has_key(nc))
		    return(cache_get(nc))

	    out <- a055748(a055748(n-1)) + a055748(n - a055748(n-2) - 1)
	    cache_set(nc, out)
	    return(out)
    }
})()


