#!/bin/bash

# Script to back up a selected folder and it's contents into a compressed tarball

datevar=$( date +'%F' )

    echo -e "\nPlease input the folder with contents to backup:\n"

read sourcevar

    echo -e "\nPlease input the destination folder for the backup to be copied:\n"

read destvar

    mkdir -p ${destvar}

        rsync -hap --size-only ${sourcevar} ${destvar}

    echo -e "\nPlease enter a name for the backup:\n"

read destname

outputfile="${datevar}-${destname}.tar.gz"

    tar -zcvf ${destvar}/${outputfile} ${sourcevar}
    find ${destvar} -type f ! -name '*.tar.gz' -delete

exit 0
