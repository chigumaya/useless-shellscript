p=A
eval 'p=$(sed "s/A/b-a-b/g;s/B/A+B+A/g;y/ab/AB/"<<<$p);'{,,,,,,,}
d=(h2 "l1 -2" "l-1 -2" h-2 "l-1 2" "l1 2")
path=$(eval $(echo $p | sed 's/[-+]/((&&i));/g;s/[AB]/echo ${d[i%6]};/g'))
cat<<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="532" height="530">
  <path d="M10 520 $path" fill="none" stroke="black"/>
</svg>
_EOF_
