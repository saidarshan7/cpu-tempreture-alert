##!/bin/sh


data=$( sensors -j) #stores sensors data in json format

echo "" > data.txt #empty file before inserting data

echo $data > data.txt 
python3 parse.py

#to decide whether a tempreture is more than 70

while read line; do

    num=$(($line+0))
    
    if [ $num -gt 60 ];then
        echo "Alert : System is getting HOT 🔥"
        echo "Tempreture reached : $num °C"
        break
    fi
done < data.txt






 
#sleep 1 



