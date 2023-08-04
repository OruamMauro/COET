#!/bin/bash
DATE=$(date +%F)

mkdir -p /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}
cp /tmp/asciinema/rec.cast /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}
echo "$(date)" >> /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}/terminals.txt
ps -fea|grep pts >> /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/${DATE}/terminals.txt
cd /home/ubuntu/.config/.Fe7ege5/
git pull --rebase
git add *
git commit -am "Saving tmp data of ${USER_CODE}"
git push
exit 0
