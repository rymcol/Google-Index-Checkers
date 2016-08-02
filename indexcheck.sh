#!/bin/bash

while read line; do
sleep $[ ( $RANDOM % 10 )  + 6 ]s
res=$(curl --user-agent Safari/601.7.7 https://www.google.com/search?q=site:{$line} 2>&1 | grep -ohE "[0-9]+ result")
if [[ $res = *[!\ ]* ]]; then
  echo "$line\tINDEXED"
  echo "$line,INDEXED" >> indexChecked.csv
else
  echo "$line\tNOT INDEXED"
  echo "$line,NOT INDEXED" >> indexChecked.csv
fi
done <domains.txt
