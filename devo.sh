#!/bin/bash

if [ $1 ]; then
  if [ $1 == "-g" ]; then
    URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); b=sub(/\.git/, "", $3); print $3'}`
  elif [ $1 == "-br" ]; then
    URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); b=sub(/\.git/, "", $3); print $3'}`
    URL=$URL/branches
  elif [ $1 == "-pr" ]; then
    URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); b=sub(/\.git/, "", $3); print $3'}`
    URL=$URL/pulls
  elif [ $1 == "-b" ]; then
    URL=`pwd | awk {'a=sub(/^.*99designs\//, "https://buildkite.com/99designs/", $0); b=sub(/_/, "-", $0); print $0'}`
  fi
fi

open $URL
