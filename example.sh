#!/bin/bash

source os/bin/activate

sahara node-group-template-create --json json/ng_master.json
sahara node-group-template-create --json json/ng_slave.json

# for it to work the IDs of master and slave node group templates would have to
# be updated accordingly
sahara cluster-template-create --json json/cluster_basic.json

# the same goes for this
sahara cluster-create --json json/launch_cluster.json
