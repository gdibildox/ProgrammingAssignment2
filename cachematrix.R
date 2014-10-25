## The following functions are used to cache the inverse of an invertible matrix

## This function creates an object consisting of a list with 3 functions
## one function to get the matrix itself, one to set the inverse
## and one function to get the current inverse value

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(get = get,
         setinverse = setinverse,
        getinverse = getinverse)
}


## This function looks to the "matrix" object (makeCacheMatrix) and first checks if an inverse has been 
## previously calculated and if so reports the cached inverse otherwise it calls
## the function to get the matrix from the "matrix" object and calculates the inverse 
## and sets it to the "matrix" object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
