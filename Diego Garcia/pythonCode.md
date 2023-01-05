I use spyder software to get the results


---python code ----

import mysql.connector

db = mysql.connector.connect(
  host="dd6cwdpxiim2v2.cbghl9qobm13.us-east-2.rds.amazonaws.com",
  user="gdelt",
  passwd="gdeltinternship!",
  database="gdelt"
)


cursor = db.cursor()


cursor.execute("SELECT MentionSourceName from eventmentions where GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'IN') limit 10;")
#cursor.execute("SELECT MentionSourceName,count(*), AVG(MentionDocTone), STDDEV(MentionDocTone) from eventmentionsAND WHERE MentionSourceName = 'yahoo.com' AND WHERE MentionSourceName = 'indiatimes.com'AND where GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = 'IN')") 
cursor.execute("SELECT MentionSourceName, count(*) as sourceMentionCount FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = '" + shortCountryCode + "') GROUP BY MentionSourceName ORDER BY sourceMentionCount DESC;")
#cursor.execute("SELECT count(*), AVG(MentionDocTone), STDDEV(MentionDocTone) FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = ' IN ') GROUP BY MentionSourceName ORDER BY sourceMentionCount DESC")

#to find the average tone and confident level
#cursor.execute("SELECT count(*), AVG(MentionDocTone), STDDEV(MentionDocTone) FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID=m.GLOBALEVENTID AND (m.MentionSourceName='thenews.com.pk' OR m.MentionSourceName='nation.com.pk' OR m.MentionSourceName='tribune.com.pk' OR m.MentionSourceName='dailytimes.com.pk' OR m.MentionSourceName='dawn.com' OR m.MentionSourceName='brecorder.com') AND m.Confidence>=30 AND (e.Actor1CountryCode='CHN' OR e.Actor2CountryCode='CHN') AND e.ActionGeo_CountryCode='PK'")

#cursor.execute("SELECT MentionSourceName from eventmentions WHERE MentionSourceName = 'yahoo.com' AND WHERE MentionSourceName = 'indiatimes.com'")
result = cursor.fetchall()



for x in result:
  print(x)


-------- Python code ---------  
  