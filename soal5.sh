#!/bin/bash
cat /var/log/syslog | awk '(/CRON/ || /cron/ && !/sudo/) && (NF<13){print}' >> /home/diondevara/modul1/soal_5.log

