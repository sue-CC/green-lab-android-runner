import time


def main(device, *args, **kwargs):
    time.sleep(5)  # wait for the completion of page load (mainly for Firefox)
    device.shell('input keyevent 26')  # lock screen
    time.sleep(1)
    pass
