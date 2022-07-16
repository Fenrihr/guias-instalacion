Easy install. Arch (Endeavour) 22.1 with KDE 5.24.4 on X11

Download ONE of the following:
PacketTracer Download (Network Academy Student Login Required): https://www.netacad.com/portal/node/488
Packet Tracer Download (Free Account Required): https://skillsforall.com/resources/lab-downloads

Commands:
```shell
#git clone https://aur.archlinux.org/packettracer.git
tar -zxf the packettracer.tar.gz

cp Cisco_Packet_Tracer_811_Ubuntu_64bit_cf200f5851.deb packettracer/CiscoPacketTracer_811_Ubuntu_64bit.deb

cd packettracer

# sudo pacman -Syu qt5-multimedia qt5-webengine qt5-svg qt5-networkauth qt5-websockets qt5-script qt5-speech
makepkg -i

cd ..
rm -R packettracer
```

