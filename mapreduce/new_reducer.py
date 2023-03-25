#!/usr/bin/python3.6

import sys

current_country = None
current_totals = [0, 0, 0]

for line in sys.stdin:
    line = line.strip()
    country, counts_str = line.split(";")
    counts = [int(x) for x in counts_str[1:-1].split(",")]

    if current_country == country:
        current_totals = [sum(x) for x in zip(current_totals, counts)]
    else:
        if current_country:
            death_percentage = current_totals[1] / current_totals[0] * 100
            recovery_percentage = current_totals[2] / current_totals[0] * 100
            print(f"{current_country}: {{\"Cases\": {current_totals[0]}, \"Deaths\": {current_totals[1]}, \"Recoveries\": {current_totals[2]}}, with a death percentage of {death_percentage:.2f}% and a recovery percentage of {recovery_percentage:.2f}%}")
        current_country = country
        current_totals = counts

if current_country:
    death_percentage = current_totals[1] / current_totals[0] * 100
    recovery_percentage = current_totals[2] / current_totals[0] * 100
    print(f"{current_country}: {{\"Cases\": {current_totals[0]}, \"Deaths\": {current_totals[1]}, \"Recoveries\": {current_totals[2]}}, with a death percentage of {death_percentage:.2f}% and a recovery percentage of {recovery_percentage:.2f}%}")