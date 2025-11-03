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

# Author: Jakepys
# Version: 1.0


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


