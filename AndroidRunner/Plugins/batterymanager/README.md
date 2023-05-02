# BatteryManager Plugin
This plugin uses the Android BatteryManager API to gather battery related data. The plugin works using the 
[BatteryManager companion app](https://github.com/Raiduy/ar-batterymanager-script/releases). 

## Dependencies and Requirements
* BatteryManager companion app has to be installed on the device with all permissions granted. 
  * [apk](https://github.com/Raiduy/ar-batterymanager-script/releases) (https://github.com/Raiduy/ar-batterymanager-script/releases)
  * [code](https://github.com/Raiduy/ar-batterymanager-script/) (https://github.com/Raiduy/ar-batterymanager-script/)
* `BATTERY_PLUGGED_DOCK` data point is available for Android version Tiramisu (API Level 33) and above.
* `EXTRA_BATTERY_LOW` data point is available for Android version P (Pie) (API Level 28) and above.
## Configuration
The following is an example configuration that contains all the possible values for the `data_points` and 
`persistency strategy` fields.

```json
  ...
  "profilers": {
    "batterymanager": {
      "sample_interval": 500,
      "data_points": [
        "ACTION_CHARGING", "ACTION_DISCHARGING",
        "BATTERY_HEALTH_COLD", "BATTERY_HEALTH_DEAD", "BATTERY_HEALTH_GOOD",
        "BATTERY_HEALTH_OVERHEAT",
        "BATTERY_HEALTH_OVER_VOLTAGE", "BATTERY_HEALTH_UNKNOWN",
        "BATTERY_HEALTH_UNSPECIFIED_FAILURE",
        "BATTERY_PLUGGED_AC", "BATTERY_PLUGGED_DOCK", "BATTERY_PLUGGED_USB",
        "BATTERY_PLUGGED_WIRELESS",
        "BATTERY_PROPERTY_CAPACITY", "BATTERY_PROPERTY_CHARGE_COUNTER",
        "BATTERY_PROPERTY_CURRENT_AVERAGE",
        "BATTERY_PROPERTY_CURRENT_NOW", "BATTERY_PROPERTY_ENERGY_COUNTER",
        "BATTERY_PROPERTY_STATUS",
        "BATTERY_STATUS_CHARGING", "BATTERY_STATUS_DISCHARGING", "BATTERY_STATUS_FULL",
        "BATTERY_STATUS_NOT_CHARGING", "BATTERY_STATUS_UNKNOWN",
        "EXTRA_BATTERY_LOW", "EXTRA_HEALTH", "EXTRA_ICON_SMALL", "EXTRA_LEVEL", "EXTRA_PLUGGED",
        "EXTRA_PRESENT", "EXTRA_SCALE", "EXTRA_STATUS",
        "EXTRA_TECHNOLOGY", "EXTRA_TEMPERATURE", "EXTRA_VOLTAGE"
      ],
      "persistency_strategy": [
        "csv", "adb_log"
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
* `csv` - stores the data in a CSV file on the device, then pulls the file from the device and stores it locally.
* `adb_log` - uses the Android logs to extract the data from the companion app. 

## Limitations and Known Issues
* The `EXTRA_*` values do not update between runs. We are working on a fix for this issue.
* The companion app keeps everything in memory and then dumps it to a csv file. This means that if the user wants to use 
  memory as a dependent variable, they should not use the `csv` persistency strategy.
* Very low `sample_interval` values causes the number of observations from the companion app to be inconsistent.

