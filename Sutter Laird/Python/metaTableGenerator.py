import csv
from countryCodeConversion import countryCodeConversion


sourceTypes = ["Chinese", "Western", "Local"]
confidenceLevels = [0, 30, 50, 70, 100]
sutterCountries = ["Botswana", "Burundi", "Chad", "Comoros", "Djibouti", "Eritrea", "Eswatini", "Ethiopia", "Kenya", "Lesotho", "Madagascar", "Malawi", "Mauritius", "Mozambique", "Rwanda", "Seychelles", "Somalia", "South Africa", "South Sudan", "Sudan", "United Republic of Tanzania", "Uganda", "Zimbabwe", "Zambia"]
maximillianCountries = ["Angola", "Benin", "Burkina Faso", "Cameroon", "Central African Republic", "Democratic Republic of the Congo", "Republic of the Congo", "Gabon", "Gambia", "Ghana", "Guinea-Bissau", "Liberia", "Mali", "Mauritania", "Namibia", "Nigeria", "Senegal", "Sierra Leone", "Togo", "Myanmar", "Thailand", "Laos", "Cambodia", "Viet Nam", "Philippines", "Malaysia", "Brunei", "Indonesia", "Papua New Guinea", "Timor-Leste"]
diegoCountries = ["Kazakhstan", "Kyrgyzstan", "Tajikistan", "Turkmenistan", "Uzbekistan", "Afghanistan", "Pakistan", "India", "Bangladesh", "Iran", "Azerbaijan", "Equatorial Guinea", "Georgia", "Armenia", "Mongolia", "Nepal", "Niger", "Bhutan", "Maldives", "Sri Lanka", "Ivory Coast"]
countryRows = list()


with open("masterTable.csv", 'w') as csvfile:
    csvwriter = csv.writer(csvfile)
    csvwriter.writerow(["Country Name", "ISO Code", "Confidence Level", "Press Type", "Mean", "Standard Deviation", "Number of Articles"])



    # Loop through Sutter's countries, reading CSV files
    for sutterCountry in sutterCountries:
        # Create new country dict for list
        newCountry = dict()
        countryRows.append(newCountry)
        newCountry["Name"] = sutterCountry

        countryCode = countryCodeConversion().nameToCode(sutterCountry)
        newCountry["Code"] = countryCode

        for confLevel in confidenceLevels:
            try:
                with open("../Country Tables/" + sutterCountry + "/" + sutterCountry + "_table_conf" + str(confLevel) + ".csv") as countryCSV:
                    csvreader = csv.reader(countryCSV)

                    for row in csvreader:
                        if row[0] != "News":
                            # Split first cell of each row on space (each row has the form "<source type> Sources")
                            mediaTypeSplit = row[0].split(" ")
                            if confLevel == 0 and row[2] != "":
                                newCountry[mediaTypeSplit[0]] = float(row[2])
                            else:
                                newCountry[mediaTypeSplit[0]] = 0

                            csvwriter.writerow([sutterCountry, countryCode, str(confLevel), mediaTypeSplit[0], row[2], row[3], row[1]])
            except Exception as e:
                print(e)
                print("File " + "../Country Tables/" + sutterCountry + "/" + sutterCountry + "_table_conf" + str(confLevel) + ".csv Not Found")



    # Loop through Maximillian's countries, reading CSV files
    for maximillianCountry in maximillianCountries:
        # Create new country dict for list
        newCountry = dict()
        countryRows.append(newCountry)
        newCountry["Name"] = maximillianCountry

        countryCode = countryCodeConversion().nameToCode(maximillianCountry)
        newCountry["Code"] = countryCode

        for confLevel in confidenceLevels:
            try:
                with open("../../Maximillian Renga/Query Results/" + maximillianCountry + "/" + maximillianCountry.replace(" ", "_") + "_table_conf" + str(confLevel) + ".csv") as countryCSV:
                    csvreader = csv.reader(countryCSV)
                    for row in csvreader:
                        if row[0] != "News":
                            # Split first cell of each row on space (each row has the form "<source type> Sources")
                            mediaTypeSplit = row[0].split(" ")
                            if confLevel == 0:
                                newCountry[mediaTypeSplit[0]] = float(row[2])

                            csvwriter.writerow([maximillianCountry, countryCode, str(confLevel), mediaTypeSplit[0], row[2], row[3], row[1]])
            except:
                print("File " + "../../Maximillian Renga/Query Results/" + maximillianCountry + "/" + maximillianCountry.replace(" ", "_") + "_table_conf" + str(confLevel) + ".csv Not Found")




    # Loop through Diego's countries, reading CSV files
    for diegoCountry in diegoCountries:
        # Create new country dict for list
        newCountry = dict()
        countryRows.append(newCountry)
        newCountry["Name"] = diegoCountry

        countryCode = countryCodeConversion().nameToCode(diegoCountry)
        shortCountryCode = countryCodeConversion().fipsNameToCode(diegoCountry)

        newCountry["Code"] = countryCode

        for confLevel in confidenceLevels:
            try:
                with open("../../Diego Garcia/CountriesTone/" + diegoCountry.replace(" ", "") + "ConfidenceLevel" + "/" + shortCountryCode + str(confLevel) + "Confidence.csv") as countryCSV:
                    csvreader = csv.reader(countryCSV)
                    for row in csvreader:
                        if row[0] != "News":
                            # Split first cell of each row on space (each row has the form "<source type> Sources")
                            mediaTypeSplit = row[0].split(" ")
                            if confLevel == 0 and row[2] != "":
                                newCountry[mediaTypeSplit[0]] = float(row[2])
                            else:
                                newCountry[mediaTypeSplit[0]] = 0
                            csvwriter.writerow([diegoCountry, countryCode, str(confLevel), mediaTypeSplit[0], row[2], row[3], row[1]])
            except:
                print("File " + "../../Diego Garcia/CountriesTone/" + diegoCountry.replace(" ", "") + "ConfidenceLevel" + "/" + shortCountryCode + str(confLevel) + "Confidence.csv" + " Not Found")





# Generate table for map
with open("countries_conf0.csv", 'w') as mapfile:
    mapwriter = csv.writer(mapfile)
    mapwriter.writerow(["Country", "Code", "Chinese Tone", "Local Tone", "Western Tone", "Chinese-Western", "Chinese-Local", "Western-Local", "Ratio"])
    
    for country in countryRows:
        if len(country) == 5:
            # print(country)
            if (country["Western"]-country["Local"]) != 0:
                ratio = abs((country["Chinese"]-country["Local"])/(country["Western"]-country["Local"]))
            else:
                ratio = 0
            mapwriter.writerow([country["Name"], country["Code"], country["Chinese"], country["Local"], country["Western"], country["Chinese"]-country["Western"], country["Chinese"]-country["Local"], country["Western"]-country["Local"], ratio])