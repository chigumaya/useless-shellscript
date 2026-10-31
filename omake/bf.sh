#!/bin/bash

# 再帰限界の突破
# https://qiita.com/akinomyoga/items/2dd3f341cf15dd9c330b
readonly while='__depth=0,__break=0,__loop,__break'
readonly __loop='__depth++,__break||(__break=!cond)||((body),__depth<64&&(__loop,__loop)),__depth--'

# 文字→文字コード変換用テーブル
ch=({0..255})
# Brainfuckの各命令に対応する算術式
incptr='skip || p++'
decptr='skip || p--'
inc='skip || b[p]++'
dec='skip || b[p]--'
putchar='skip || x[$(dc -e${b[p]}P >&3)]'
getchar='skip || (b[p]=ch[$(dd bs=1 count=1 2>/dev/null | od -An -d)])'
begin='skip ? ++depth : (b[p] ? jump[j++]=i-1 : (++depth, skip=1))'
end='depth ? (--depth || (skip=0), 0) : (b[p] ? i=jump[--j] : --j, skip=0)'

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
n=${#bf[@]}; cond='i<n'; body='bf[i++]'
((while)) 3>&1
