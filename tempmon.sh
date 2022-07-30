#!/bin/sh

#  This script reads the Ambient temperature value and shuts down if it
#  exceeds a particular value.
#  30ºC is the maximum allowed for my homelab in the loft...
#  ...Change as necessary for the sensor and value you want to trigger on.

# Get the reading from the Ambient sensor and strip the non-number parts
SENSOR="`/usr/sbin/ipmitool sdr elist | grep Ambient | awk '{print $(NF-2)}'`"
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
 poweroff
 echo "Initiating shutdown..."
 else
 echo "Temperature = ${TEMP} - OK"
  exit 0
fi
