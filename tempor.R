# ignore this file, it was just created for testing purposes

setwd("~/datascience/mooc/rprog/ProgrammingAssignment2")
testowaMatryca <- matrix(c(4,5,6,3,3,2,1,1,0),3,3)
source("cachematrix.R")
rozwiazanaTestowaMatryca <- solve(testowaMatryca)
keszowaTestowaMatryca <- makeCacheMatrix(testowaMatryca)
wynik <- cacheSolve(keszowaTestowaMatryca)
identical(rozwiazanaTestowaMatryca,wynik)
wynik <- cacheSolve(keszowaTestowaMatryca)
identical(rozwiazanaTestowaMatryca,wynik)
prawieJednoskotwaMacierz <- testowaMatryca %*% wynik
prawieJednoskotwaMacierz