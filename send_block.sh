#!/bin/sh

TARGET=$1
PORT=$2
MODE=$3

#other computers
echo "student" | ssh -tt student@[ip] "sudo /sbin/route add -host $TARGET reject"