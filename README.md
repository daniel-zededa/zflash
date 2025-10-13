# ZFlash: ZEDEDA's All-in-One Flash Tool for Seamless EVE-OS Deployment

ZFlash is a user-friendly tool for flashing EVE-OS images to your devices. It simplifies the process of downloading, verifying, and flashing EVE-OS, getting you up and running in minutes. ZFlash is a fork of the popular Raspberry Pi Imager, tailored for the EVE-OS community. In addition, it can be used for general image flashing for use-cases beyond EVE-OS. 


![ZFlash Main Screen](./doc/imgs/zflash-main.png)

## Features

* **Effortless Image Selection**: Easily choose EVE-OS LTS images directly from our official GitHub repository.
* **Automatic Downloads & Verification**: ZFlash handles the entire process of downloading and verifying your selected image, ensuring integrity and saving you time.
* **Flexible Flashing Options**: Flash various image files from your local machine, providing versatile ways to manage your EVE-OS images.

---

## Getting Started

### Installation

ZFlash is available for **Windows**, **macOS**, and **Linux**. You can download the latest binaries from our [GitHub Releases page](https://github.com/zededa/zflash/releases).


> **Note for macOS and Windows Users**
> The macOS and Windows applications are not currently signed. This means you will need to accept security exceptions when installing and running the application for the first time.


## How to Use

1.  **Choose an Operating System**:
    * Click on **CHOOSE OS**.
    * You can select from the list of available EVE-OS LTS images.
    * Alternatively, you can choose 'Use custom' to select a custom image file from your computer. ZFlash supports common disk image formats (e.g., `.raw`, `.img`, `.wic`) and compressed archives (e.g., `.zip`, `.gz`, `.xz`, `.zst`).

2.  **Choose Storage**:
    * Click on **CHOOSE STORAGE**.
    * Select the USB drive or SD card you want to flash the image to.

3.  **Write the Image**:
    * Click on **NEXT** to start the flashing process.
    * ZFlash will handle the download (if you selected a hosted EVE-OS image), verification, and flashing.

---

## Connecting to a Different ZEDEDA Cluster

The EVE-OS images downloaded by ZFlash directly, are configured to connect to the `zedcloud.zededa.net` cluster. If you need to connect to a different cluster, you can do so using the text-based UI on the EVE node itself. This requires a keyboard and monitor connected to the EVE device. 

Alternatively, generate an image locally through the EVE-OS docker container tooling. A typical example:

```
mkdir eve-overrides
echo "zedcloud.zededa.net" > eve-overrides/server
# Linux/MacOS:
docker run --rm -v $PWD/eve-overrides:/in --platform=linux/amd64 lfedge/eve:14.5.1-lts -f raw installer_raw > installer.raw
# Windows:
docker run --rm -v $PWD/eve-overrides:/in --platform=linux/amd64 lfedge/eve:14.5.1-lts -f raw installer_raw
```

Configure the cluster (server) address as appropriate and use Zflash to burn the generated image to a bootable medium. 

---

## For Developers

For information on how to build ZFlash from source, and other developer-related documentation, please see our [DEVELOPER.md](DEVELOPER.md) file.

---

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](license.txt) file for details.