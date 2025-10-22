##!/bin/sh


data=$( sensors -j) #stores sensors data in json format

echo "" > data.txt #empty file before inserting data

echo $data > data.txt 
python3 parse.py

#to decide whether a tempreture is more than 70

bat=$( acpi | grep -E -o '[0-9]{2}%' ) 
b_p=$(echo $bat | sed 's/%//g')
echo $b_p


while read line; do

    num=$(($line+0))
    
    if [ $num -gt 70  ] || [ $b_p -gt 80 ];then
        echo "Alert : Remove Charger $b_p % "
        echo "Tempreture reached : $num °C"
	notify-send "Alert : 🔌 Remove Charger $b_p % " "System Tempreture : $num °C"
        break
    fi
done < data.txt



