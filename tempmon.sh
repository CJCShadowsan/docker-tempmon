#!/bin/sh
#  This script reads the Broadcom SoC temperature value and shuts down if it
#  exceeds a particular value.
#  80ºC is the maximum allowed for a Raspberry Pi.

# Get the reading from the Ambient sensor and strip the non-number parts
SENSOR="/usr/sbin/ipmitool sdr elist | grep Ambient | awk '{print $(NF-2)}'"
#SENSOR="`/opt/vc/bin/vcgencmd measure_temp | cut -d "=" -f2 | cut -d "'" -f1`"
# -gt only deals with whole numbers, so round it.
TEMP="`/usr/bin/printf "%.0f\n" ${SENSOR}`"
# How hot will we allow Ambient to get?
MAX="30"

if [ "${TEMP}" -gt "${MAX}" ] ; then
 # This will be mailed to root if called from cron
 echo "${TEMP}ºC is too hot!"
 # Send a message to syslog
 /usr/bin/logger "Shutting down due to Ambient temp ${TEMP}."
 # Halt the box
 sudo /sbin/shutdown -h now
 echo "Initiating shutdown..."
 else
  exit 0
fi
