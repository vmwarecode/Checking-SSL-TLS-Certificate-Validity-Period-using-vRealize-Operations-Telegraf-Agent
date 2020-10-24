#!/bin/bash

now_date=$(date)
cert_date=$(echo | openssl s_client -servername $1 -connect $1:$2 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d= -f2)

cert_date_epoch=$(date -d "$cert_date" "+%s")
now_date_epoch=$(date -d "$now_date" "+%s")

echo $(( ($cert_date_epoch - $now_date_epoch) / 86400 ))
