#!/bin/bash

# Take input from user:

    echo -e "\nPlease input IP address / range to scan:\n"

    read iprange

    echo -e "\nPlease enter the port range to scan:\n"

    read port

        nmap -Pn -p ${port} ${iprange}
