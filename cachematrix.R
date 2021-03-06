#############################################################################
## Assignment: Caching the Inverse of a Matrix                             ##
## Background: Matrix inversion is usually a costly computation and        ##
##             there may be some benefit to caching the inverse of a       ##
##             matrix rather than compute it repeatedly.                   ##
#############################################################################

###################################################################################
## Functionality: Creates a special "matrix" object that can cache its inverse.  ##
###################################################################################
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


#######################################################################################
## Functionality: Computes the inverse of the special "matrix" returned by           ##
##                makeCacheMatrix. If the inverse has already been calculated        ##   
##                (and the matrix has not changed), then cacheSolve should retrieve  ##
##                the inverse from the cache.                                        ##
#######################################################################################
cacheSolve <- function(x, ...) {
  i <- x$getInverse()
  if(!is.null(i)) {
    message("getting cached inversed matrix data")
    return(i)
  }
  matrixData <- x$get()
  i <- solve(matrixData, ...)
  x$setInverse(i)
  i
}
