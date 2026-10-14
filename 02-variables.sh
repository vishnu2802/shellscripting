#!/bin/bash

START_TIME=$(date +%s)
echo "Start time: ${START_TIME}" 

person="$1"
person1="$2"

echo "${person} :: Hi ${person1}, what's up?" 
echo "${person1} :: I am fine, ${person} how about you?"
echo "${person} :: I am good too, ${person1} thanks for asking!"

END_TIME=$(date +%s)
echo "End time: ${END_TIME}"    

echo "Total time taken: $((END_TIME - START_TIME)) seconds"