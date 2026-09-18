p=A
eval 'p=$(sed "s/A/+bF-aFa-Fb+/g;s/B/-aF+bFb+Fa-/g;y/ab/AB/"<<<$p);'{,,,,,,,}
d=(h3 v3 h-3 v-3)
path=$(eval $(echo $p | sed 's/[-+]/((&&i));/g;s/F/echo ${d[i%4]};/g;s/[AB]//g'))
cat<<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="786" height="786">
  <path d="M10 10 $path" fill="none" stroke="black"/>
</svg>
_EOF_
