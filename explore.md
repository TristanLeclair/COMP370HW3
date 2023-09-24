# Exploring the MLP dialog dataset

- there are 36859 lines in the file
    - `wc -l clean_dialog.csv`
- 4 columns
    - title, the title of the episode
    - writer, the writer of the episode
    - pony, the pony currently speaking
    - dialog, the lines spoken by the pony
    - `head clean_dialog.csv`
- 198 episodes total
    - `csvtool col 1 clean_dialog.csv | uniq | wc -l`
- The names of the ponies speaking aren't always described the same way: P1 *and* P2, All but P1, P1 as P2, Rest of main cast and P1, Rest of main cast *sans* Twilight

# Speaker frequency

## count.sh:
```bash
#!/bin/bash

count=$(csvtool col 3 clean_dialog.csv | grep -o "^$1$" | wc -l)

total_count=$(wc -l clean_dialog.csv | awk '{ print $1 }')

percent=$(echo "scale=2 ; ($count * 100) / $total_count" | bc)

echo $1, $count, $percent,
```

## createcsv.sh
```bash
#!/bin/bash
output_file=Line_percentages.csv
rm $output_file

echo "pony_name, total_line_count, percent_all_lines," >> $output_file

xargs -l ./count.sh < args.txt >> $output_file
```

## args.txt

"Twilight Sparkle"
"Pinkie Pie"
"Rainbow Dash"
"Fluttershy"
"Rarity"
"Applejack"
