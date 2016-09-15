simple_handler Cookbook
=======================
A demo of a simple handler set via chef_handler in the test kitchen.

## To demo a report handler
Simply run `kitchen converge`.

Should see a WARN output like this:
```
Running handlers:
[2016-09-15T12:50:31-07:00] WARN: SimpleHandler: @run_status.success? => true
- Chef::Handler::SimpleHandler
Running handlers complete
```

## To demo a failure handler
Edit the default recipe to uncomment the fail method in the `fail the run` ruby_block and run `kitchen converge`.

Should see a WARN output like this:
```
Running handlers:
[2016-09-15T12:49:09-07:00] ERROR: Running exception handlers
[2016-09-15T12:49:09-07:00] WARN: SimpleHandler: @run_status.success? => false
- Chef::Handler::SimpleHandler
Running handlers complete
```