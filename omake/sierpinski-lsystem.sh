p=F-G-G
eval 'p=$(sed "s/F/f-g+f+g-f/g;s/G/gg/g;y/fg/FG/"<<<$p);'{,,,,,,}
d=(h4 "l-2 4" "l-2 -4")
path=$(eval $(echo $p | sed 's/[-+]/((&&i));/g;s/[FG]/echo ${d[i%3]};/g'))
cat<<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="532" height="530">
  <path d="M10 520 $path" fill="none" stroke="black"/>
</svg>
_EOF_
