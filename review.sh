#!/bin/bash
for (( a=1; a <=$1; a++ ))
do tick quick review $a of $1
done
