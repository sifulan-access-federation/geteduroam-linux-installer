# geteduroam Linux Installer

## Overview

This script will install the geteduroam Linux client to your system.

## Installation

1. Clone this terminal on your system:

    ```sh
    git clone https://github.com/sifulan-access-federation/geteduroam-linux-installer.git
    ```

2. Get into the `geteduroam-linux-installer` directory:

    ```sh
    cd geteduroam-linux-installer
    ```

3. Ensure the installer script is executable:

    ```sh
    chmod +x install.sh
    ```

4. Run the installer script:

    ```sh
    ./install.sh
    ```

    > [!IMPORTANT]  
    > By default, this will install the geteduroam Linux client to `/usr/local/bin`. Ensure that this directory is in your `PATH` environment variable.

## Uninstallation

To uninstall the geteduroam Linux client installed by the installer script, simply remove the binaries installed from your system.

If the binaries were installed to the default `/usr/local/bin` directory, run the following command:

```sh
sudo rm /usr/local/bin/geteduroam-cli /usr/local/bin/geteduroam-gui
```

## Advanced Usage

- To install the geteduroam Linux client to a custom binary prefix (instead of the default `/usr/local/bin`), run the installer script followed by the desired binary prefix:

    ```sh
    ./install.sh ~/.local/bin
    ```

- This installer is currently set to only install the `0.1` pre-release version of the geteduroam Linux client. To install a different version, update the installer script and change the `download_link` value.

    Update the installer:

    ```sh
    nano install.sh
    ```

    Update the value of the `download_link` variable:

    ```sh
    download_link="https://github.com/geteduroam/linux-app/releases/download/0.1/linux-app_0.1_linux_amd64.tar.gz"
    ```
