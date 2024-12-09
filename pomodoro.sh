#!/bin/bash 

read -p "enter your work time per second : " deep_work_time
read -p "enter your  short break time per second : " short_break_time
read -p "enter your favorite cycle :" cycle
read -p "enter your time for longer break per socond :" longer_break

for ((i=1;i<=cycle;i++)); do
echo "Cycle $i: work for $deep_work_time seconds"
sleep $deep_work_time
echo "your deeply worked is done "


if ((i % 4 == 0)); then
echo "Take along break for $longer_break seconds"
sleep $longer_break

else 
echo "Take a short break for $short_break_time seconds"
fi
done
echo "Done"
