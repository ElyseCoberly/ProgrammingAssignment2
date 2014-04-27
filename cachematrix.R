## These functions cache time-consuming calculations 
##once they have been done 

## makeCacheMatrix creates a "matrix" object that can 
##cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## cacheSolve computes the inverse of the special "matrix" returned
## by makeCacheMatrix. If the inverse has already been calculated,
## then it will be retrieved from the cache

cacheSolve <- function(x) {
        m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- X$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
