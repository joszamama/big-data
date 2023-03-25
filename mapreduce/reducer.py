#!/usr/bin/python3.6

from operator import add
import sys

current_country = None
current_totals = [0, 0, 0]

for line in sys.stdin:
    line = line.strip()
    country, counts_str = line.split(";")
    counts = [int(x) for x in counts_str[1:-1].split(",")]

    if current_country == country:
        current_totals = map(add, current_totals, counts)
    else:
        if current_country:
            print(current_country + ": " + str(list(current_totals)))
        current_country = country
        current_totals = counts

if current_country:
   print(current_country + ": " + str(list(current_totals)))