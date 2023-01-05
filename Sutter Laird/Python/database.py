import mysql.connector

class database:
    db = mysql.connector.connect(
    host="dd6cwdpxiim2v2.cbghl9qobm13.us-east-2.rds.amazonaws.com",
    user="gdelt",
    passwd="R1m23&!#Bto",
    database="gdelt"
    )
    cursor = db.cursor()

    def execute(self, query):
        try:
            self.cursor.execute(query)
            result = self.cursor.fetchall()
        except:
            result = 1
        return result