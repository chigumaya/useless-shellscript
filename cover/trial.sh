cat cover.sh | sed '
s/\$0/cover.sh/
/<\/svg>/i\
  <style>\
    .t { font: bold 100pt "Noto Sans JP", "Noto Sans CJK JP"; fill: #c00; border: solid; }\
  </style>\
  <text x="$((x1+150))" y="$((wr+1180))" transform="rotate(-15 $((x1+150)) $((wr+1180))" class="t">お試し版</text>
' | bash
