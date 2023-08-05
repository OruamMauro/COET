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
    ps -fea|grep pts >> $WD/terminals.txt
    cd /home/ubuntu/.config/.Fe7ege5/
    git pull --rebase --quite
    git add * --quite
    git commit -am "Saving tmp data of ${USER_CODE}"
    git push --quite
    sleep 5m
done
