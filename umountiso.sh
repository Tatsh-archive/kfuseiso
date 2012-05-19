#!/bin/sh

[[ "$1" = "" ]] && exit 1
fusermount -u -q -z "$1"
