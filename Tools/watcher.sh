#!/bin/bash

while true
do
  for i in {1..30} 
  do
    while read x
    do
      echo -e "\e[31mYou are only allowed to use ONE terminal \"Tab1\"\nClose this terminal by executing\e[0m \e[33mexit\e[0m \e[31mcommand\e[0m\n\r" > $x
      sleep 1
    done < <(ls -1 /dev/pts/[2-9])
  done
  sleep 30
done