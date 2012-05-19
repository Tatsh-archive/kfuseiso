#!/bin/sh

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

[[ "$1" = "" ]] && kdialog --error "No ISO file specified." && exit 1

LASTPATH=""
if [[ -f ~/.kfuseisomount-last ]]; then
	LASTPATH=$(<~/.kfuseisomount-last)
fi

LASTPATH="$(kdialog --inputbox "Mount point" "$LASTPATH")"

# User hit cancel
[[ "$LASTPATH" = "" ]] && exit 1

if [[ ! -d "$LASTPATH" ]]; then
	kdialog --error "There is no directory named '$LASTPATH'."
	exit 1
fi

./umountiso.sh "$LASTPATH"

fuseiso "$1" "$LASTPATH" 2> ~/.kfuseisomount-log
(($? != 0)) && kdialog --error "There was an error mounting." && exit 1

echo "$LASTPATH" > ~/.kfuseisomount-last
rm -f ~/.kfuseisomount-log

#
# Copyright (c) 2012 Andrew Udvare <audvare@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
