#!/bin/bash
printf "%s | Brightness: <%s/15> | %s" \
    "`date`" \
    "`cat /sys/class/backlight/acpi_video0/brightness`" \
    "`acpi -b`"