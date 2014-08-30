synclient MaxTapTime=0
xset r rate 200 25
xset m 8 10

# STOP BLANKING MY FSCKING SCREEN
xset s noblank
xset s 0 0
xset s off
xset dpms 0 0 0
xset -dpms

xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Constant Deceleration" 1.5
xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Accel Velocity Scaling" 15
