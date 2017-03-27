 ## Put comments here that give an overall description of what your
 ## functions do
-
+#Caching the Inverse of a Matrix:
+## Matrix inversion is usually a costly computation and there may be some 
+## benefit to caching the inverse of a matrix rather than compute it repeatedly.
+## Below are a pair of functions that are used to create a special object that 
+## stores a matrix and caches its inverse.
 ## Write a short comment describing this function
 
+## This function creates a special "matrix" object that can cache its inverse
+
 makeCacheMatrix <- function(x = matrix()) {
+        invMatrix <- NULL
+    set <- function(y) {
+        x <<- y
+        invMatrix <<- NULL
+    }
+    get <- function() x
+    setInverse <- function(inverse) invMatrix <<- inverse
+    getInverse <- function() invMatrix
+    list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
 
 }
 
 
 ## Write a short comment describing this function
+#The following function will produce the inverse of the matrix.
+#if the solution should be computed then first it will set the value in the cache
+#via using the setinverse function
+#if we already have solution by omputing the matrix then it will directly shows us the result
+#and skips the execution process.
 ## Return a matrix that is the inverse of 'x'
 
 cacheSolve <- function(x, ...) {
+        invMatrix <- x$getInverse()
+    if(!is.null(invMatrix)) {
+        message("getting cached data")
+        return(invMatrix)
+    }
+    data <- x$get()
+    invMatrix <- solve(data)
+    x$setInverse(invMatrix)
+    invMatrix
       
 }
