#!/bin/bash

#sshpass -p '(1)sysadm!' ssh -N -f -o StrictHostKeyChecking=no -L 10010:217.160.98.245:8006 -p 22 -S /tmp/.ssh-ionos -M root@217.160.98.245 
#echo "waiting a few seconds to establish tunnel ... "
#sleep 10
#echo "close tunnel SSH... "
#ssh -S /tmp/.ssh-ionos -O exit root@217.160.98.245


#sshpass -p '(1)sysadm!' ssh -N -f -o StrictHostKeyChecking=no -L 10010:217.160.98.245:22 root@217.160.98.245 &


echo "ionos node 1"
rsync -avz -e 'sshpass -p "(1)sysadm!" ssh -p 22' root@217.160.98.245:/var/log/auth.log /tmp/logs/auth_node1.log
echo "ionos node 2"
rsync -avz -e 'ssh -p 22 -i ~/.ssh/id_rsa_ionos' root@217.160.98.216:/var/log/auth.log /tmp/logs/auth_node2.log
echo "ionos node 3"
rsync -avz -e 'ssh -p 22 -i ~/.ssh/id_rsa_ionos' root@217.160.99.207:/var/log/auth.log /tmp/logs/auth_node3.log

echo "close tunnel SSH... "

pkill -f "root@217.160.98.245"
pkill -f "root@217.160.98.216"
pkill -f "root@217.160.99.207"
