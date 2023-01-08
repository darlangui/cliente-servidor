import socket
import time

from pc_info import PCInfo

pc = PCInfo()
origin = ("127.0.0.1", 20001)
buffer_size = 10000
udp = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
while True:
    pc_dict = {
        "memory": pc.get_memory_usage(),
        "cpu": pc.get_cpu_usage(),
        "disk": pc.get_disk_usage(),
        "process": pc.get_process_list(),
        "ip": origin[0],
    }
    message = str.encode(str(pc_dict))
    udp.sendto(message, origin)
    server_message = udp.recvfrom(buffer_size)
    print(server_message[0].decode())
    time.sleep(3)
