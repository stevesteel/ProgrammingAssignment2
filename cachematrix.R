#Coursera R Programming Assignment 2 

### Assignment: Caching the Inverse of a Matrix

#Matrix inversion is usually a costly computation and there may be some
#benefit to caching the inverse of a matrix rather than computing it
#repeatedly (there are also alternatives to matrix inversion that we will
#            not discuss here). Your assignment is to write a pair of functions that
#cache the inverse of a matrix.

#Write the following functions:

#1.  `makeCacheMatrix`: This function creates a special "matrix" object
#that can cache its inverse.
#2.  `cacheSolve`: This function computes the inverse of the special
#"matrix" returned by `makeCacheMatrix` above. If the inverse has
#already been calculated (and the matrix has not changed), then
#`cacheSolve` should retrieve the inverse from the cache.

#Computing the inverse of a square matrix can be done with the `solve`
#function in R. For example, if `X` is a square invertible matrix, then
#`solve(X)` returns its inverse.

#For this assignment, assume that the matrix supplied is always
#invertible.


#######################################################################

#Below are two functions that are used to create a special object 
#that stores a matrix and cache's its inverse.
#The first function, makeVector creates a special "matrix", 
#which is really a list containing a function to


#1.`makeCacheMatrix`: This function creates a special "matrix" object
#that can cache its inverse.

## calculates the inverse of the matrix.
## If the matrix inverse has already been calculated, it will instead 
## find it in the cache and return it, this prevents unecessary computation.



makeCacheMatrix <- function(x = matrix()) {
        inversematrix_x <- NULL
        set <- function(y) {
                x <<- y#External Environment
                inversematrix_x <<- NULL
        }
        get <- function() x
        setinverse<- function(inverse) inversematrix_x <<-inverse
        getinverse <- function() inversematrix_x
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

#The following function 'cacheSolve' calculates the inverse of a 'special' matrix 
#created with the 'makeCacheMatrix' function. However, it first checks to see 
#if the cached inverse has already been calculated. If the cached inverse exists, 
#it gets the cached inverse from the cache and skips the computation. 
#Otherwise, it calculates the cached inverse of the data and sets 
#the value of cached inverse the cache via the setmean function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inversematrix_x <- x$getinverse()
        if (!is.null(inversematrix_x)) {
                message("getting cached inverse matrix")
                return(inversematrix_x)
        } else {
                inversematrix_x <- solve(x$get())
                x$setinverse(inversematrix_x)
                return(inversematrix_x)
        }
}

