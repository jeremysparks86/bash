#!/bin/bash

# Accepts raw list of domains as an argument to the script.

for domain in $( cat $1 ); do

# Performs the basic WHOIS lookup.

whois=$( whois "${domain}" )

# Greps and processes the output for the exact match *BaseKit* to confirm our authority over said domain.

    result_owner=$( echo "${whois}" | grep -o 'BaseKit' | awk 'NR==1' | sed 's/BaseKit/BaseKit owned/' )

        filter_owner=$( [ -z "${result_owner}" ] && echo " [ - ] " || echo [ "$result_owner" ] )

# Greps and processes the output to confirm the expiry date. If there is no expiry date present it will be filtered out.

    result_expiry=$( echo "${whois}" | egrep 'Expiry|Expiration' | grep -i '[0-9]\{2\}-[a-z]\{3\}-[0-9]\{4\}' | awk {'print $3'} )

        filter_expiry=$( [ -z "${result_expiry}" ] && echo "${domain}" - [ NULL ] || echo "${domain} - [ ${result_expiry} ]" )

# Prints to the output file.

echo ${filter_expiry} ${filter_owner} | grep -v NULL >> $2

done
