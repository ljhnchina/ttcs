#!/bin/sh
Author: Squaregentleman
Modifier: Oreo
Date: Tue Aug 10 08:24:30 UTC 2023
cron: 30 23 * * *
new Env('删除docker log');
echo "======== start clean docker containers logs ========"

logs=$(find /volume1/@docker/containers/ -name log.db)

for log in $logs

do

    echo "clean logs:" $log
    cat /dev/null>$log

done

echo "======== end clean docker containers logs ========"

ls -lh $(find /volume1/@docker/containers/ -name log.db)
