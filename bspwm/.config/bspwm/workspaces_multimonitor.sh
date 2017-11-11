#!/bin/bash
#all_monitors=$(xrandr -q | awk '/connected/ {print $1}')
#default_screen=$(xrandr | awk '/ connected/ {print $1;exit;}')
#extra_monitors=$(xrandr -q | awk '/connected/ {print $1}' | grep -v $default_screen)

##First, configure stuff with xrandr
#[[ $(who) != "" ]] && USER=$(who | grep :0\) | cut -f 1 -d ' ') || \
#USER=$(echo /home/* | cut -f 3 -d '/')

#export DISPLAY=:0.0
#export XAUTHORITY=/home/$USER/.Xauthority

#for monitor in $extra_monitors; do
#	prev_mon=$(xrandr | awk '/connected/ {print $1}' | grep -B1 "^$monitor" | grep -vE "^$monitor|^--$")
#	xrandr --output $monitor \
#		--auto \
#		--right-of $prev_mon
#done

##Then, create workspaces on all monitors
  I=1
  M=$(bspc query -M | wc -l)
  if [[ "$M" == 1 ]]; then
    bspc monitor -d I II III IV V VI VII VIII XI
  elif [[ "$M" == 2 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d I II III IV V
     bspc monitor $(bspc query -M | awk NR==2) -d VI VII VIII IX X
  elif [[ "$M" == 3 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d I II III IV
     bspc monitor $(bspc query -M | awk NR==2) -d V VI VII
     bspc monitor $(bspc query -M | awk NR==3) -d VIII IX X
  elif [[ "$M" == 4 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d I II III
     bspc monitor $(bspc query -M | awk NR==2) -d IV V VI
     bspc monitor $(bspc query -M | awk NR==3) -d VII VIII
     bspc monitor $(bspc query -M | awk NR==4) -d IX X
  elif [[ "$M" == 5 ]]; then
     bspc monitor $(bspc query -M | awk NR==1) -d I II
     bspc monitor $(bspc query -M | awk NR==2) -d III IV
     bspc monitor $(bspc query -M | awk NR==3) -d V VI
     bspc monitor $(bspc query -M | awk NR==4) -d VII VIII
     bspc monitor $(bspc query -M | awk NR==5) -d IX X
  else
    for monitor in $(bspc query -M); do
    bspc monitor $monitor \
        -n "$I" \
        -d $I/{a,b,c}
     let I++
     done
  fi

