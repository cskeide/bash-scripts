#!/bin/bash
# pacbac - Create and restore from list all installed packages

# Package list locations (official and local)
pkglsoff=~/arch-pkglist-official
pkglsloc=~/arch-pkglist-local
aurhelper=aurman

# Use filename as program name
prog=${0##*/}

# If restoring, be sure yaourt is installed
if [[ "$1" == 'r' ]] && [[ -z $(pacman -Qs $aurhelper) ]]; then
    echo ""
    echo -e "$prog requires $aurhelper to be installed."
    echo ""
    exit
fi

case $1 in
  b ) # Create list of official repository packages (core, extra, community)
      echo -e "Creating list of official (core/extra/community packages) packages installed."
      # Create list, remove local, base
      pacman -Qqe | grep -vx "$(pacman -Qqg base)" | grep -vx "$(pacman -Qqm)" > "$pkglsoff"
      # Create list of local packages (includes the AUR)
      echo -e "Creating list of local (includes AUR) packages installed."
      pacman -Qqm > "$pkglsloc"
      echo -e "Official package list saved to $pkglsoff"
      echo -e "Local package list saved to $pkglsloc" ;;
  r ) # Update repository database, then restore packages from list
      echo -e "Installing packages from lists"
      sudo pacman -Sy
      # use -f to overwrite conflicting files
      sudo pacman -S --needed $(cat "$pkglsoff")
      # Yaourt doesn't have --needed check
      $aurhelper -S $(cat "$pkglsloc" | grep -vx "$(pacman -Qqm)") ;;
  * ) echo -e " pacbac b - build installed packages list. (dir:${pkglsoff%/*})"
      echo -e " pacbac r - restore installed packages from package list." ;;
esac
