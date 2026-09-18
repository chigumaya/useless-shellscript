#!/bin/bash
a="hoge"
if [[ $1 -eq 1 ]]; then
    b="fuga"
else
    b="piyo"
fi
echo "a=$a, b=$b"
