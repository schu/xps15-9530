#!/bin/bash

set -eu

echo "$@" >> /tmp/acpi_events.log

case "$1" in
  video/*)
    BRIGHTNESS_SYSFS="/sys/class/backlight/intel_backlight/brightness"
    BRIGHTNESS_MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)
    BRIGHTNESS=$(cat ${BRIGHTNESS_SYSFS})

    case "$1" in
      video/brightnessup)
        BRIGHTNESS=$((${BRIGHTNESS} + 100))
        BRIGHTNESS=$((${BRIGHTNESS}>${BRIGHTNESS_MAX}?${BRIGHTNESS_MAX}:${BRIGHTNESS}))
        echo ${BRIGHTNESS} > "${BRIGHTNESS_SYSFS}"
        ;;
      video/brightnessdown)
        BRIGHTNESS=$((${BRIGHTNESS} - 100))
        BRIGHTNESS=$((${BRIGHTNESS}>100?${BRIGHTNESS}:100))
        echo ${BRIGHTNESS} > "${BRIGHTNESS_SYSFS}"
        ;;
    esac
    ;;
esac
