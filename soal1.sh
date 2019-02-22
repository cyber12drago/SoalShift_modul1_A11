#!/bin/bash

for foto in *.jpg
do
        base64 -d $foto | xxd -r > /home/gipen/Documents/Sisop2k19/File1/nature/jadi/$foto
done



