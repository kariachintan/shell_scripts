#!/bin/sh
echo "running apache2 relaunch at $(date)" >> /var/log/uwe-crontab/crons.log
ps auxw | grep apache2 | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/apache2 restart >> /var/log/uwe-crontab/crons.log
        echo "apache relaunched at $(date)" >> /var/log/uwe-crontab/crons.log
else 
        echo "apache is running"  >> /var/log/uwe-crontab/crons.log
fi
