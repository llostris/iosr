# Openshift Cartridge Tests

Usage:

`./test.sh [application name] [action] [noargs|hdfs]`

Action is one of:
- create
- run
- start (combines create and run)
- stop

## Create appliation
Creates an application with given name on OpenShift. Since there is no manifest in application's repository, cluster is not yet created.

`./test.sh spark-test create`

## Create cluster and a job
Pushes manifest and binary file to application's repository.

It is possible to either test a job without any arguments (using _noargs_ as third arguments) or a job with input/output on HDFS (using _hdfs_ as third argument).

`./test.sh spark-test run noargs`

`./test.sh spark-test run hdfs`

Running on HDFS requires providing valid HDFS paths in manifest located in `hdfs/manifest.yml`

## Stop cluster and cleanup
Stops the cluster, removes all job-related objects from OpenStack and deletes application directory on local drive.

`./test.sh spark-test stop`
