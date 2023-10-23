# Experimental Process

The procedures are successfully completed on a Raspberry Pi 3B with 1 GB memory.

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
git clone https://github.com/Yunabell-VU/green-lab-android-runner --branch android-runner-kit # clone to ./green-lab-android-runner
```
Create a virtual environment and install the dependencies:
```bash
python3 -m venv venv # The 2nd "venv" is the pathname of the virtual environment relative to the current directory (.). You may change it to another name.
```

Activate the virtual environment:
```bash
source venv/bin/activate
```

Install the dependencies:
```bash
sudo apt install adb android-sdk openjdk-17-jre uhubctl python3-lxml tmux
cd green-lab-android-runner
python3 -m pip install -r requirements.txt
```

Enable wireless debugging (in Developer Options) on the Android phone under test.  
Connect the Android device to the same LAN as the RPi.  
Connect the Android device to the RPi via USB.  
Check the IP address of the Android phone, similar to checking the IP address of the RPi before.  

If this Android device has not been connected to the RPi before, run the following command first:
```bash
adb tcpip 5037 # 5037 is the port number that Android Debug Bridge (ADB) will connect later. You may change it to another port.
```

Connect ADB to the Android device:
```bash
adb connect 192.168.0.100:5037
```
If connection failed, you can try to restart the ADB server:
```bash
adb kill-server
adb start-server
```
or restart the Android device, and then retry.

Fill in the root object of devices.json in the root of the cloned repository, just like the existent device information. For instance,
```json
"pixel5g-wifid": "192.168.0.100:5037"
```
Here "pixel5g-wifid" is a device name used by the JSON configuration files of the experiment. You may change it to another name.

Check the experiment configuration files cfg-chrome.json and cfg-firefox.json in the "exp" directory of the cloned repository. In the "devices" key, fill in the device name you just filled in devices.json. For instance,
```json
"devices": {
    "pixel5g-wifid": {}
}
```
Note: When needed, some experimental configurations can be designated in the blank {} above. See the pages of [Android Runner](https://github.com/S2-group/android-runner).

For our experiment, to reduce fluctuation of measurements as much as possible:
1. Disable all the sounds and vibrations on the Android device under test. 
2. Set "Background process limit" as "No background processes" in Developer Options on the Android device under test.
3. Prepare a Telegram account with no contacts added and no groups joined.

Our experiment is executed with Chrome and Firefox, as well as Telegram Web. Before the beginning of the execution, you need to login to Telegram Web on the Android device under test.

You should adjust necessary settings according to the contents of the experiment before starting, e.g., brightness, notifications on lock screen (show or don't show any notifications, ...), etc.

If you want to keep the experiment running after you disconnect from the RPi, you can use [tmux](https://github.com/S2-group/android-runner/blob/master/docs/rpi_ar_setup.md#tips--tricks) before running the experiment.

Run the experiment:
```bash
python3 run.py --config exp/cfg-chrome.json
python3 run.py --config exp/cfg-firefox.json
```

Then you do not need to do anything else. The whole experiment will be executed automatically. You can check the progress of the experiment in the terminal. The experimental results (energy data in CSV files) are saved in the exp/output directory.

