#!/bin/bash
# Capstone: backup the current directory with tar + gzip, timestamped.
# Combines: set -e, variables, $(date), functions, if checks, conditionals.

set -e

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

prepare_backup_dir() {
    if [[ ! -d $BACKUP_DIR ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backup folder bana diya: $BACKUP_DIR"
    fi
}

take_backup() {
    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
    echo "Backup ban gaya: $ARCHIVE"
    echo "Size: $(du -h "$ARCHIVE" | awk '{print $1}')"
}

cleanup_old_backups() {
    # rakho sirf last 7 backups, baaki delete
    cd "$BACKUP_DIR"
    ls -1t backup_*.tar.gz 2>/dev/null | tail -n +8 | xargs -r rm -f
}

prepare_backup_dir
take_backup
cleanup_old_backups

echo "Done. Saare backups:"
ls -lh "$BACKUP_DIR"/backup_*.tar.gz
