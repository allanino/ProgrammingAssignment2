## These functions aim to create a cached matrix inversion function

## Create a list with special functions to cache an inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    xInverse <- NULL
    set <- function(y) {
        x <<- y
        xInverse <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) xInverse <<- inverse
    getInverse <- function() xInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Function to invert a matrix (using a cached result or computing and caching it) 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        xInverse <- x$getinverse()
        if(!is.null(xInverse)) {
                message("getting cached data")
                return(xInverse)
        }
        data <- x$get()
        xInverse <- solve(data)
        x$setInverse(xInverse)
        m
}
