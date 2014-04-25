# Used style guide: google-styleguide.googlecode.com/svn/trunk/Rguide.xml
# This file contains two functions used to cache matrix inversion.

makeCacheMatrix <- function(x = matrix()) {
  # Function makeCacheMatrix is receiving normal matrix and prepairing its
  # cached version
  #
  # Args:
  #   x: matrix
  #
  # Returns:
  #   list containing four functions
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {
    x
  }
  setinverse <- function(solve) {
    m <<- solve
  }
  getinverse <- function() {
    m
  }
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  # Function cacheSolve is function that returns cached value of matrix
  # inversion or calculate it when cache is not availible
  #
  # Args:
  #   x: cacheMatrix, result of makeCacheMatrix() function
  #   ...: arguments passed to standard solve() function
  #
  # Returns:
  #   if cache is availible (!is.null(m)) returns its value, if not it 
  #   calculates it (by getting matrix from x and running solve()) and then 
  #   setting it back to cache and returning it
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
