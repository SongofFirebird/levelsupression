#!/bin/bash

sudo apt-get install pulseaudio
sudo apt install swh-plugins
sudo apt-get install pavucontrol

sudo chmod 777 /etc/pulse/default.pa

echo set-default-sink alsa_output.platform-soc_sound.analog_Stereo >> /etc/pulse/default.pa
echo ifexists module-ladspa-sink.so >> /etc/pulse/default.pa
echo .nofail >> /etc/pulse/default.pa
echo load-module module-ladspa-sink sink_name=compressor-Stereo >> /etc/pulse/default.pa
echo plugin=sc4_1882 plugin=sc4_1882 label=sc4 >> /etc/pulse/default.pa
echo control=1,20,500,-30,2,5,13,3 >> /etc/pulse/default.pa
echo .fail >> /etc/pulse/default.pa
echo .endif >> /etc/pulse/default.pa
echo set-default-sink compressor-Stereo >> /etc/pulse/default.pa
