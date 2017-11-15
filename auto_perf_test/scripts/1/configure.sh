#!/bin/bash

vagrant ssh "nettest-control1-1" -c "docker network create --subnet 192.168.10.0/24 -d bridge test_net"
vagrant ssh "nettest-control1-1" -c "docker container run -tid --network test_net --ip 192.168.10.101 --name test_con1 jsshin1230/test_image"
vagrant ssh "nettest-control1-1" -c "docker container run -tid --network test_net --ip 192.168.10.102 --name test_con2 jsshin1230/test_image"

sed -i "s/<box1_name>/nettest-control1-1/g" ./test.cfg
sed -i "s/<box2_name>/nettest-control1-1/g" ./test.cfg
sed -i "s/<container1_name>/test_con1/g" ./test.cfg
sed -i "s/<container2_name>/test_con2/g" ./test.cfg
sed -i "s/<container1_ip>/192.168.10.101/g" ./test.cfg
sed -i "s/<container2_ip>/192.168.10.102/g" ./test.cfg
