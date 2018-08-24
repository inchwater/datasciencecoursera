## This file consists of 2 functions - the first function (makeCacheMatrix) will cache the inverse of a given matrix
## and the second function will retrieve the cached data if the inverse has already been calculated for the given matrix

## This function will cache the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
        y <<- solve(x)
        y

}


## This function will return the inverse of the matrix
## returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
        
        if (x %*% y == diag(2)){
                message("getting cached data")
                return(y)
        }

        inverse <- solve(x)
        inverse
       
        
         ## Return a matrix that is the inverse of 'x'
}
