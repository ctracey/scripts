#!/bin/bash
URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); b=sub(/\.git/, "", $3); print $3'}`

if [ $1 ]; then
  if [ $1 == "-b" ]; then
    URL=$URL/branches
  elif [ $1 == "-p" ]; then
    URL=$URL/pulls
  fi
fi

open $URL
