#!/bin/bash

for i in *.jpg
do
	base64 -d $i | xxd -r > /home/gipen/Documents/icang/jadi/$i
done
