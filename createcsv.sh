#!/bin/bash
output_file=Line_percentages.csv
rm $output_file

echo "pony_name, total_line_count, percent_all_lines," >> $output_file

xargs -l ./count.sh < args.txt >> $output_file
