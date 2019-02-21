#!/bin/bash

y=0
while [ $y -lt 3 ]
do
 let y=0
    passrandom=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)

    if [[ "$passrandom" =~ [a-z] ]];
	then let y=$y+1;
    fi

    if [[ "$passrandom" =~ [A-Z] ]];
	then let y=$y+1;
    fi
    if [[ "$passrandom" =~ [0-9] ]];
	then let y=$y+1;
    fi

done
    echo "$passrandom"

    x=1
    z=1
    file=/home/cyber12drago/Documents/password
    while [ -s "$file$x.txt" ]
    do
          value=$(<$file$x.txt)
   		if test "$value" = "$passrandom"
		then let z=0;break;
		fi

	  let x=$x+1
    done
   
    if [ $z -eq 0 ]
    then echo "Coba lagi";
    else
	echo "$passrandom" > $file$x.txt  
    fi
