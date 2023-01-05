from countryCodeConversion import countryCodeConversion
from database import database
import csv

# Generate table for a country using Events and Eventmentions


def main():
    # Table generation variables. These will change depending on search parameters
    countryName = "Philippines"
    minimumConfidenceLevel = 30
    localSources = ["philstar.com", "inquirer.net", "mb.com.ph", "abs-cbn.com", "manilatimes.net", "philippenetimes.com", "rappler.com", "sunstar.com.ph", "tribune.net.ph"]

    # Important "constants"
    westernSources = ["yahoo.com", "bbc.co.uk", "foxnews.com", "nbcnews.com", "go.com", "cbsnews.com", "nytimes.com", "msn.com", "usatoday.com", "npr.org"]
    chineseSources = ["xinhuanet.com", "chinadaily.com.cn", "china.org.cn", "ecns.cn", "peopledaily.com.cn"]

    # Results go here
    resultsDict = dict()

    print("SELECT MentionDocTone " + getQueryConditions(countryName, localSources, minimumConfidenceLevel))

    getToneStats(countryName, westernSources, "Western", minimumConfidenceLevel, resultsDict)
    getToneStats(countryName, chineseSources, "Chinese", minimumConfidenceLevel, resultsDict)
    getToneStats(countryName, localSources, "Local", minimumConfidenceLevel, resultsDict)

    # Print results
    print(resultsDict)

    # Save results to CSV
    generateCSVResults(countryName, resultsDict)

    print("---------- Done ----------")





def getToneStats(targetCountry, sourceList, sourceListName, minimumConfidenceLevel, resultsDict):
    query = "SELECT count(*), AVG(MentionDocTone), STDDEV(MentionDocTone) " + getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel)
    results = database().execute(query)
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





def generateCSVResults(targetCountry, resultsDict):
    with open(targetCountry + "_Phillytable30ConfidenceNoGKG.csv", 'w') as csvfile:
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
