#!/bin/bash
#Purpose: This Script is to count the number of HTTP 4xx/5xx status
#Author: Rajkumar
#Assignment1: Task1A,Task1B - Version 1.0
#Created Date: 10 Jan 2021

# Task 1A

## declare mail variables
##email subject
subject="HTTP response status"
##sending mail as
from="test@example.com"
## sending mail to
to="test@gmail.com"


## get HTTP status count
status4x=$(grep "HTTP/1.1\"\ 4[0-9][0-9]"  /home/ec2-user/apache_logs  |wc -l)
status5x=$(grep "HTTP/1.1\"\ 5[0-9][0-9]"  /home/ec2-user/apache_logs  |wc -l)


## check if HTTP error respones greater than 100
if [[ "$status4x" -gt 100  ] || [ "status5x" -gt 100]]; then
        echo "Success"
        file=/home/pi/Downloads/testsamples.txt
        ## send email if Status respone more than 100
        echo -e "High number of error responses" | mail -A "$file" -s "$subject" "test@gmail.com"
fi

# Run this task daily at 11 AM.

crontab -e
echo "* 11 * * * /home/pi/Downloads/tasmple.sh"

# Task  1B

# A table that contains the path of directories to clean
rep_log=("/var/log")
echo "Cleaning logs - $(date)."

#loop for each path provided by rep_log
for element in "${rep_log[@]}"
do
    echo "$element";
    nb_log=$(find "$element" -type f -mtime +3 -name "*.log*"| wc -l)
    if [[ $nb_log != 0 ]]
    then
            find "$element" -type f -mtime +3 -delete
            echo "Successful!"
    else
            echo "No log to clean"
    fi
done

exit 0
