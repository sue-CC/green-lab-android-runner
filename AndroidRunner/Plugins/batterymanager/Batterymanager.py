import os
import os.path as op
import time
from AndroidRunner.Plugins.Profiler import Profiler


class Batterymanager(Profiler):

    AVAILABLE_DATA_POINTS = ['ACTION_CHARGING', 'ACTION_DISCHARGING',
                             'BATTERY_HEALTH_COLD', 'BATTERY_HEALTH_DEAD', 'BATTERY_HEALTH_GOOD',
                             'BATTERY_HEALTH_OVERHEAT',
                             'BATTERY_HEALTH_OVER_VOLTAGE', 'BATTERY_HEALTH_UNKNOWN',
                             'BATTERY_HEALTH_UNSPECIFIED_FAILURE',
                             'BATTERY_PLUGGED_AC', 'BATTERY_PLUGGED_DOCK', 'BATTERY_PLUGGED_USB',
                             'BATTERY_PLUGGED_WIRELESS',
                             'BATTERY_PROPERTY_CAPACITY', 'BATTERY_PROPERTY_CHARGE_COUNTER',
                             'BATTERY_PROPERTY_CURRENT_AVERAGE',
                             'BATTERY_PROPERTY_CURRENT_NOW', 'BATTERY_PROPERTY_ENERGY_COUNTER',
                             'BATTERY_PROPERTY_STATUS',
                             'BATTERY_STATUS_CHARGING', 'BATTERY_STATUS_DISCHARGING', 'BATTERY_STATUS_FULL',
                             'BATTERY_STATUS_NOT_CHARGING', 'BATTERY_STATUS_UNKNOWN',
                             'EXTRA_BATTERY_LOW', 'EXTRA_HEALTH', 'EXTRA_ICON_SMALL', 'EXTRA_LEVEL', 'EXTRA_PLUGGED',
                             'EXTRA_PRESENT',
                             'EXTRA_SCALE', 'EXTRA_STATUS', 'EXTRA_TECHNOLOGY', 'EXTRA_TEMPERATURE', 'EXTRA_VOLTAGE']

    AVAILABLE_PERSISTENCY_STRATEGIES = ['csv', 'adb_log']

    def __init__(self, config, paths):
        super(Batterymanager, self).__init__(config, paths)
        self.output_dir = ''
        self.paths = paths
        self.profile = False

        self.sampling_rate = config.get('sample_interval', 1000)  # default: every second

        self.data_points = self.validate_config('data_points',
                                                config['data_points'],
                                                self.AVAILABLE_DATA_POINTS)

        self.persistency_strategy = self.validate_config('persistency_strategy',
                                                         config['persistency_strategy'],
                                                         self.AVAILABLE_PERSISTENCY_STRATEGIES)

    # Check if the selected data points are valid
    def validate_config(self, field, raw_data_points, available_data_points):
        invalid_data_points = [
            dp for dp in raw_data_points if dp not in set(available_data_points)]
        if invalid_data_points:
            self.logger.warning(
                'Invalid {} in config: {}'.format(field, invalid_data_points))
        return [dp for dp in raw_data_points
                if dp in available_data_points]

    def start_profiling(self, device, **kwargs):
        if 'adb_log' in self.persistency_strategy:
            # start looking for batterymanager data
            self.logger.info('TODO: ADB LOGGING')

        device.shell(self.build_intent(True))

    def stop_profiling(self, device, **kwargs):
        device.shell(self.build_intent(False))

    def build_intent(self, is_start):
        if is_start:
            intent_data_fields = ','.join(self.data_points)
            intent_to_csv = 'true' if 'csv' in self.persistency_strategy else 'false'
            intent = f'am start-foreground-service -n "com.example.batterymanager_utility/com.example.batterymanager_utility.DataCollectionService" --ei sampleRate {self.sampling_rate} --es "dataFields" "{intent_data_fields}" --ez toCSV {intent_to_csv}'
        else:
            intent = f'am stopservice com.example.batterymanager_utility/com.example.batterymanager_utility.DataCollectionService'

        return intent

    def collect_results(self, device):
        if 'csv' in self.persistency_strategy:
            device.pull('/storage/emulated/0/Documents/BatteryManager.csv', op.join(self.output_dir, 'BatteryManager.csv'))
            device.shell('rm -f /storage/emulated/0/Documents/BatteryManager.csv')
            # rename pulled file to avoid overwriting
            if os.path.isfile(op.join(self.output_dir, 'BatteryManager.csv')):
                new_filename = '{}_{}.csv'.format(
                    device.id, time.strftime('%Y.%m.%d_%H%M%S'))
                new_name = op.join(self.output_dir, new_filename)
                old_name = op.join(self.output_dir, 'BatteryManager.csv')
                os.rename(old_name, new_name)

    def dependencies(self):
        return ['com.example.batterymanager_utility']

    def load(self, device):
        return

    def unload(self, device):
        return

    def set_output(self, output_dir):
        self.output_dir = output_dir

    def aggregate_subject(self):
        return

    def aggregate_end(self, data_dir, output_file):
        return

    def aggregate_final(self, data_dir, output_file):
        return
