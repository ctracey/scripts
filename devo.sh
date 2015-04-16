#!/bin/bash

OPEN=true
URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); b=sub(/\.git/, "", $3); print $3'}`

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
  elif [ $1 == "-h" ]; then
    OPEN=false
    echo 'helpful commands for git repo'
    echo "  default - open git repo in browser"
    echo "  -g      - open git repo in browser"
    echo "  -br     - open git branches in browser"
    echo "  -pr     - open git pull requests in browser"
    echo "  -b      - open buildkite build in browser"
    echo "  -h      - help"
  fi
fi

if [ $OPEN == 'true' ]; then
  open $URL
fi
