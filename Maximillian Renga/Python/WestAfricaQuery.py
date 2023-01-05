from countryCodeConversion import countryCodeConversion
from database import database
import csv

# Sutter's Initial Query Test
# Region: East Africa

def main():
    # Create database connector using database class
    databaseConnector = database()

    # Converter from conversion class
    converter = countryCodeConversion()

    # Countries to query for
    targetCountries = ["Angola", "Benin", "Burkina Faso", "Cameroon", "Central African Republic", "Congo, the Democratic Republic of the", "Congo", "Equatorial Guinea", "Gabon", "Gambia", "Ghana", "Guinea-Bissau", "Liberia", "Mali", "Mauritania", "Namibia", "Niger", "Nigeria", "Senegal", "Sierra Leone", "Togo"]
    #"Cote d'Ivoire" fails
    # Find counts and avg of numSources using China as Actor1 or Actor2 and target country as ActionGeo
    #getCountAndAvgNumSources(targetCountries, databaseConnector, converter)

    # Compare counts with two techniqes
    #countComparisonByTechniquue(targetCountries, databaseConnector, converter)

    # Get sources for first event in a country
    getSourcesForEvents("Nigeria", databaseConnector, converter)



def getSourcesForEvents(targetCountry, databaseConnector, converter):
    fields = ['Source Name', 'Mention Count']
    with open("sourceCountsWestAfrica.csv", 'w') as csvfile:
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

    with open("countWestAfricas.csv", 'w') as csvfile:
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


def countComparisonByTechniquue(targetCountries, databaseConnector, converter):
    fields = ['Country Name', 'FIPS-10 Code', 'Event Count Actor=China and Action=Target', 'Event Count Actor1=China Actor2=Target OR Actor1=Target Actor2=China']

    with open("countsCompareWestAfrica.csv", 'w') as csvfile:
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
