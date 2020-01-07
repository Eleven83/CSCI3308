#Ryan Hoffman 
#CSCI 3308 Summer 2019, CU Boulder
#!/bin/bash

#If less than x arguments supplied, display usage 
if [[  $# -eq 0 ]] 
    then 
	    echo -e "\nUsage: grades.sh <filename>\n"
		exit 1
fi 
#Read and parse the file by column
grep . "$1" | while read SID FIRST LAST S1 S2 S3
do
    let avg=($S1+$S2+$S3)/3
    printf '%d [%d] %s, %s\n' "$avg" "$SID" "$LAST" "$FIRST" 
done < $1 | sort -r -k1.1 -k3.3 -k4.4 -k2.2
#<(grep "" $1)