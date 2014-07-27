## These functions aim to create a cached matrix inversion function.
## Usage example:
## > x <- matrix(c(1,3,2,5,6,7,9,10,11), 3 , 3)
## > x
##      [,1] [,2] [,3]
## [1,]    1    5    9
## [2,]    3    6   10
## [3,]    2    7   11
## > x_cache <- makeCacheMatrix(x)
## > cacheSolve(x_cache) # It's the first calling, calculate it
##            [,1]       [,2]       [,3]
## [1,] -0.3333333  0.6666667 -0.3333333
## [2,] -1.0833333 -0.5833333  1.4166667
## [3,]  0.7500000  0.2500000 -0.7500000
## > cacheSolve(x_cache) # It's already cached, just return it
## getting cached data
##            [,1]       [,2]       [,3]
## [1,] -0.3333333  0.6666667 -0.3333333
## [2,] -1.0833333 -0.5833333  1.4166667
## [3,]  0.7500000  0.2500000 -0.7500000

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
    xInverse <- x$getInverse()
    if(!is.null(xInverse)) {
        message("getting cached data")
        return(xInverse)
    }
    data <- x$get()
    xInverse <- solve(data)
    x$setInverse(xInverse)
    xInverse
}
