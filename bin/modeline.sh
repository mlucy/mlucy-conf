#!/bin/bash
printf "%s | Brightness: %s/%s | Volume: %s | %s" \
    "`date`" \
    "`cat /sys/class/backlight/acpi_video0/brightness`" \
    "`cat /sys/class/backlight/acpi_video0/max_brightness`" \
    "`vset`" \
    "`acpi -b`"