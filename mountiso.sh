#!/bin/sh

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

[[ "$1" = "" ]] && kdialog --error "No ISO file specified." && exit 1

LASTPATH=""
if [[ -f ~/.kisomount-last ]]; then
	LASTPATH=$(<~/.kisomount-last)
fi

LASTPATH="$(kdialog --inputbox "Mount point" "$LASTPATH")"

# User hit cancel
[[ "$1" = "" ]] && exit 1

if [[ ! -d "$LASTPATH" ]]; then
	kdialog --error "There is no directory named '$LASTPATH'."
	exit 1
fi

./umountiso.sh "$LASTPATH"

fuseiso "$1" "$LASTPATH" 2> ~/.kisomount-log
(($? != 0)) && kdialog -error "There was an error mounting." && exit 1

echo "$LASTPATH" > ~/.kisomount-last
rm -f ~/.kisomount-log
