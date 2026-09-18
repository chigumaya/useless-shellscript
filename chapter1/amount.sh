#!/bin/sh
while IFS=, read item price num; do
    echo "$item,$((price*num))"
done
