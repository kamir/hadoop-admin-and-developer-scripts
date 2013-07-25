ssh training@elephant "hadoop jar training_materials/hdt.jar --hdfsdir /user/training/tg1.07-25-2013-Jul-1374795495 2> /home/training/temp/job.stat.dat"
scp training@elephant:/home/training/temp/*.dat ./temp/
gnuplot tasksovertime.pg
firefox ./tasksovertime.svg


