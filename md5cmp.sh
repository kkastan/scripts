#!/bin/sh

if [ "$#" -ne 2 ]; then
  echo "Usage: md5cmp <checksum> <file>"
  exit -1
fi

wd=`pwd`
filename="$wd/$2"
cs=`md5 $filename | awk '{ print $ 4}'`

if [ $1 == $cs ]; then
  echo "$1 has been verified as the correct md5 checksum for $2"
  exit 0
else
  echo "Incorrect md5 checksum!"
  exit -1
fi
