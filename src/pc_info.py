import subprocess


class PCInfo:
    @staticmethod
    def get_memory_usage():
        process = subprocess.Popen(
            ['wmic', 'OS', 'get', 'FreePhysicalMemory', '/Value'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout = process.communicate()

        return 14336 - int(int(stdout[0].decode().split('=')[1]) / 1024)

    @staticmethod
    def get_cpu_usage():
        process = subprocess.Popen(
            ['wmic', 'cpu', 'get', 'loadpercentage', '/Value'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout = process.communicate()

        return int(stdout[0].decode().split('=')[1])

    @staticmethod
    def get_disk_usage():
        process = subprocess.Popen(
            ['wmic', 'logicaldisk', 'get', 'size,freespace', '/Value'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout = process.communicate()
        free_space = stdout[0].decode().split(
            'FreeSpace=')[1].split('Size=')[0]

        return int(int(free_space) / 1024 / 1024 / 1024)

    @staticmethod
    def get_process_list():
        process = subprocess.Popen(
            ['wmic', 'process', 'get', 'name', '/Value'],
            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        stdout = process.communicate()
        process_list = stdout[0].decode().split('Name=')
        process_list.pop(0)

        return [process.replace('\r\r\n', '') for process in process_list]
