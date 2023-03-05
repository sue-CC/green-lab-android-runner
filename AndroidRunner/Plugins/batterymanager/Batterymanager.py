import csv
import os
import os.path as op
import threading
import time
import timeit
from collections import OrderedDict
from functools import reduce

from AndroidRunner import util
from AndroidRunner import Tests
from AndroidRunner.Plugins.Profiler import Profiler


class Batterymanager(Profiler):
    def __init__(self, config, paths):
        super(Batterymanager, self).__init__(config, paths)
        self.output_dir = ''
        self.paths = paths
        self.profile = False
        available_data_points = ['cpu', 'mem']
        self.interval = float(Tests.is_integer(
            config.get('sample_interval', 0))
        ) / 1000
        self.data_points = config['data_points']
        invalid_data_points = [
            dp for dp in config['data_points'] if dp not in set(available_data_points)]
        if invalid_data_points:
            self.logger.warning(
                'Invalid data points in config: {}'.format(invalid_data_points))
        self.data_points = [dp for dp in config['data_points']
                            if dp in set(available_data_points)]
        self.data = [['datetime'] + self.data_points]
        self.lock = threading.Lock()

    