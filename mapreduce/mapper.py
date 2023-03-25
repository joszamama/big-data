#!/usr/bin/python3.6

import sys
import csv

# Input format: Province/State,Country/Region,Lat,Long,Date,Confirmed,Deaths,Recovered,Active,WHO Region                                                                                                                                                                                    
# Output format: key-value pairs where the key is the country/region and the date, and the value is an array containing the confirmed cases, deaths, and recovered cases                                                                                                                    

# Parse each line of the CSV file and emit key-value pairs
reader = csv.reader(sys.stdin)
next(reader) # Skip header row
for row in reader:
        country_region = row[1]
        confirmed = int(row[5])
        deaths = int(row[6])
        recovered = int(row[7])
        value = [confirmed, deaths, recovered]
        print('%s;%s' % (country_region, value))