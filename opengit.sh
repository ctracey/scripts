#!/bin/bash
URL=`cat .git/config | grep url | awk {'a=sub(/git@github.com:/, "https://github.com/", $3); print $3'}`
open $URL
