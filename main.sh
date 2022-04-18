#!/bin/bash
#Var
procx=$!
barrier="========================================================="
#norm
norm=$(tput sgr0)
#ColorGrade
red_f=$(tput setaf 1)
red_b=$(tput setab 1)
green_f=$(tput setaf 2)
green_b=$(tput setab 2)
yellow_f=$(tput setaf 3)
yellow_b=$(tput setab 3)
blue_f=$(tput setaf 4)
blue_b=$(tput setab 4)
magenta_f=$(tput setaf 5)
magenta_b=$(tput setab 5)
cyan_f=$(tput setaf 6)
cyan_b=$(tput setab 6)
white_f=$(tput setaf 7)
white_b=$(tput setab 7)

#TextForm
bold=$(tput bold)
uline=$(tput smul)
blink=$(tput blink)
reverse=$(tput rev)
standout=$(tput smso)

#Others
user=$(whoami)
host=$(uname -n)
opsys=$(uname -o)
machine=$(uname -m)
kernel_nme=$(uname -s)
kernel_rel=$(uname -r)
kernel_ver=$(uname -v)
upt=$(uptime -p)
cal=$(date)
spotit=$(whereis pulseaudio)
#Code
cat cat_meow/splash_meow
echo "$uline https://play.google.com/store/apps/details?id=com.kaytat.simpleprotocolplayer$norm"
echo "$green_f$bold$barrier$norm"
echo "$bold$red_f Operating System: $opsys$norm"
echo "$bold$yellow_f CPU: $machine$norm"
echo "$cyan_f$bold PulseAudio Location: $spotit$norm"
echo "If PulseAudio Location is not showing, means you didn't install PulseAudio. You need to install it first\! "
echo "$green_f$bold$barrier$norm"
cat cat_meow/menu_meow
echo "$green_f$bold$barrier$norm"
sleep 1
  function perm () {
    sleep 2
    echo "Copying Script"
    cp /etc/pulse/default.pa $HOME/.default-pulse-old
    clear
    echo "$yellow_f$bold Flashing Script...."
    sleep 1
    echo 'load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=auto_null.monitor record=true port=8000 listen=127.0.0.1' >> /etc/pulse/default.pa
    echo "$green_f$bold DONE\!, You are no longer needing this script to execute once again, unless you want to undo it. Now, you need to open SimpleProtocolPlayer and Input IP: 127.0.0.1 Port: 8000 , Bitrate: 48000 , Buffer Size : 50ms, and lastly, Enable Network Retries$norm"
    sleep 2
    echo "$blue_f$bold Enabling PulseAudio, Make sure you're on VNC mode\!, keep this Terminal Open Until Pulseaudio Control Says that there's an external speakers connected\!"
    sleep 5
    echo "Opening PulseAudio"
    sleep 3
    clear 
    pulseaudio -vvvvvv
  }
  function temp () {
    echo "Temporary Injection Method, Please make sure SimpleProtocolPlayer is Enabled by Default, Connecting 127.0.0.1 Port 8000 with buffer size: 50, bitrate 48000 and Enable Network Retries."
    sleep 10
  if (  DISPLAY=:1 pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=auto_null.monitor record=true port=8000 listen=127.0.0.1 ) 
  then
  echo "$bold$green_f Done$norm"
  else
  echo "$red_f$bold pactl not Functioning, execute 1 instead   $norm"
fi
  }
  function recal () {
    echo "This method only works when you selected 1 and wanted to revert changes now. i hope you didn't clean your $HOME directory, or your doomed."
    sleep 2
    if [[ -f $HOME/.default-pulse-old  ]]
    then
      cp $HOME/.default-pulse-old /etc/pulse/default.pa 
      sleep 2
      echo "$green_f Done$norm"
    else
      echo "$red_f $bold File Missing, you cleared it, or it was on other user session.$norm"
      sleep 2
      fi
  }
read -p "$green_f$bold Select Option: [0-3] >> " -n 1 -s pick
 case $pick in
    1) perm;;
    2) temp;;
    3) recal;;
    0) exit 0 ;;
    *) echo -e "$red_f$bold You Picked the wrong Number fool\!$norm" ;;
 esac
