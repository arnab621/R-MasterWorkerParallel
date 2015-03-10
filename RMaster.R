
# The Master Listener Code to simulate launching of dynamic worker jobs based on user input in Redis Q

#setwd('~/Documents/Learning/Amazon_R_POC/')
library("rredis")
host="52.74.71.137" # this can be an AWS instance ip
port= 6379
redisConnect(host=host, port=port) 

cat("R master listening on Redis port at..", host)

while(1)
{
  inp <- redisBLPop("workers")
  cat("receiving from Redis..")
  print(inp)
  x<-inp$workers
  if (x <= 0)
  {
    cat ("Invalid Input..Exiting..Please relaunch worker...bye..")
    break
  }
  cat ("Master Node: I am launching ", x, " R worker jobs...")
  for (i in 1:x)
  {
    cat ("Ready for Launch of Worker: ", i)
    fileout<-paste("worker_",i,"_output.txt",sep='') # output file name to store console log of workers
    system2("RScript", arg= "Rworker.R ", wait=F, stdout=fileout) #wait=F ensures asynchronous process
  }
}


