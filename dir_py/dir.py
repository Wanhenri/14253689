#!/usr/bin/python

import os
from datetime import timedelta, date
def daterange(start_date, end_date):
    for n in range(int ((end_date - start_date).days)):
	yield start_date + timedelta(n)

start_year   =	int(raw_input("Ano inicial?"))
start_month =	int(raw_input("Mes inicial? "))
start_day   =	int(raw_input("Dia inicial? "))
end_year    =	int(raw_input("Ano final? "))
end_month   =	int(raw_input("Mes final? "))
end_day     =	int(raw_input("Dia final? "))

print "Path is created"

start_date = date(start_year, start_month, start_day)
end_date   = date(end_year  , end_month  , end_day)

for single_date in daterange(start_date, end_date):
    print single_date.strftime("%Y-%m-%d")
    path = single_date.strftime("%Y%m%d12")
    os.mkdir( path, 0755 );
 
