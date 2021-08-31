#!/bin/bash

sudo sed -i '$iwconfig wlan0 power off' /etc/rc.local

sudo sed -i '57 s/^/#/' /boot/config.txt
echo force_eeprom_read=0 >> /boot/config.txt
echo dtoverlay=hifiberry-dacplusadc >> /boot/config.txt

sudo apt-get install pulseaudio -y
sudo apt install swh-plugins -y 
sudo apt-get install pavucontrol -y

sudo chmod 777 /etc/pulse/default.pa

echo load-module modulde-loopback >> /etc/pulse/default.pa
echo set-default-source alsa_input.platform-soc_sound.stereo-fallback >> /etc/pulse/default.pa
echo set-default-sink alsa_output.platform-soc_sound.stereo-fallback >> /etc/pulse/default.pa

echo .ifexists module-ladspa-sink.so >> /etc/pulse/default.pa
echo .nofail >> /etc/pulse/default.pa
echo load-module module-ladspa-sink sink_name=compressor master_sink=alsa_output.platform-soc_sound.stereo-fallback plugin=sc4_1882 label=sc4 control=1,20,501,-30,2,5,13,3 >> /etc/pulse/default.pa
echo .fail >> /etc/pulse/default.pa
echo .endif >> /etc/pulse/default.pa
echo set-default-sink compressor >> /etc/pulse/default.pa

sudo reboot
