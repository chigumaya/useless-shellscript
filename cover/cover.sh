#!/bin/bash
# 表紙作成スクリプト
title1="役に立たない"
title2="シェルスクリプト読本"
author="やまぐちたかのり"

# 寸法 (カラー印刷用350dpi = 350pixel/25.4mm)
W=4269          # 全幅 (塗り足し含む; 309.8mm)
H=2978          # 全高 (塗り足し含む; 216mm)
wp=2039         # ページ幅 (塗り足しなし片面; 148mm)
hp=2894         # ページ高 (塗り足しなし; 210mm)
wb=107          # 背幅 (7.8mm)
wr=$(((W-wp*2-wb)/2))   # 塗り足し幅 (3mm)
x1=$((wr+wp+wb))        # 表1左端

# ペンローズタイル
p='<N>++<N>++<N>++<N>++<N>'
for i in 1 2 3 4 5 6; do
    p=$(echo $p | sed '
        s/M/oA++pA----nA<-oA----mA>++/g
        s/N/+oA--pA<---mA--nA>+/g
        s/O/-mA++nA<+++oA++pA>-/g
        s/P/--oA++++mA<+pA++++nA>--nA/g
        s/A/\n/g
        y/mnop/MNOP/')
done
path=$(echo "$p" | sed 's/[-+]/((i&&));/g
    s/[MNOP]/echo M$x $y L$[x+=X[i%10]] $[y+=Y[i%10]];/g
    s/</S[++s]=\"x=$x;y=$y;i=$i\";/g
    s/>/eval ${S[s--]};/g
    1i\
        x=0; y=0; X=(59 95 95 59 0 -59 -95 -95 -59 0); Y=(81 31 -31 -81 -100 -81 -31 31 81 100)' |\
    bash | sort -u)

# このスクリプト自身; &#x200B = zero-width SP
src="$(sed "s/&/\&amp;/g; s/</\&lt;/g; s/>/\&gt;/g; s/^$/ /;s/ /\&#x200B; /g
    s%$title1%<tspan class=\"b1\">&</tspan>%;
    s%$title2%<tspan class=\"b1\">&</tspan>%;
    s%$author%<tspan class=\"b1\">&</tspan>%;
    s%.*%    <tspan x=\"$((wr+110))\" dy=\"1.2em\">&</tspan>%;
    3,5s/1.2em/2.5em/" < $0)"

# SVG出力
cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg"
     viewBox="0 0 $W $H" width="100%" height="100%">
  <style>
    .c1 { font: bold 200pt "Noto Sans JP", "Noto Sans CJK JP"; fill: black; }
    .c2 { font: bold 120pt "Noto Sans JP", "Noto Sans CJK JP"; fill: white; }
    .b1 { font: bold 40pt "Noto Sans JP", "Noto Sans CJK JP"; fill: #080; stroke: #060; }
    .b2 { font: bold 45pt "Noto Sans JP", "Noto Sans CJK JP"; fill: black; }
  </style>
  <defs>
    <linearGradient id="bg" gradientTransform="rotate(90)">
      <stop offset="5%" stop-color="#1b4d3e"/>
      <stop offset="95%" stop-color="#98fb98"/>
    </linearGradient>
  </defs>
  <rect x="0" y="0" width="100%" height="100%" fill="white"/>
  <rect x="0" y="$((wr+1400))" width="100%" height="1550" fill="url('#bg')"/>
  <path stroke="#f30" stroke-width="3" d="$path" transform="translate($((wr+2690)),$((wr+3328)))"/>
  <text x="$((x1+220))" y="$((wr+1360))" class="c1">$title1</text>
  <text x="$((x1+220))" y="$((wr+1560))" class="c2">$title2</text>
  <text x="$((x1+1435))" y="$((wr+2760))" class="b2">$author</text>
  <text x="$((wp+wr+wb/2))" y="$((wr+190))" writing-mode="vertical-rl">
    <tspan class="b1">$title1</tspan>
    <tspan class="b2">$title2</tspan>
    <tspan class="b2" y="$((H-wr-600))">$author</tspan>
  </text>
  <rect x="$((wr+90))" y="$((wr+90))" width="1420" height="2020" fill="#ffffe0" fill-opacity="0.9" rx="20"/>
  <text y="$((wr+90))" style="font: 16pt Nimbus Mono PS, monospace; fill: gray;">
$src
  </text>
</svg>
_EOF_
