from countryCodeConversion import countryCodeConversion
from database import database
import csv
import statistics

# Sutter's Initial Query Test
# Region: East Africa

def main():
    # Create database connector using database class
    databaseConnector = database()

    # Converter from conversion class
    converter = countryCodeConversion()

    # Countries to query for
    targetCountries = ["Botswana", "Burundi", "Chad", "Comoros", "Djibouti", "Eritrea", "Eswatini", "Ethiopia", "Kenya", "Lesotho", "Madagascar", "Malawi", "Mauritius", "Mozambique", "Rwanda", "Seychelles", "Somalia", "South Africa", "South Sudan", "Sudan", "United Republic of Tanzania", "Uganda", "Zimbabwe", "Zambia"]
    isolatedTargetCountries = ["South Africa", "Kenya", "Zimbabwe"]
    remainingCountries = ["Chad", "Comoros", "Seychelles", "Lesotho", "Eritrea", "Eswatini"]

    # Find counts and avg of numSources using China as Actor1 or Actor2 and target country as ActionGeo
    # getCountAndAvgNumSources(targetCountries, databaseConnector, converter)

    # Compare counts with two techniques
    # countComparisonByTechnique(targetCountries, databaseConnector, converter)

    # Get sources for events in a country
    getSourcesForEvents(remainingCountries[5], databaseConnector, converter)
    # getSourcesForEvents(isolatedTargetCountries[1], databaseConnector, converter)
    # getSourcesForEvents(isolatedTargetCountries[2], databaseConnector, converter)

    # getThemesForCountry("South Africa", databaseConnector, converter)
    # testingFunction(databaseConnector)


def getV2ThemesForCountry(targetCountry, databaseConnector, converter):
    fields = ['Theme', 'Count']
    themesMap = dict()

    shortCountryCode = converter.fipsNameToCode(targetCountry)
    results = databaseConnector.execute("SELECT V2Themes FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID = m.GLOBALEVENTID AND e.ActionGeo_CountryCode = '" + shortCountryCode + "' AND (e.Actor1CountryCode = 'CHN' OR e.Actor2CountryCode = 'CHN') AND m.Confidence >= 30 INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier;")
    # This gets ugly. Here we go.
    # Results is a list of tuples. Each tuple, result, is a row
    for result in results:
        # First value in tuple (index 0) is the first attribute returned. Split it on ; to split the themes
        for theme in result[0].split(';'):
            # Split each theme on , to remove character offset
            splitTheme = theme.split(',')
            if splitTheme[0] in themesMap:
                themesMap[splitTheme[0]] += 1 
            else:
                themesMap[splitTheme[0]] = 1

    with open(targetCountry + "_V2Themes.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        # writing the fields 
        csvwriter.writerow(fields)
        for theme in themesMap:
            csvwriter.writerow([theme, themesMap[theme]]) 





def getThemesForCountry(targetCountry, databaseConnector, converter):
    fields = ['Theme', 'Count']
    themesMap = dict()

    shortCountryCode = converter.fipsNameToCode(targetCountry)
    results = databaseConnector.execute("SELECT Themes FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID = m.GLOBALEVENTID AND e.ActionGeo_CountryCode = '" + shortCountryCode + "' AND (e.Actor1CountryCode = 'CHN' OR e.Actor2CountryCode = 'CHN') AND m.Confidence >= 30 INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier;")
    # This gets ugly. Here we go.
    # Results is a list of tuples. Each tuple, result, is a row
    for result in results:
        # First value in tuple (index 0) is the first attribute returned. Split it on ; to split the themes
        for theme in result[0].split(';'):
            if theme in themesMap:
                themesMap[theme] += 1 
            else:
                themesMap[theme] = 1

    with open(targetCountry + "_themes.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        # writing the fields 
        csvwriter.writerow(fields)
        for theme in themesMap:
            csvwriter.writerow([theme, themesMap[theme]]) 



def testingFunction(databaseConnector):
    # results = databaseConnector.execute("SELECT count(*) FROM events e INNER JOIN eventmentions m ON e.GLOBALEVENTID = m.GLOBALEVENTID AND e.ActionGeo_CountryCode = 'SF' AND (e.Actor1CountryCode = 'CHN' OR e.Actor2CountryCode = 'CHN') AND m.Confidence >= 30 INNER JOIN gkg g ON m.MentionIdentifier = g.DocumentIdentifier limit 10;")
    # results = databaseConnector.execute("select count(*) from (select * from events limit 10) t;")
    results = databaseConnector.execute("select MentionDocTone from (select * from eventmentions limit 100) t;")
    tonelist = list()
    for row in results:
        tonelist.append(row[0])
    print("standard dev: " + str(statistics.stdev(tonelist)))
    


def getSourcesForEvents(targetCountry, databaseConnector, converter):
    fields = ['Source Name', 'Mention Count']
    with open(targetCountry + "_sourceCounts.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        
        # writing the fields 
        csvwriter.writerow(fields) 

        shortCountryCode = converter.fipsNameToCode(targetCountry)
        results = databaseConnector.execute("SELECT MentionSourceName, count(*) as sourceMentionCount FROM eventmentions WHERE GLOBALEVENTID in (SELECT GLOBALEVENTID FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = '" + shortCountryCode + "') group by MentionSourceName ORDER BY sourceMentionCount DESC;")
        print(results)

        for source in results:
            csvwriter.writerow([source[0], source[1]])



def getCountAndAvgNumSources(targetCountries, databaseConnector, converter):
    fields = ['Country Name', 'FIPS-10 Code', 'Event Count', 'Average NumSources']

    with open("counts.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        
        # writing the fields 
        csvwriter.writerow(fields) 
        
        # Convert countries to codes
        for country in targetCountries:
            countryCode = converter.fipsNameToCode(country)
            result = databaseConnector.execute("SELECT count(*), avg(NumSources) FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = '" + countryCode + "'")
            csvwriter.writerow([country, countryCode, result[0][0], result[0][1]])
            print(country + "(" + countryCode + ")" + ":  " + str(result[0][0]) + " : " + str(result[0][1]))



def countComparisonByTechnique(targetCountries, databaseConnector, converter):
    fields = ['Country Name', 'FIPS-10 Code', 'Event Count Actor=China and Action=Target', 'Event Count Actor1=China Actor2=Target OR Actor1=Target Actor2=China']

    with open("countsCompare.csv", 'w') as csvfile:
        # creating a csv writer object 
        csvwriter = csv.writer(csvfile) 
        
        # writing the fields 
        csvwriter.writerow(fields) 
        
        # Convert countries to codes
        for country in targetCountries:
            countryCode = converter.nameToCode(country)
            shortCountryCode = converter.fipsNameToCode(country)
            result1 = databaseConnector.execute("SELECT count(*) FROM events WHERE (Actor1CountryCode = 'CHN' OR Actor2CountryCode = 'CHN') AND ActionGeo_CountryCode = '" + shortCountryCode + "'")
            result2 = databaseConnector.execute("SELECT count(*) FROM events WHERE (Actor1CountryCode = 'CHN' AND Actor2CountryCode = '" + countryCode + "')")
            result3 = databaseConnector.execute("SELECT count(*) FROM events WHERE (Actor2CountryCode = 'CHN' AND Actor1CountryCode = '" + countryCode + "')")
            csvwriter.writerow([country, countryCode, result1[0][0], result2[0][0]+result3[0][0]])
            print(country + " (" + countryCode + ") " + str(result1[0][0]) + " " + str(result2[0][0] + result3[0][0]) )



if __name__== "__main__":
    main()