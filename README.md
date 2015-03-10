# R-MasterWorkerParallel
Using Redis as a Data queue for Master Worker type Parallel Architecture (Asynchronous) using R.

<b> Building a parallel backend architecture with R. I have used Redis DB to connect R instances using TCP/IP. The Redis Server acts as a central message queue, where any application can push messages. 
The R Master job is a listener running in a sort of event loop and listens to the Redis queue. On receiving a particular type of request data, it immediately receives it and executes the system commands to launch worker jobs asynchronously.

Each R session is launched asynchrounously and is detached from the master session. 

