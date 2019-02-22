#!/bin/bash

lower=zyxwvutsrqponmlkjihgfedcbazyxwvutsrqponmlkjihgfedcba
upper=ZYXWVUTSRQPONMLKJIHGFEDCBAZYXWVUTSRQPONMLKJIHGFEDCBA
rotat=`date '+%H'`

read x
cat "$x" | tr "${lower:0:26}" "${lower:${rotat}:26}" | tr "${upper:0:26}" "${upper:${rotat}:26}" > "$x-description.txt"
