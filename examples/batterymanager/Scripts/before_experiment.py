# noinspection PyUnusedLocal
import os


def main(device, *args, **kwargs):
    # path = '/home/radu/VU/GreenLab-TA/android-apps-benchmark/APKs'
    #
    # for folder in os.listdir(path):
    #     for apk in os.listdir(path + '/' + folder):
    #         print(apk)
    #         device.install(path + '/' + folder + '/' + apk)

    device.install('/home/radu/VU/GreenLab-TA/ar-batterymanager-script/app/build/outputs/apk/debug/app-debug.apk')

