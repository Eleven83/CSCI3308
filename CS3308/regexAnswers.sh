#Ryan Hoffman
#CSCI 3308 Summer 2019 CU Boulder
#!/bin/bash

#If less than x arguments supplied, display usage 
if [[  $# -eq 0 ]] 
    then 
	    echo -e "\nUsage: regexAnswers.sh <filename>\n"
		exit 1
fi
grep -E '[A-Za-z][0-9]$' $1 | wc -l
grep -E '[^aeiou]+' $1 | wc -l
grep -E '[A-Za-z]{12,}' $1 | wc -l
grep -E '^[0-9]*$' $1 | wc -l
grep -E '^.*UCDenver.edu.*$' $1 | wc -l
grep '[0-9]\{3\}[ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}' $1 | wc -l
grep '^.*303-*\?[0-9]\{3\}[ -]\?[0-9]\{4\}' $1 | wc -l
echo "0"
echo "0"