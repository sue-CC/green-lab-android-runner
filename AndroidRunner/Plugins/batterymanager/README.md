# BatteryManager Plugin
This plugin uses the Android BatteryManager API to gather battery related data. The plugin works using the 
[BatteryManager companion app](https://github.com/Raiduy/ar-batterymanager-script/releases). 

## Dependencies and Requirements
* BatteryManager companion app has to be installed on the device with all permissions granted. 
  * [apk](https://github.com/Raiduy/ar-batterymanager-script/releases) (https://github.com/Raiduy/ar-batterymanager-script/releases)
  * [code](https://github.com/Raiduy/ar-batterymanager-script/) (https://github.com/Raiduy/ar-batterymanager-script/)
* `BATTERY_PLUGGED_DOCK` data point is available for Android version Tiramisu (API Level 33) and above.
* `EXTRA_BATTERY_LOW` data point is available for Android version P (Pie) (API Level 28) and above.
* The `EXTRA_*` values do not update between runs with the original Android Runner version. In order to have the values 
  update as intended, the `device.unplug(restart)` line in [AndroidRunner/Experiment.py](../../Experiment.py), 
  `prepare_device` function should be removed.
## Configuration
The following is an example configuration that contains all the possible values for the `data_points` and 
`persistency strategy` fields.

```json
  ...
  "profilers": {
    "batterymanager": {
      "sample_interval": 1000,
      "data_points": [
        "BATTERY_PROPERTY_CURRENT_NOW", "EXTRA_VOLTAGE"
      ],
      "persistency_strategy": [
        "adb_log"
      ]
    }
  },
  ...
```
**sample_interval** *int* 
How often the data should be gathered in milliseconds. (can be equal to 0, in which case the companion app will record 
continuously, see Limitations and Known Issues section for more information on recording continuously).

**data_points** *Array<string>* 
The data points that should be gathered. All the available data points are listed above in the config sample.
For further information on each of the data points, please refer to the 
[Android BatteryManager API documentation](https://developer.android.com/reference/android/os/BatteryManager#summary)
(https://developer.android.com/reference/android/os/BatteryManager#summary).
* `BATTERY_PLUGGED_DOCK` data point is available for Android version Tiramisu (API Level 33) and above.
* `EXTRA_BATTERY_LOW` data point is available for Android version P (Pie) (API Level 28) and above.

**persistency_strategy** *Array<string>* 
The persistency strategy that should be used. The available options are:
* `adb_log` - uses the Android logs to extract the data from the companion app.
* `csv` - stores the data in a CSV file on the device, then pulls the file from the device and stores it on the computer.
  ***Flaky on old devices!!***

## Limitations and Known Issues
* The companion app keeps everything in memory and then dumps it to a csv file. This means that if the user wants to use 
  memory as a dependent variable, they should not use the `csv` persistency strategy.
* Very low `sample_interval` values causes the number of observations from the companion app to be inconsistent between 
  runs.
* Running the BatteryManager app, using the `csv` persistency strategy can crash on older devices. We recommend using 
  `adb_log` strategy.  

