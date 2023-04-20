#!/bin/bash

# Deafult Port
def_port='8080'

# Color Codes
CR=$'\e[1;31m' CG=$'\e[1;32m' CY=$'\e[1;33m' CB=$'\e[1;34m' CC=$'\e[1;36m' CW=$'\e[1;37m' RS=$'\e[1;0m'

architecture=`uname -m`

# Terminate Program
terminated() {
        printf "\n\n${RS} ${CR}[${CW}!${CR}]${CY} Exit√√ ${CR}[${CW}!${CR}]${RS}\n"
        exit 1
        clear
}

trap terminated SIGTERM
trap terminated SIGINT

kill_pid() {
        check_PID="php ngrok cloudflared loclx"
        for process in ${check_PID}; do
                if [[ $(pidof ${process}) ]]; then
                        killall ${process} > /dev/null 2>&1
                fi
        done
}

# Host Banner


path(){



        red_path="1"

        if [[ $red_path == 1 || $red_path == 01 ]]; then
                path=$'./hosts'
        elif [[ $red_path == 0000 || $red_path == 00000 ]]; then
                printf "\n${RS} ${CC}Enter File Path [Example : /home/tahmid/htdocs]"
                printf "\n${RS}"
                printf "\n${RS} ${CR}>>${CG} ${CC}"
                read path
        else
                printf "\n${RS} ${CR}[${CW}!${CR}]${CR} Error ${CR}[${CW}!${CR}]${RS}\n"
                sleep 2 ; logo ; path
        fi

        [[ ! -d "$path" ]] && mkdir -p "$path"
        menu
}


localhost() {
cd .camera_image
        printf "\n${RS} ${CR}[${CW}-${CR}]${CY} Input Port ${CG}[test:${def_port}]: ${CC}"
        read port
        port="${port:-${def_port}}"
        printf "\n${RS} ${CR}[${CW}-${CR}]${CG} Starting PHP Server on Port ${CY}${port}${RS}\n"
        php -S 127.0.0.1:"$port" > /dev/null 2>&1 &
        sleep 2
        printf "\n${RS} ${CR}[${CW}-${CR}]${CG} link : ${CY}http://127.0.0.1:$port ${RS}"
        printf "\n\n${RS} ${CR}[${CW}-${CR}]${CR} open ngrok to port:$port ${CG}:-)"
        printf "\n\n ${CR}[${CW}-${CR}]${CC} Press Ctrl + C to exit.${RS}\n"
        while [ true ]; do
                sleep 0.75
        done
}

## Start ngrok

## Start LocalXpose


menu() {

                        localhost;
}

kill_pid
path
