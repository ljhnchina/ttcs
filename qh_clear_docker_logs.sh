#!/bin/sh

echo "======== start clean docker containers logs ========"

logs=$(find /volume1/@docker/containers/ -name log.db)

for log in $logs

do

    echo "clean logs:" $log
    cat /dev/null>$log

done

echo "======== end clean docker containers logs ========"

ls -lh $(find /volume1/@docker/containers/ -name log.db)
