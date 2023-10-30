#!/bin/bash
# God Is Firs
# This script is licensed under the GNU General Public License, version 3.
# (c) 2023 <perdomojuan187@gmail.com>

# This script is designed to list and remove old kernels in Fedora.
# Please refer to Fedora documentation for more details on old kernels and their removal.

# You can find a copy of the GNU General Public License at
# <https://www.gnu.org/licenses/gpl-3.0.html>.

# This script is provided "as is", without warranty or conditions of any kind, express or implied.
# Refer to the GNU General Public License for the complete details.

# Author: Jakepy
# Version: 1.0



# colors prompt
# reset colors
re="\033[0m"
# red
red="\033[31m"
#green
green="\033[32m"
#blue
blue="\033[34m"


if [[ $UID -ne 0 ]]; then 
    echo -e "$green$USER$red you must run the script as root $re"
    exit 1
fi



# path temp to list kernels and creatr form rute 
tmp_list_kernel_path=/tmp/list_kernel.txt
touch $tmp_list_kernel_path 2>/dev/null
# arguments 
args1=$1
# arguments 2
args2=$2
# N args 
n_args=$#

function list_kernel() {
    echo -e "$gree[+] Listing kernels$re"
    rpm -qa kernel\* | sort -V > $tmp_list_kernel_path
    cat $tmp_list_kernel_path
    exit 0
}


function get_my_kernel() {
    echo "Kernel Installed Release:"
    echo -e "\t$green kernel-`uname --kernel-release` $re"
    echo "Version Kernel Installed:"
    echo -e "\t$green `uname --kernel-version`"
    exit 0
}


function delete_kernel() {
    if [ -z $args2 ]; then
        echo -e "\r$red you must enter the option to erase the kernel.$re"
        exit 1
    fi

    for list in $(cat $tmp_list_kernel_path); do
        if [ $args2 == $list ]; then
            echo -e "\r$green Removing:$re $list"
            sleep 1
            sudo dnf remove $list -y >/dev/null
            clear 
            echo -e "$green He was removed:$re $args2"
            rm -r --force $tmp_list_kernel_path
            exit 0
        fi
    done

    echo -e "$red Kernel not found, possibly does not exist or has been uninstalled $re"
    exit 1
}


function grep_kenel_list() {
    # check if you have anything args2
    if [ -z $args2 ]; then
        echo -e "\r$red You must have the kernel you want to search for.$re"
        exit 1
    fi

    for line in $(cat $tmp_list_kernel_path); do
        if [ $args2 == $line ]; then
            echo -e "\rThe kernel exists $green[OK]$re"
            echo -e "\n--> $line"
            return $line
            exit 0
        fi
    done
            
    echo -e "\r$red\rThis kernel $green $args2$re $red no exits
    \ror it may be uninstalled.$re
    "
    exit 1
}



function main() {
    use="\n
    \rfor more information use $green--help $re or $green -h $re"

    if [[ $n_args -eq 0 ]]; then
        echo -e $use
        exit 1
    fi



    if [ $args1 == "--help" -o $args1 == "-h" ]; then
        echo -e "\rUsage: rmkernel [args]...
        \rList your kernels installed on$blue fedora$re and remove them from your system.

        \rRequired arguments apply to both long and short arguments.

        \r-gk   --get-my-kernel       Print your kernel version and release

        \r-lk,  --list-kernels        Lists the kernels installed on your system

        \r-sk,  --search-kernel       Search a kernel from list, -sk [kernel-...]      
        
        \r-rk   --remove-kernel       Delete a kernel specified by args, -rk [kernel...]

        \r-h,   --help                Print the help and exit successfully [0]

        \r-v,  --version              Prints the version of the script and has an output [0]
        "
        exit 0
    fi


    if [ $args1 == "-v" -o $args1 == "--version" ]; then
        echo -e "\rrmkernel 1.0
        \rCopyright (C) 2023.
        \rLicense GPLv3 GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>.
        \rThis is free software: you are free to change and redistribute it.

        \rWritten by: Jakepy perdomo"
        
        exit 0

    elif [ $args1 == "-gk" -o $args1 == "--get-my-kernel" ]; then
        get_my_kernel
    elif [ $args1 == "-lk" -o $args1 == "--list-kernels" ]; then
        list_kernel
    elif [ $args1 == "-sk" -o $args1 == "--search-kernel" ]; then
        grep_kenel_list
    elif [ $args1 == "-rk" -o $args1 == "--remove-kernel" ]; then
        delete_kernel
    fi
}

main



































