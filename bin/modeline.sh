#!/bin/bash
printf "%s | Brightness: <%s/%s> | %s" \
    "`date`" \
    "`cat /sys/class/backlight/acpi_video0/brightness`" \
    "`cat /sys/class/backlight/acpi_video0/max_brightness`" \
    "`acpi -b`"