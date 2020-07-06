BEGIN	{ FS = OFS = "\t"; o = 0 }
	{ a+=$3 }
	{ if ($3 <= a/100)
	      o += $3
       	  else 
	      print $1, $2, $3
	}
END	{ print $1, "Other", o }
