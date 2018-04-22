#!/bin/bash

[[ -f /etc/nassync.conf ]] && . /etc/nassync.conf || exit 1

echo "$(date): Start sync"
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude=".[!.]*" --exclude "desktop.ini" -s $LOCAL_ROOT/Pictures/ $REMOTE_ROOT/Pictures
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude=".[!.]*" --exclude "desktop.ini" -s $LOCAL_ROOT/Music/ $REMOTE_ROOT/Music
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude=".[!.]*" --exclude "desktop.ini" -s $LOCAL_ROOT/Videos/ $REMOTE_ROOT/Videos
rsync -r -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude=".[!.]*" --exclude "desktop.ini" --exclude "Default.rdp" -s $LOCAL_ROOT/Documents/ $REMOTE_ROOT/Documents
rsync -d -t -p -o -g -v --progress --delete -u --modify-window=1 --exclude=".[!.]*" --exclude "desktop.ini" -s $LOCAL_ROOT/Downloads/ $REMOTE_ROOT/Downloads
echo "$(date): End sync"
