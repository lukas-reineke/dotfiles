#!/bin/bash
set -euo pipefail

BACKUP_REPO="/home/lukas/dev/arch-backups"
RCLONE_REMOTE="protondrive:arch-backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

borg create --stats --progress --compression lz4 \
    "$BACKUP_REPO::system-$TIMESTAMP" \
    / \
    --exclude /dev --exclude /proc --exclude /sys \
    --exclude /tmp --exclude /run --exclude /mnt \
    --exclude /media --exclude /swapfile \
    --exclude /home/lukas/dev/arch-backups

borg prune -v "$BACKUP_REPO" --list \
    --keep-daily=7 --keep-weekly=4 --keep-monthly=4

rclone sync "$BACKUP_REPO" "$RCLONE_REMOTE" --progress
