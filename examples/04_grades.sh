#! /bin/bash

awk '{ print $1"="($2+$3+$4)/3 }' 03_grades.csv
