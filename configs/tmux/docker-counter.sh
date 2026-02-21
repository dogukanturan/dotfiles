#!/bin/bash

zeroText="container:0"
containerCount=$(docker ps -q 2>/dev/null | wc -l | tr -d '[:blank:]')

if [ "${containerCount:-0}" -gt 0 ] 2>/dev/null; then
  echo "container:$containerCount"
else
  echo "$zeroText"
fi
