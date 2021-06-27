#!/bin/bash

#variable declarations to identify html tags for sed to remove
pre="<tr><td>"
post="<\/td><\/tr>"
mid="<\/td><td>"

echo "Attacks    Instances" #to display column headers

#attacks.html file output to grep which removes most of the hypertext markups before passing to sed to remove data markups, 
#and finally to awk which grabs the types of attacks and adds the number of attacks to be displayed. 
cat attacks.html | grep "<td>" | sed -e "s/^$pre//g; s/$post//g; s/$mid/ /g" | awk '{ tot=($2+$3+$4); printf "%-10s %.0f\n", $1, tot }'

exit 0