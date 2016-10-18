#!/bin/bash

# Script to backup my test shell scripts to a remote host

localdir=$( ~/bin )
remotedir=$( pi@pi:/home/pi/bin )

echo -e "\nbinsync script initialised\n"

    scp -r ${localdir} ${remotedir}

echo -e "\nbinsync script completed\n"

exit 0
