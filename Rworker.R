#! /usr/bin/env Rscript
# Simple R worker script for testing. Just prints on console.

cat("worker successfully launched at ", timestamp())
print("testing random numbers..")
x<-runif(10)
print(x)