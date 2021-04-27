wordfreq
========

description
-----------
This is a collection of scripts that take word frequency lists and make inputs
for pie charts and area charts in Excel.

`gethtml.sh` takes a user-made list of urls generated from a frequency list
called `url` and makes a list called `html` of html entities corresponding to
the etymologies of each item in `url`.

`getdata.sh` takes `html` and outputs tab separated variable files to make pie
charts and area charts in Excel. These files have the names `data$suf.tsv`
which has categories for all languages, 
`other$suf.tsv` where less common languages are lumped into an 'other' 
catagory, and `area.tsv` which is the input for an area chart. `$suf` is a
number that corresponds to the number of values used in that file. (i.e. 
`data1000.tsv` uses the 1000 most common words from the initial list)


bugs
----
if a word is not in etymonline.com, then it is ignored.

compound words are also ignored.

non-lemmas are ignored, e.g. plurals

the structure of the data files is ugly.

the names of the `.sh` and `.awk` files are ugly
