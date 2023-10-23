# Experimental Process

## Preparation

1. Get a Raspberry Pi (RPi) with a TF card.
2. If Raspberry Pi OS is not installed on the TF card, install it using [Raspberry Pi Imager](https://www.raspberrypi.org/software/).
   1. Insert the TF card into your personal computer (PC).
   2. Select Raspberry Pi OS (32-bit) "A port of Debian with the Raspberry Pi Desktop (Recommended)" as the OS.
   3. If needed, click the settings icon ⚙️ and do some configurations, e.g., login and password, Wi-Fi SSID and password. Note: "Enable SSH" must be enabled.
   4. Select the inserted TF card as the storage and click "Write". Then await its completion.
3. Insert the TF card into the RPi and connect the RPi and your PC to the same LAN (e.g., connect to the same wireless router).
4. Power on the RPi and connect to it via SSH using your PC.
   1. Find the IP address of the RPi. For example, you can login to your wireless router and find the IP address of the RPi in the DHCP client list (or some other similar settings items).
   2. Login to the RPi via SSH in a terminal (Bash / PowerShell / ...)

## Step

Clone the code of the entire experiment:
```bash
git clone https://github.com/Yunabell-VU/green-lab-android-runner --branch android-runner-kit
```
