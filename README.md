# rmkernel.sh

## Description

This script helps in managing the kernels installed on a Fedora system. It allows users to list, search, and remove kernels.

## Prerequisites

This script is intended for use on Fedora systems.

## Getting Started

To get started with the script, simply execute it from the terminal. Ensure that you have the necessary permissions to run the script.

```bash
# isntall 
./install.sh

# use 
rmkernel -h
```

### Usage

The script accepts the following arguments:

```bash
    -gk, --get-my-kernel: Prints the version and release of the installed kernel.
    -lk, --list-kernels: Lists all the kernels installed on the system.
    -sk, --search-kernel [kernel-...]: Searches for a specific kernel from the list.
    -rk, --remove-kernel [kernel...]: Deletes a specified kernel from the system.
    -h, --help: Displays the help menu.
    -v, --version: Displays the script version.
```

### License

This script is licensed under the GPLv3 GNU GPL version 3 or later. For more details, please visit: [GNU GPL License.](https://www.gnu.org/licenses/gpl-3.0.html)
