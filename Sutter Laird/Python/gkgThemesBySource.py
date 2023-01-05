from countryCodeConversion import countryCodeConversion
from database import database
import csv

# Determine themes and number of articles per theme for each category of source using GKG





def main():
    # Table generation variables. These will change depending on search parameters
    countryName = "South Africa"
    minimumConfidenceLevel = 30
    localSources = ["iol.co.za", "allafrica.com", "news24.com", "engineeringnews.co.za"]

    # Important "constants"
    westernSources = ["yahoo.com", "bbc.co.uk", "foxnews.com", "nbcnews.com", "go.com", "cbsnews.com", "nytimes.com", "msn.com", "usatoday.com", "npr.org"]
    chineseSources = ["xinhuanet.com", "chinadaily.com.cn", "china.org.cn", "ecns.cn", "peopledaily.com.cn"]

    getThemesBySource(countryName, westernSources, "Western", minimumConfidenceLevel)
    getThemesBySource(countryName, chineseSources, "Chinese", minimumConfidenceLevel)
    getThemesBySource(countryName, localSources, "Local", minimumConfidenceLevel)

    print("---------- Done ----------")





def getThemesBySource(targetCountry, sourceList, sourceListName, minimumConfidenceLevel):
    fields = ['Theme', 'Count']
    themesMap = dict()

    query = "SELECT Themes " + getQueryConditions(targetCountry, sourceList, minimumConfidenceLevel)
    print(query + "\n\n")
    results = database().execute(query)
    # This gets ugly. Here we go.
    # Results is a list of tuples. Each tuple, result, is a row
    for result in results:
        # First value in tuple (index 0) is the first attribute returned. Split it on ; to split the themes
        for theme in result[0].split(';'):
            if theme in themesMap:
                themesMap[theme] += 1 
            else:
                themesMap[theme] = 1

    with open(targetCountry + "_" + sourceListName + "_conf" + str(minimumConfidenceLevel) + "_themes.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        # writing the fields 
        csvwriter.writerow(fields)
        for theme in themesMap:
            csvwriter.writerow([theme, themesMap[theme]])





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
    query += " AND (e.Actor1CountryCode='CHN' OR e.Actor2CountryCode='CHN') AND e.ActionGeo_CountryCode='" + shortCountryCode + "' INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier;"
    return query





if __name__== "__main__":
    main()