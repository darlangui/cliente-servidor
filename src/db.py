import mysql.connector


class DB:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="",
            database="redes_info"
        )

    def insert(self, data):
        cursor = self.conn.cursor()
        sql = f"INSERT INTO memoria (taxa) VALUES ({data['memory']});"
        cursor.execute(sql)
        self.conn.commit()
        sql = f"INSERT INTO processador (taxa) VALUES ({data['cpu']});"
        cursor.execute(sql)
        self.conn.commit()
        sql = f"INSERT INTO disco_rigido (taxa) VALUES ({data['disk']});"
        cursor.execute(sql)
        self.conn.commit()
        sql = f"INSERT INTO ip (ip) VALUES ('{data['ip']}');"
        cursor.execute(sql)
        self.conn.commit()

        for process in data['process']:
            sql = f"INSERT INTO processos (nome) VALUES ('{process}');"
            cursor.execute(sql)
            self.conn.commit()
