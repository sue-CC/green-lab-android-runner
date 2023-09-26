import json
import random
import time
from telethon import TelegramClient, sync

# These example values won't work. You must get your own api_id and
# api_hash from https://my.telegram.org, under API Development.

# receivers
# SeismoLau
# clytze123
# joeyyyy12

with open('config.json', 'r') as json_file:
        data = json.load(json_file)
        api_id = data["api_id"]
        api_hash = data["api_hash"]
        session_name = data["session_name"]
        receiver = data["receiver"]
        messages = data["messages"]
        nr_of_messages = data["nr_of_messages"]
        send_interval = data["send_interval"]
        repetition = data["repetition"]
        repetition_interval = data["repetition_interval"]


client = TelegramClient(session_name, api_id, api_hash).start()

# def connect():
#     me = client.get_me()
#     print(me.stringify())

def send_message():
    message = random.choice(messages)
    message = "[" + time.strftime(" at %H:%M:%S", time.localtime()) + "] " + message
    client.send_message(receiver, message)
    print( message )

def auto_sending():
    for _ in range(nr_of_messages):
        send_message()
        time.sleep(send_interval)

def repeat_auto_sending():
     for _ in range(repetition):
        print("\033[93m {}\033[00m" .format("repetition: " + str(_ + 1)))
        # print("repetition: " + str(_ + 1))
        auto_sending()
        time.sleep(repetition_interval)

def main():
    print("sending messages to ====> " + receiver)
    repeat_auto_sending()

if __name__ == "__main__":
    main()
