#!/bin/bash

##### Script to sync my scripts from my local bin folder up to my VPS

localdir=( "/home/jeremy/bin/" )
remotedir=( "jeremy@139.59.191.142:/home/jeremy/bin/" )
logfile=( '/home/jeremy/bin/log/scriptsync_vps.log' )
datevar=$( date +'%F %T' )

function vps_copy {

    local srcdir=$1
    local tgtdir=$2
    rfiles=$( rsync -havp --progress --update ${localdir} ${remotedir} )
    log_it $rfiles
}

function log_it {
    echo -e "[${USER}]\n [${datevar}]\n - ${*}\n" >> ${logfile}
}

printf "\nScript sync executed by "$USER"\n\n"

    vps_copy ${localdir} ${remotedir}

printf "Script sync to VPS complete.\n\n"

exit 0

