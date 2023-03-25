#!/usr/bin/python2.7

import sys

# Input format: key-value pairs where the key is the country/region and date, and the value is an array containing the confirmed cases, deaths, and recovered cases
# Output format: key-value pairs where the key is the country/region and date, and the value is the total number of confirmed cases, deaths, and recovered cases

current_key = None
current_value = [0, 0, 0]

for line in sys.stdin:
    key, value = line.strip().split('\t')
    country_region, date = key.split(',')
    confirmed, deaths, recovered = map(int, value.split(','))
    if key != current_key:
        if current_key:
            print('%s,%s\t%d,%d,%d' % (current_key.split(',')[0], current_key.split(',')[1], current_value[0], current_value[1], current_value[2]))
        current_key = key
        current_value = [0, 0, 0]
    current_value[0] += confirmed
    current_value[1] += deaths
    current_value[2] += recovered

if current_key:
    print('%s,%s\t%d,%d,%d' % (current_key.split(',')[0], current_key.split(',')[1], current_value[0], current_value[1], current_value[2]))