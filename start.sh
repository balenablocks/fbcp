#!/bin/sh

if [ -z "${FBCP_DISPLAY}" ]
then
   echo "WARNING: FBCP_DISPLAY variable not set."
   echo " Set the value if you are using an attached display."
   tail -f /dev/null
else
   "/usr/bin/fbcp-${FBCP_DISPLAY}"
fi
