#!/bin/bash

rm -f lib/raw
sed 's/from \([[:upper:]]\w\+[ -]\)*[[:upper:]]\w*/\n\0/' lib/html |
	grep -o '^from \([[:upper:]]\w\+[ -]\)*[[:upper:]]\w*' |
	sed 's/from //; s/ /_/g' | grep -v '^\w$' > lib/raw

lens=($(wc -l lib/raw))
len=${lens[0]}+100

rm -f data/*
for (( i=100; i<=$len; i=i+100 )) 
do
	sed "$i q" lib/raw | 
		sed 's/.*\(English\|Germanic\|Kentish\|Umbrian\|Anglian\|PIE\).*/Native/g' |
		sed 's/.*Latin.*/Latin/g' |
		sed 's/Middle_French\|Anglo-French\|Old.*French/Old_French/g' |
		sed 's/Scandi.*/Old_Norse/g' |
		awk 'BEGIN {OFS="\t"} {c[$1]++} END {for(i in c) print NR, i, c[i]}' | 
		sort -t$'\t' -k3 -nr > data/data$i.tsv
	awk -f other.awk data/data$i.tsv > data/other$i.tsv
	cat data/other$i.tsv >> data/other.tsv
done
i=$((i-100))
awk 'BEGIN { ORS = "\t" } { print $2 }' data/other$i.tsv | grep -o "^.*\w" > template.tsv
awk -f area.awk data/other.tsv > data/area.tsv
