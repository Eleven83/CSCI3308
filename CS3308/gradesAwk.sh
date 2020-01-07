#Ryan Hoffman
#CSCI 3308 Summer 2019, CU Boulder
#!/bin/bash

#If less than x arguments supplied, display usage 
if [[  $# -eq 0 ]] 
    then 
	    echo -e "\nUsage: gradesAwk.sh <filename>\n"
		exit 1
fi 

#Read and parse the file by column and sort all in ONE LINE!
awk 'BEGIN { RS = "\n" }; {avg=int(($4+$5+$6)/3); print avg" ""["$1"]"" "$3"',' "$2}' $1 | sort -r -n