#!/bin/bash

# 文字→文字コード変換用テーブル
ch=({0..255})
# Brainfuckの各命令に対応する算術式
incptr='skip || p++, bf[++i]'
decptr='skip || p--, bf[++i]'
inc='skip || b[p]++, bf[++i]'
dec='skip || b[p]--, bf[++i]'
putchar='skip || x[$(dc -e${b[p]}P >&3)], bf[++i]'
getchar='skip || (b[p]=ch[$(dd bs=1 count=1 2>/dev/null | od -An -d)]), bf[++i]'
begin='skip ? ++depth : (b[p] ? jump[j++]=i : (++depth, skip=1)), bf[++i]'
end='depth ? (--depth || (skip=0), ++i) : ((b[p] ? i=jump[--j] : (--j, ++i)), skip=0), bf[i]'

# Brainfuckのコードを読み込んで配列に格納
bf=(
    $(tr -dc '<>[],.+-' < "$1" |\
      sed 's/</decptr /g
           s/>/incptr /g
           s/\+/inc /g
           s/-/dec /g
           s/\./putchar /g
           s/,/getchar /g
           s/\[/begin /g
           s/]/end /g')
)
# コード実行
i=0; p=0; b=(); jump=(); j=0; skip=0; depth=0
((bf[0])) 3>&1
