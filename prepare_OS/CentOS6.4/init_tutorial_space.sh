#!/bin/bash
NOW=$(date +"%m-%d-%Y-%h-%s")
FILE="tg1.$NOW"

echo "" 
echo "" 
echo "We assume, you have a connection to an EC2-cluster via our socks proxy."
echo "" 
echo "1.) Install GIT"
echo "       found on: http://tecadmin.net/how-to-upgrade-git-version-1-7-10-on-centos-6/#"
echo "" 
sudo rpm -i 'http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm'
sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/rpmforge.repo
sudo yum clean all
sudo yum install git
read goOn

echo "" 
echo "2.) Checkout the tutorial workspace."
echo "" 
git clone https://github.com/kamir/hadoop-admin-and-developer-scripts
read goOn

echo "" 
echo "3.) Install Hadoop libraries."
echo "" 
sudo yum install hadoop-client
sudo yum install hadoop-0.20-mapreduce
sudo yum install hive
sudo yum install pig
sudo yum install hbase
read goOn

echo "" 
echo "4.) Deploy the sample code to the cluster."
echo "" 
cd /home/training/hadoop-admin-and-developer-scripts/java-tutorial/ews/hadoop-dev-tutorial/dist
./deploy_to_elephant.sh 
read goOn

echo "" 
echo "5.) Generate some TeraGen data."
echo "" 
ssh training@elephant hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples-2.0.0-mr1-cdh4.2.0.jar teragen 5000000 $FILE
read goOn


echo "" 
echo "6.) Now we should install Eclipse with Remote System Explorer."
echo ""
echo "       http://git.eclipse.org/c/tcf/org.eclipse.tcf.git/plain/docs/TCF%20Getting%20Started.html"



