#!/usr/bin/python2.7

import sys

current_country = None
current_confirmed = 0
current_deaths = 0
current_recovered = 0

# Read each key-value pair from stdin and sum up the cases for each country
for line in sys.stdin:
    country, date, value = line.strip().split(',')
    confirmed, deaths, recovered = map(int, value[1:-1].split(','))

    # Check if we are still processing the same country as before
    if country != current_country:
        # If not, print out the total cases for the previous country (if any)
        if current_country is not None:
            print('%s: [%d, %d, %d]' % (current_country,
                  current_confirmed, current_deaths, current_recovered))
        # Reset the counters for the new country
        current_country = country
        current_confirmed = 0
        current_deaths = 0
        current_recovered = 0

    # Add the cases for the current row to the counters for the current country
    current_confirmed += confirmed
    current_deaths += deaths
    current_recovered += recovered

# Print out the total cases for the last country (if any)
if current_country is not None:
    print('%s: [%d, %d, %d]' % (current_country,
          current_confirmed, current_deaths, current_recovered))
