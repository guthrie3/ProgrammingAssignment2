## This is a pair of functions that cache and solve the inverse of a matrix

# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix<-function(mtx = matrix){
  mvect<-NULL
  set<-function(y){
    x<<-y
    mvect<<-NULL
  }
  get<-function()mtx
  setmatrix<-function(solve) mvect<<-solve
  getmatrix<-function()mvect
  list(set=set,get=get,setmatrix=setmatrix,getmatrix=getmatrix)
}


#This function computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve<-function(mtx=matrix()){
  mvect<-mtx$getmatrix()
  if(!is.null(mvect)){
    message("getting cached data")
    return(mvect)
  }
  matrix<-mtx$get()
  mvect<-solve(matrix)
  mtx$setmatrix(mvect)
  mvect
}
 

testMatrix<-matrix(1:4,nrow=2,ncol=2) # this is a test matrix to test the functions
testMatrix
cacheSolve(makeCacheMatrix(testMatrix))

