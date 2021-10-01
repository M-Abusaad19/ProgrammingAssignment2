## Put comments here that give an overall description of what your
## functions do

## a function that caches the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setInverse <- function(solveMatrix) inverse <<- solveMatrix
  getInverse <- function() inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

m=matrix(1:4,2,2)
Mcache=makeCacheMatrix(m)

Mcache$get()
Mcache$getInverse()

## a function that calculates the inverse from the data returned from previous function

cacheSolve <- function(x, ...) {
        
  inverse <- x$getInverse()
  if(!is.null(inverse)){
    message("getting cached data")
    return(inverse)
  }
  data <- x$get()
  inverse <- solve(data)
  x$setInverse(inverse)
  inverse 
  
}

cacheSolve(Mcache)

