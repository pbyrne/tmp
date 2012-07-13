var cluster = require('cluster');
var workerCount = 2;

if (cluster.isMaster) {
  // fork some workers
  console.log("Forking workers for " + process.pid + " ...");
  for (var i = 0; i < workerCount; i++) {
    console.log("Forking worker " + i + "...");
    cluster.fork();
  }

  // SIGUSR2 to restart workers, a la unicorn
  process.on("SIGUSR2", function() {
    console.log("Performing an hot restart");
    for (var id in cluster.workers) {
      console.log("Killing worker " + id);
      cluster.workers[id].destroy;
    }

    for (var i = 0; i < workerCount; i++) {
      console.log("Forking worker " + i + "...");
      cluster.fork();
    }
  })
} else {
  // do some work
  console.log("I am a worker: PID " + process.pid);

  process.on("SIGUSR1", function() {
    console.log("Received SIGUSR1. Logging third value.");
  })
}
