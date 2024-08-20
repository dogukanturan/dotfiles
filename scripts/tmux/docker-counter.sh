#!/bin/bash

zeroText="container:0"
containerCount=$(docker ps -q | wc -l | tr -d [:blank:])

function checkWsl() {
  if $(docker ps -q | grep -q "WSL"); then
    echo $zeroText
    exit
  fi
}

function main() {
  checkWsl
  if [ $containerCount -gt 0 ]; then
      echo "container:$containerCount"
      exit
  else
      echo $zeroText
      exit
  fi
}

main
