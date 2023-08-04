#!/bin/bash
DATE=$(date +%F_%H-%M)
NAME=$(cat /tmp/.USER_NAME | tr "[:blank:]" "_")

mkdir -p /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/$(echo -n $NAME)_${DATE}
cp /tmp/asciinema/rec.cast /home/ubuntu/.config/.Fe7ege5/Recordings/tmp/$(echo -n $NAME)_${DATE}
cd /home/ubuntu/.config/.Fe7ege5/
git pull --rebase
git add *
git commit -am "Saving tmp data of ${USER_CODE}"
git push
exit 0
