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
#sudo rpm -i 'http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm'
#sudp rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
#sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/rpmforge.repo
#sudo yum clean all
#sudo yum install git
read goOn

echo "" 
echo "2.) Checkout the tutorial workspace."
echo "" 
#git clone https://github.com/kamir/hadoop-admin-and-developer-scripts
read goOn

echo "" 
echo "3.) Install Hadoop libraries."
echo "" 
#sudo yum install hadoop-client
#sudo yum install hadoop-0.20-mapreduce
#sudo yum install hive
#sudo yum install pig
#sudo yum install hbase
read goOn

echo "" 
echo "4.) Deploy the sample code to the cluster."
echo "" 
#cd /home/training/hadoop-admin-and-developer-scripts/java-tutorial/ews/hadoop-dev-tutorial/dist
#./deploy_to_elephant.sh 
read goOn

echo "" 
echo "5.) Generate some TeraGen data."
echo "" 
#ssh training@elephant hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples-2.0.0-mr1-cdh4.2.0.jar teragen 5000000 $FILE
read goOn

echo "" 
echo "6.) Install more nice tools."
echo "" 
#sudo yum install gnuplot
#sudo yum install svn
#sudo yum install hadoop-client
#sudo yum install hadoop-client
read goOn

echo "" 
echo "6.) Now we should install Eclipse with Remote System Explorer."
echo ""
echo "       http://git.eclipse.org/c/tcf/org.eclipse.tcf.git/plain/docs/TCF%20Getting%20Started.html"


echo "" 
echo "Install Maven to work on a CentOS machine:"
echo "    Preparation:" 
echo "" 
echo "" 
java -version
# 1. Download the current maven version from the prescribed repository:
#wget http://www.eng.lsu.edu/mirrors/apache/maven/maven-3/3.1.0/binaries/apache-maven-3.1.0-bin.tar.gz

# 2. Extract the archive to the maven home directory: /usr/local/
#mv apache-maven-3.1.0-bin.tar.gz /usr/local
#cd /usr/local
#tar -zxvf apache-maven-3.1.0-bin.tar.gz

# 3. Create a sym link..
#sudo ln -s apache-maven-3.1.0 maven

# 4. Open with gedit ~/.bashrc file with and add the following lines to the end of the file,
#echo "export M2_HOME=/usr/local/apache-maven-3.1.0" >> /home/training/.bashrc
#echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /home/training/.bashrc

# 5. Execute the environment changes with the command,    
/home/training/.bashrc
mvn -version