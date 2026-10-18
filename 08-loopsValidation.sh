#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shellscripts"
log_file="${logs_folder}/$(date +%Y-%m-%d).log"

if [ $user_id -ne 0 ]; then
    echo "please run this script as root user"
    exit 1
fi

mkdir -p $logs_folder

valdiate(){
    if [ $1 -ne 0 ]; then
        echo "${2}..FAILED" | tee -a $log_file
        exit 1
    else
        echo "${2}..SUCCESS" | tee -a $log_file
    fi
}


for package in $@
do
    dnf list installed ${package}
    if [ $? -eq 0 ]; then
        echo "${package} is already installed" | tee -a $log_file
    else
        echo "${package} is not installed, installing..." | tee -a $log_file
        echo "installing ${package}...." | tee -a $log_file
    dnf install ${package} -y &>> $log_file
    valdiate $? "${package} installation"
    fi
    

done