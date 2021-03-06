#!/bin/bash
# found this code on http://taskwarrior.org/projects/1/wiki/Export-htmlpy
# For cron: */30 * * * * DISPLAY=:0.0 /home/User/configs/TaskNotify.sh
# Requires linux with notify-send and canberra-gtk-play which are default on Ubuntu

num=`task active | wc -l`
if [ $num -gt "1" ]
  then
  	tasks_to_show=`task active | tail -n +3 | head -n -1`
    notify-send 'Active Tasks' "'${tasks_to_show}'"
    # aplay /usr/share/sounds/elementary/stereo/bell.wav
  else
    notify-send "No Active Tasks" "C'mon! What are you doing?" 
    # aplay /usr/share/sounds/sound-icons/prompt.wav
fi