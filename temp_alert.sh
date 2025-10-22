##!/bin/sh


data=$( sensors -j) #stores sensors data in json format

echo "" > data.txt #empty file before inserting data

echo $data > data.txt 
python3 parse.py

#to decide whether a tempreture is more than 70 OR battery is more than 80

battery_raw_data=$( acpi | grep -E -o '[0-9]{2}%' )  #this is for batter percen>
b_p=$(echo $battery_raw_data | sed 's/%//g')
status=$( acpi | grep -o 'Charging' )


if [  $b_p -gt 75 ] && [ "$status" == "Charging" ] ;then
    notify-send "Alert : 🔌 Remove Charger $b_p % " "Let battery drain for some time"
fi







while read line; do

    num=$(($line+0))
    
    if [ $num -gt 70  ] ;then
        echo "Alert : Remove Charger $b_p % "
        echo "Tempreture reached : $num °C"
	    notify-send "System Tempreture : $num °C" "It's too HOT 💻🔥💨⚠️ to handle"
        break
    fi
done < data.txt



