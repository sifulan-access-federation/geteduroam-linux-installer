#!/bin/bash

binary_prefix=${1:-"/usr/local/bin"}
download_link="https://github.com/geteduroam/linux-app/releases/download/0.1/linux-app_0.1_linux_amd64.tar.gz"

# ================= DO NOT EDIT BEYOND THIS LINE =================

# check dependencies
if ! [ -x "$(command -v curl)" ] && ! [ -x "$(command -v wget)" ]; then
    echo "Error: curl or wget is not installed. Please install one of them." >&2
    exit 1
fi
if ! [ -x "$(command -v tar)" ]; then
    echo "Error: tar is not installed. Please install tar." >&2
    exit 1
fi

echo "Installing geteduroam to ${binary_prefix}"

# download the zip file as geteduroam-linux-app.tar.gz
curl -L -o geteduroam-linux-app.tar.gz ${download_link} 2>/dev/null || (wget -O geteduroam-linux-app.tar.gz ${download_link} 2>/dev/null || (echo "Error: Failed to download the geteduroam-linux-app" && exit 1))

# extract only the binary files
tar -xzf geteduroam-linux-app.tar.gz --wildcards --no-anchored "geteduroam-cli" "geteduroam-gui"

# create binary prefix
mkdir -p ${binary_prefix} 2>/dev/null || (sudo mkdir -p ${binary_prefix} 2>/dev/null || (echo "Error: Failed to create the binary prefix" && exit 1))

# move the binaries to the binary prefix, use sudo if permission denied
mv geteduroam-cli geteduroam-gui ${binary_prefix} 2>/dev/null || (sudo mv geteduroam-cli geteduroam-gui ${binary_prefix} 2>/dev/null || (echo "Error: Failed to move binaries to the binary prefix" && exit 1))

# remove the zip file
rm geteduroam-linux-app.tar.gz
