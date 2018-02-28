#Crontab -l

 */5 * * * * /bin/bash /root/script/cpu.sh

 

 

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#!/bin/bash

CPU_USAGE=$(top -b -n1 | tail -n+8 | sort -nr -k9 | grep moxi | awk '{print $9}' | cut -d'.' -f1)

echo $CPU_USAGE

CPU_THRESHOLD=90

echo $CPU_THRESHOLD

PID=$(pidof moxi)

echo $PID

read=$CPU_USAGE

read=$CPU_THRESHOLD

 

if [ $CPU_USAGE -gt $CPU_THRESHOLD ] ; then

        echo "SIZE has exceeded.\nKilling the process......"

        kill -9 $PID

       killall -9 moxi

        echo "Killed the process";

else

        echo "SIZE has not yet exceeding";

fi

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
