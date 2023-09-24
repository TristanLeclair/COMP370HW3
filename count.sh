#!/bin/bash

count=$(csvtool col 3 clean_dialog.csv | grep -o "^$1$" | wc -l)

total_count=$(wc -l clean_dialog.csv | awk '{ print $1 }')

percent=$(echo "scale=2 ; ($count * 100) / $total_count" | bc)

echo $1, $count, $percent,
