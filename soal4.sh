#!/bin/bash

lower=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
rotat=`date '+%H'`
jam=`date +%H`
jam=$(($jam-0))
menit=`date +%M`
menit=$(($menit-0))
tanggal=`date +%d`
bulan=`date +%m`
tahun=`date +%Y`


file="$jam:$menit $tanggal-$bulan-$tahun"

cat /var/log/syslog | tr "${lower:0:26}" "${lower:${rotat}:26}" | tr "${upper:0:26}" "${upper:${rotat}:26}" > "$file.txt"
