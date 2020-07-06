BEGIN	{ FS = OFS = "\t"
	  getline <"template.tsv"
	  print "", $0
	  split($0,l)
	}
	{ lang[$2, $1] = $3 }
END	{ for (j = 100; j <= 10000; j+=100) {
		printf("%d\t", j)
		for (i in l)
			printf("%s\t", lang[l[i],j])
		printf("\n")
	  }
	}
