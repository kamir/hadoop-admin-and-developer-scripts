#!/bin/bash
NOW=$(date +"%m-%d-%Y-%h-%s")
FILE="tg1.$NOW"

sudo rm /etc/yum.repos.d/centos_base.repo

echo "" 
echo "" 
echo "We assume, you have a connection to an EC2-cluster via our socks proxy."
echo "" 
echo "1.) Install GIT"
echo "       found on: http://tecadmin.net/how-to-upgrade-git-version-1-7-10-on-centos-6/"
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  sudo rpm -i 'http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm'
  sudo rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
  sudo sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/rpmforge.repo
  sudo yum clean all
  sudo yum install git
else
  echo 'JUMP'
fi


echo "" 
echo "2.) Checkout the tutorial workspace."
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  cd /home/training
  git clone https://github.com/kamir/hadoop-admin-and-developer-scripts
else
  echo 'JUMP'
fi




echo "" 
echo "3.) Install Hadoop libraries."
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  sudo yum install hadoop-client
  sudo yum install hadoop-0.20-mapreduce 
  sudo yum install hive
  sudo yum install pig
  sudo yum install hbase
else
  echo 'JUMP'
fi



echo "" 
echo "4.) Generate some TeraGen data."
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  ssh training@elephant hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples-2.0.0-mr1-cdh4.2.0.jar teragen 5000000 $FILE
else
  echo 'JUMP'
fi


echo "" 
echo "5.) Do a TeraSort"
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  ssh training@elephant hadoop jar /usr/lib/hadoop-0.20-mapreduce/hadoop-examples-2.0.0-mr1-cdh4.2.0.jar terasort $FILE sorted
else
  echo 'JUMP'
fi

echo "" 
echo "6.) Install more nice tools."
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  sudo yum install gnuplot
  sudo yum install svn
  sudo yum install R
else
  echo 'JUMP'
fi


echo "" 
echo "7.) Now we should install Eclipse with Remote System Explorer."
echo ""
echo "       http://git.eclipse.org/c/tcf/org.eclipse.tcf.git/plain/docs/TCF%20Getting%20Started.html"
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  echo 'Nothing to do ...'
else
  echo 'JUMP'
fi


echo "" 
echo "8.) Install Maven"
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  java -version
  # 7.1. Download the current maven version from the prescribed repository:
  wget http://www.eng.lsu.edu/mirrors/apache/maven/maven-3/3.1.0/binaries/apache-maven-3.1.0-bin.tar.gz

  # 7.2. Extract the archive to the maven home directory: /usr/local/
  mv apache-maven-3.1.0-bin.tar.gz /usr/local
  cd /usr/local
  tar -zxvf apache-maven-3.1.0-bin.tar.gz

  # 7.3. Create a sym link..
  sudo ln -s apache-maven-3.1.0 maven

  # 7.4. Open with gedit ~/.bashrc file with and add the following lines to the end of the file,
  echo "export M2_HOME=/usr/local/apache-maven-3.1.0" >> /home/training/.bashrc
  echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /home/training/.bashrc

  # 7.5. Execute the environment changes with the command,    
  /home/training/.bashrc
  mvn -version
else
  echo 'JUMP'
fi


echo "" 
echo "9.) Install Gnuplot 4.6"
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  wget http://downloads.sourceforge.net/project/gnuplot/gnuplot/4.6.3/gnuplot-4.6.3.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fgnuplot%2Ffiles%2Fgnuplot%2F4.6.3%2F&ts=1374785888&use_mirror=superb-dca3
  tar -zxf gnuplot-4.6.3.tar.gz
  cd /home/training/gnuplot-4.6.3
  sudo ./configure
  sudo make
  sudo make install
  cd /home/training
  echo 'Done ...'
else
  echo 'JUMP'
fi


echo "" 
echo "10.) Deploy the sample code to the cluster."
echo "" 
echo " "
echo "* Do it        : 1" 
echo "* Jump to next : 0" 
read goOn

if [ $goOn -eq 1 ]
then
  cd /home/training/hadoop-admin-and-developer-scripts/java-tutorial/ews/hadoop-dev-tutorial/dist
  ./deploy_to_elephant.sh 
  ./run_job_stat.sh
  cd /home/training
  
else
  echo 'JUMP'
fi
