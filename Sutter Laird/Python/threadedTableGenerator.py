from countryCodeConversion import countryCodeConversion
from database import database
import csv
import mysql.connector
import mysql.connector.pooling
import threading
import faulthandler
faulthandler.enable()

# Generate table for a country using Events and Eventmentions
# ---- This does NOT use the GKG ------





def main():
    # Table generation variables. These will change depending on search parameters
    
    # southAfricaLocalSources = ["iol.co.za", "allafrica.com", "news24.com", "engineeringnews.co.za"]
    # kenyaLocalSources = ["standardmedia.co.ke", "allafrica.com", "coastweek.com", "nation.co.ke", "businessdailyafrica.com", "the-star.co.ke"]
    # zimbabweLocalSources = ["bulawayo24.com", "allafrica.com", "herald.co.zw", "thezimbabwemail.com", "thezimbabwedaily.com", "chronicle.co.zw", "zimbabwesituation.com"]
    # ethiopiaLocalSources = ["waltainfo.com", "addisfortune.net", "capitalethiopia.com", "newbusinessethiopia.com"]
    # sudanLocalSources = ["sudantribune.com", "alnilin.com", "allafrica.com", "smc.sd"]
    # zambiaLocalSources = ["lusakatimes.com", "znbc.co.zm", "allafrica.com", "daily-mail.co.zm", "times.co.zm"]
    # tanzaniaLocalSources = ["allafrica.com", "tanzaniatoday.co.tz", "dailynews.co.tz", "24tanzania.com"]
    # Had to expand into top 20 for djibouti
    # djiboutiLocalSources = ["allafrica.com", "hillaac.net", "lanationdj.com", "wardheernews.com"]
    # ugandaLocalSources = ["allafrica.com", "newvision.co.ug", "monitor.co.ug", "chimpreports.com", "observer.ug"]
    # rwandaLocalSources = ["allafrica.com", "newtimes.co.rw", "rnanews.com", "ktpress.rw"]
    # somaliaLocalSources = ["hillaac.net", "allafrica.com", "somaliamediamonitoring.org"]
    # Had to expand for mozambique. Lots of China and Macau specific sources
    # mozambiqueLocalSources = ["allafrica.com", "apanews.net", "jornalnoticias.co.mz"]
    # mauritiusLocalSources = ["defimedia.info", "lemauricien.com", "lexpress.mu", "allafrica.com", "govmu.org", "mbcradio.tv"]
    # South sudan required expanding into top 20
    # southSudanLocalSources = ["allafrica.com", "smc.sd", "radiotamazuj.org", "eyeradio.org"]
    # botswanaLocalSources = ["mmegi.bw", "allafrica.com", "sundaystandard.info", "weekendpost.co.bw", "botswanaguardian.co.bw", "thepatriot.co.bw"]
    # madagascarLocalSources = ["midi-madagasikara.mg", "newsmada.com", "lexpressmada.com"]
    # malawiLocalSources = ["nyasatimes.com", "mwnation.com", "malawivoice.com", "maravipost.com", "faceofmalawi.com", "malawi24.com"]
    # burundiLocalSources = ["arib.info", "regionweek.com", "allafrica.com"]
    # Had to expand into top 30 for Chad
    chadLocalSources = ["journaldutchad.com", "alwihdainfo.com"]
    # Top 20 for Comoros
    comorosLocalSources = ["alwatwan.net", "allafrica.com"]
    eritreaLocalSources = ["shabait.com", "tesfanews.net", "allafrica.com", "geeskaafrika.com"]
    # Top 20 for Eswatini
    eswatiniLocalSources = ["observer.org.sz", "allafrica.com"]
    lesothoLocalSources = ["sundayexpress.co.ls", "lestimes.com", "thepost.co.ls", "allafrica.com"]
    seychellesLocalSources = ["seychellesnewsagency.com", "allafrica.com", "nation.sc"]

    dbconfig = {
        "host": "dd6cwdpxiim2v2.cbghl9qobm13.us-east-2.rds.amazonaws.com",
        "user": "gdelt",
        "password": "gdeltinternship!",
        "database": "gdelt"
    }
    cnxpool = mysql.connector.pooling.MySQLConnectionPool(pool_name = "mypool", pool_size = 20, **dbconfig)

    # Important "constants"
    westernSources = ["yahoo.com", "bbc.co.uk", "foxnews.com", "nbcnews.com", "go.com", "cbsnews.com", "nytimes.com", "msn.com", "usatoday.com", "npr.org"]
    chineseSources = ["xinhuanet.com", "chinadaily.com.cn", "china.org.cn", "ecns.cn", "peopledaily.com.cn"]

    threads = list()
    country1 = threading.Thread(target=performQueriesForCountry, args=("Chad", chadLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country1)

    country2 = threading.Thread(target=performQueriesForCountry, args=("Comoros", comorosLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country2)

    country3 = threading.Thread(target=performQueriesForCountry, args=("Eritrea", eritreaLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country3)

    country4 = threading.Thread(target=performQueriesForCountry, args=("Eswatini", eswatiniLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country4)

    country5 = threading.Thread(target=performQueriesForCountry, args=("Lesotho", lesothoLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country5)

    country6 = threading.Thread(target=performQueriesForCountry, args=("Seychelles", seychellesLocalSources, westernSources, chineseSources, 100, cnxpool))
    threads.append(country6)

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    print("---------- Done ----------")





def performQueriesForCountry(countryName, localSources, westernSources, chineseSources, minimumConfidenceLevel, connectionPool):
    print("----------- Started thread for " + countryName + " -----------")
    resultsDict = dict()
    threads = list()

    western = threading.Thread(target=getToneStats, args=(connectionPool.get_connection(), countryName, westernSources, "Western", minimumConfidenceLevel, resultsDict))
    threads.append(western)

    chinese = threading.Thread(target=getToneStats, args=(connectionPool.get_connection(), countryName, chineseSources, "Chinese", minimumConfidenceLevel, resultsDict))
    threads.append(chinese)

    local = threading.Thread(target=getToneStats, args=(connectionPool.get_connection(), countryName, localSources, "Local", minimumConfidenceLevel, resultsDict))
    threads.append(local)

    for thread in threads:
        thread.start()

    for thread in threads:
        thread.join()

    generateCSVResults(countryName, resultsDict, minimumConfidenceLevel)
    print("----------- Completed " + countryName + " -----------")





def getToneStats(connection, targetCountry, sourceList, sourceListName, minimumConfidenceLevel, resultsDict):
    query = "SELECT count(*), AVG(MentionDocTone), STDDEV(MentionDocTone) " + getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel)
    # print(query)
    cursor = connection.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    resultsDict[sourceListName + "_avgTone"] = results[0][1]
    resultsDict[sourceListName + "_stDev"] = results[0][2]
    resultsDict[sourceListName + "_numArticles"] = results[0][0]





# getQueryConditions builds the inner join and inserts the conditions (country, sources, and confidence level)
def getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel):
    # Get two letter country code for ActionGeo_CountryCode attribute
    shortCountryCode = countryCodeConversion().fipsNameToCode(targetCountry)
    # Setup query
    query = "FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID=m.GLOBALEVENTID AND ("
    # Populate sources
    for source in sourceList:
        query += "m.MentionSourceName='" + source + "' OR "
    # Add 0=1 to deal with trailing OR and add confidence level
    query += "0=1) AND m.Confidence>=" + str(minimumConfidenceLevel)
    # Add country conditions including China for either actor and target for ActionGeo_CountryCode
    query += " AND (e.Actor1CountryCode='CHN' OR e.Actor2CountryCode='CHN') AND e.ActionGeo_CountryCode='" + shortCountryCode + "';"
    return query





def generateCSVResults(targetCountry, resultsDict, minimumConfidenceLevel):
    with open(targetCountry + "_table_conf" + str(minimumConfidenceLevel) + ".csv", 'w') as csvfile:
        # Create a CSV writer object 
        csvwriter = csv.writer(csvfile) 
        # Write the header row 
        csvwriter.writerow(["News", "# Articles", "Mean Tone", "Standard Deviation in Tone"])
        # Write data rows
        csvwriter.writerow(["Chinese Sources", resultsDict["Chinese_numArticles"], resultsDict["Chinese_avgTone"], resultsDict["Chinese_stDev"]])
        csvwriter.writerow(["Western Sources", resultsDict["Western_numArticles"], resultsDict["Western_avgTone"], resultsDict["Western_stDev"]])
        csvwriter.writerow(["Local Sources", resultsDict["Local_numArticles"], resultsDict["Local_avgTone"], resultsDict["Local_stDev"]])
        




if __name__== "__main__":
    main()