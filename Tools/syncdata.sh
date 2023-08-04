#!/bin/bash
DATE=$(date +%F)
WD=/home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}

if [ ! -d "$WD" ]; then
    mkdir -p $WD
fi
if [ -f "/tmp/asciinema/rec.cast" ]; then
    cp /tmp/asciinema/rec.cast $WD
fi
echo "$(date)" >> $WD/terminals.txt
ps -fea|grep pts >> $WD/terminals.txt
cd /home/ubuntu/.config/.Fe7ege5/
git pull --rebase
git add *
git commit -am "Saving tmp data of ${USER_CODE}"
git push
exit 0
