#!/usr/bin/env bash

mkdir -p /var/log/backup

rsync -av ~thomas.litton/ --exclude-from=~thomas.litton/backup-exclusions.txt /mnt/backup/home > /var/log/backup/thomaslitton.log
rsync -av /etc/ /mnt/backup/etc > /var/log/backup/etc.log