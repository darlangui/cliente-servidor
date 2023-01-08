import ast
import socket

from db import DB

db = DB()
ip = "127.0.0.1"
port = 20001
buffer = 4096
server_message = "Hello UDP Client"
bytes_to_send = str.encode(server_message)
udp = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

udp.bind((ip, port))
print("UDP server up and listening")

while (True):
    client_message = udp.recvfrom(buffer)
    message = client_message[0]
    address = client_message[1]
    bytes_to_send = str(message).encode()
    client_dict = ast.literal_eval(message.decode())
    db.insert(data=client_dict)
    print(client_dict)
    udp.sendto(bytes_to_send, address)
