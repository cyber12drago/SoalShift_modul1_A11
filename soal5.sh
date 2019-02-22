#!/bin/bash
cat /var/log/syslog | awk '(!/sudo/ || /cron/ && /CRON/) && (NF<13){print}' >> /home/diondevara/modul1/soal_5.log

