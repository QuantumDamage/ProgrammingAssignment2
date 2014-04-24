# Used style guide: google-styleguide.googlecode.com/svn/trunk/Rguide.xml
# This file contains two functions used to cache matrix inversion.

makeCacheMatrix <- function(x = matrix()) {
  # Function makeCacheMatrix is receiving normal matrix and prepairing its
  # cached version 
  m <- NULL
  set <- function(y) {
    x <-- y
    m <-- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
  # Return a matrix that is the inverse of 'x'
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
