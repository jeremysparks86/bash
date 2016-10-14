#!/bin/bash

# Script to check the A records and CNAME from an input file of domains
# 2016 Jeremy Sparks

report=( ${HOME}/bin/domaincheck/dns_report.csv )
import=( $1 )

shelloutput () {

# Outputs to the terminal

    for domain in ${list}; do

        result_cname=$( dig ${domain} CNAME +short )
        result_a=$( dig ${domain} A +short )

        output_a=$( [ -z "${result_a}" ] && echo "${domain} : - " || echo "${domain} : [${result_a}]" )
        output_c=$( [ -z "${result_cname}" ] && echo " - " || echo "[${result_cname}]" )

        echo ${output_a} ${output_c}

    done
}

fileoutput () {

# Outputs to ${HOME}/bin/dns_report.csv

    for domain in ${list}; do

        result_cname=$( dig "${domain}" CNAME +short )
        result_a=$( dig "${domain}" A +short )

        output_a=$( [ -z "${result_a}" ] && echo "${domain} : - " || echo "${domain} : [${result_a}]" )
        output_c=$( [ -z "${result_cname}" ] && echo " - " || echo "[${result_cname}]" )

        echo ${output_a} ${output_c} >> ${report}

    done
}

grepoutput () {

# Allows user to search for a certain string to filter the output

    echo -e "\nPlease enter a search term."

    read grepinput

    echo -e "\nWould you like to output this to a file? (yes/no)"

    read fileinput

    for domain in ${list}; do

        result_cname=$( dig "${domain}" CNAME +short )
        result_a=$( dig "${domain}" A +short )

        output_a=$( [ -z "${result_a}" ] && echo "${domain} : - " || echo "${domain} : [${result_a}]" )
        output_c=$( [ -z "${result_cname}" ] && echo " - " || echo "[${result_cname}]" )

        case ${fileinput} in

            yes)
            echo ${output_a} ${output_c} | egrep ${grepinput} >> ${report}
            ;;
            no)
            echo ${output_a} ${output_c} | egrep ${grepinput}
            ;;

        esac

    done
}

readinput () {

# Takes input and executes one of the above funtions

echo -e "\nPlease choose to output to the shell or export to a file."
echo -e "\nEnter 'shell', 'file' or 'filter' (without the quotes):"

read input

    case "${input}" in

        shell)
        shelloutput
        ;;
        file)
        fileoutput
        ;;
        filter)
        grepoutput
        ;;

    esac
}


    if [ $# -lt 1 ]; then

        echo -e "\nYou need to specify a file to process. Exiting.\n"

        exit 0

    else

        list=$( cat ${import} )
        readinput

        echo -e "\nCompleted.\n"

    fi
