#!/bin/bash

if [ ! -d "lib" ]; then
	mkdir lib
fi
if [ ! -d "data" ]; then
	mkdir data
fi

split lib/url
rm -f lib/html

for suf in {a..t}
do
	xargs wget -O - < lib/urla$suf | 
	grep -o '<div class="main.*<div class="related' > lib/html$suf
	cat lib/html$suf >> lib/html
done

