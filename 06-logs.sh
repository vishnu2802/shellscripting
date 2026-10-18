#/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shellscripts"
log_file="${logs_folder}/$(date +%Y-%m-%d).log"

if [ $user_id -ne 0 ]; then
    echo "please run this script as root user"
    exit 1
fi

mkdir -p $logs_folder

validate(){
    if [ $1 -ne 0 ]; then
        echo "${2}..FAILED" | tee -a $log_file
        exit 1
    else
        echo "${2}..SUCCESS" | tee -a $log_file
    fi
}

echo "proceeding...." 
dnf install nginx -y &>> $log_file
validate $? "nginx installation"

dnf install mysql -y &>> $log_file
validate $? "mysql installation"

echo "All the logs are saved in ${log_file}"