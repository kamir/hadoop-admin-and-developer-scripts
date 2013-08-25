gnuplot -e "id='A'" tasksovertime2.pg
gnuplot -e "id='B'" tasksovertime2.pg

firefox tasksovertime.A.svg &
firefox tasksovertime.B.svg &


