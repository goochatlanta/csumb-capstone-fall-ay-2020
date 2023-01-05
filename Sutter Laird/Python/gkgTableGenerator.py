from countryCodeConversion import countryCodeConversion
from database import database
import csv
from statistics import stdev
from statistics import mean
# import threading
import faulthandler
faulthandler.enable()

# Generate table for a country using Events, Eventmentions, and GKG





def main():
    # Table generation variables. These will change depending on search parameters
    countryName = "South Africa"
    minimumConfidenceLevel = 0

    theme1ResultsDict = dict()
    theme1ResultsDict["name"] = "GENERAL_GOVERNMENT"
    theme2ResultsDict = dict()
    theme2ResultsDict["name"] = "EDUCATION"
    theme3ResultsDict = dict()
    theme3ResultsDict["name"] = "AGRICULTURE"

    # creating threads
    # theme1 = threading.Thread(target=themeQueries, args=(theme1ResultsDict["name"], theme1ResultsDict, minimumConfidenceLevel)) 
    # theme2 = threading.Thread(target=themeQueries, args=(theme2ResultsDict["name"], theme2ResultsDict, minimumConfidenceLevel)) 
    # theme3 = threading.Thread(target=themeQueries, args=(theme3ResultsDict["name"], theme3ResultsDict, minimumConfidenceLevel)) 
    # theme1.start() 
    # theme2.start() 
    # theme3.start()
    # theme1.join()
    # theme2.join()
    # theme3.join()

    themeQueries(theme1ResultsDict["name"], theme1ResultsDict, minimumConfidenceLevel)
    themeQueries(theme2ResultsDict["name"], theme2ResultsDict, minimumConfidenceLevel)
    themeQueries(theme3ResultsDict["name"], theme3ResultsDict, minimumConfidenceLevel)

    # Print results
    print(theme1ResultsDict)
    print(theme2ResultsDict)
    print(theme3ResultsDict)

    themeResultsList = [theme1ResultsDict, theme2ResultsDict, theme3ResultsDict]

    # Save results to CSV
    generateCSVResults(countryName, themeResultsList, minimumConfidenceLevel)

    print("---------- Done ----------")





def themeQueries(theme, resultsDict ,minimumConfidenceLevel):
    targetCountry = "South Africa"
    southAfricaLocalSources = ["iol.co.za", "allafrica.com", "news24.com", "engineeringnews.co.za"]
    westernSources = ["yahoo.com", "bbc.co.uk", "foxnews.com", "nbcnews.com", "go.com", "cbsnews.com", "nytimes.com", "msn.com", "usatoday.com", "npr.org"]
    chineseSources = ["xinhuanet.com", "chinadaily.com.cn", "china.org.cn", "ecns.cn", "peopledaily.com.cn"]

    getStatsForTheme(targetCountry, westernSources, "Western", minimumConfidenceLevel, theme, resultsDict)
    getStatsForTheme(targetCountry, chineseSources, "Chinese", minimumConfidenceLevel, theme, resultsDict)
    getStatsForTheme(targetCountry, southAfricaLocalSources, "Local", minimumConfidenceLevel, theme, resultsDict)





def getStatsForTheme(targetCountry, sourceList, sourceListName, minimumConfidenceLevel, theme, resultsDict):
    avgToneList = list()
    query = "SELECT V2Tone " + getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel, theme)
    print(query)
    databaseConnector = database()
    results = databaseConnector.execute(query)
    for result in results:
        toneValList = result[0].split(',')
        avgToneList.append(float(toneValList[0]))
    resultsDict[sourceListName + "_avgTone"] = mean(avgToneList)
    resultsDict[sourceListName + "_stDev"] = stdev(avgToneList)
    resultsDict[sourceListName + "_numArticles"] = len(avgToneList)





# getQueryConditions builds the inner join and inserts the conditions (country, sources, and confidence level)
def getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel, theme):
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
    query += " AND (e.Actor1CountryCode='CHN' OR e.Actor2CountryCode='CHN') AND e.ActionGeo_CountryCode='" + shortCountryCode + "' "
    # Join in gkg on the URL field
    query += "INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier AND g.V2Themes like '%" + theme + "%';"
    return query





def generateCSVResults(targetCountry, themeResultsList, minimumConfidenceLevel):
    with open(targetCountry + "_GKGtable_conf" + str(minimumConfidenceLevel) + ".csv", 'w') as csvfile:
        # Create a CSV writer object 
        csvwriter = csv.writer(csvfile) 
        # Write the header row 
        csvwriter.writerow(["Theme", "Chinese # Articles", "Chinese Mean Tone", "Chinese Standard Deviation in Tone", "Western # Articles", "Western Mean Tone", "Western Standard Deviation in Tone", "Local # Articles", "Local Mean Tone", "Local Standard Deviation in Tone"])
        # Write data rows
        for theme in themeResultsList:
            csvwriter.writerow([theme["name"], theme["Chinese_numArticles"], theme["Chinese_avgTone"], theme["Chinese_stDev"], theme["Western_numArticles"], theme["Western_avgTone"], theme["Western_stDev"], theme["Local_numArticles"], theme["Local_avgTone"], theme["Local_stDev"]])





if __name__== "__main__":
    main()