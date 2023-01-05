CSUMB Capstone Fall AY 2020 
================

We explore the possibility of gaining insight into country-specific foreign
policy with the Global Database of Events, Language, and Tone (GDELT).

**Table of Contents**

-   [Background](#background)
-   [MySQL Database Queries](#mysql-database-queries)


Background
-----

More information on the GDELT can be found [here](https://www.gdeltproject.org/).
The database is available on the Google Cloud Platform [here](https://console.cloud.google.com/marketplace/details/the-gdelt-project/gdelt-2-events)
and can be accessed through the Big Query API.

MySQL Database Queries
-----

In order to make queries to the MySQL `gdelt` database, you'll need a client.
One popular client is [MySQL Workbench](https://www.mysql.com/products/workbench/).

In the example below, we'll use the *mysql-connector-python* package to query 
the the `events` table in the `gdelt` database. 
.

```python
import mysql.connector

db = mysql.connector.connect(
  host="dd6cwdpxiim2v2.cbghl9qobm13.us-east-2.rds.amazonaws.com",
  user="gdelt",
  passwd="gdeltinternship!",
  database="gdelt"
)

cursor = db.cursor()

cursor.execute("SELECT * FROM events LIMIT 10")

result = cursor.fetchall()

for x in result:
  print(x)
```

*Note*: The *events* table has 436,087,679 rows and is about 170GB in size. 
`SELECT *` operations may take a long time, especially if you haven't added 
appropriate indexes to the table.

*Exercise*: read the result into a Pandas Dataframe.








