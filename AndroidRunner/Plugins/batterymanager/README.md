# BatteryManager Plugin

## Dependencies and Requirements

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

## Limitations and Known Issues