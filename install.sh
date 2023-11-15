#!/bin/bash


if [[ $UID -ne 0 ]]; then 
    echo -e "\rUse: sudo"
    exit 1
fi

clear 


echo "installing in the path /usr/bin/"
sleep 1
cp ./rmkernel.sh /usr/bin/rmkernel
echo "[ok] Installation successful"
sleep 1
echo -e "\rUse: rmkernel -h for more info
If you find an error you can report it at: https://github.com/JuanPerdomo00/rmkernel/issues
"


