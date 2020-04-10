#!/bin/bash

count=0

while [ "$count" -lt 1000000 ]
do
  case $((RANDOM % 3)) in
        (0) status=OK
                ;;
        (1) status=TEMP
                ;;
        (2) status=PERM
                ;;
  esac

  part=$(
    printf '%s|%s|%d|%s|%s' \
        "$(date '+%Y%m%d%H%M%S')" \
        $(printf '%02d:%02d:%02d' $((RANDOM % 3 + 9)) $((RANDOM % 60)) $((RANDOM % 60)) ) \
        $((RANDOM % 2000 + 3000)) \
        "$status"
    )
  printf "$part"'|\n'
  echo "$part"'|' >> logs/DATA_$(date '+%Y%m%d%H%M').txt
  count=$((count + 1))
  sleep 0.01;
done
