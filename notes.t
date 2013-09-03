parallel, inotifywait

pm-suspend-hybrid
mkdir usb; mount -t ntfs -o uid=mlucy,gid=mlucy /dev/sdb1 usb
echo 15 > /sys/class/backlight/acpi_video0/brightness # 0-15
xrandr -q
xrandr --output LVDS --auto --output VGA --auto --right-of LVDS
xrandr --output VGA --off

http://www.webupd8.org/2013/03/install-pulseaudio-with-built-in-system.html
https://wiki.archlinux.org/index.php/PulseAudio
qpaeq, pavucontrol (add sink)
sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install pulseaudio-equalizer
