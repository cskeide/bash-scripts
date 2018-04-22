#!/bin/bash

[[ -f /etc/nassync.conf ]] && . /etc/nassync.conf || exit 1

echo "$(date): Start sync"
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude "desktop.ini" -s $REMOTE_ROOT/Pictures/ $LOCAL_ROOT/Pictures
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude "desktop.ini" -s $REMOTE_ROOT/Music/ $LOCAL_ROOT/Music
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude "desktop.ini" -s $REMOTE_ROOT/Videos/ $LOCAL_ROOT/Videos
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude "desktop.ini" --exclude "Default.rdp" -s $REMOTE_ROOT/Documents/ $LOCAL_ROOT/Documents
rsync -d -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude "desktop.ini" -s $REMOTE_ROOT/Downloads/ $LOCAL_ROOT/Downloads
echo "$(date): End sync"
