L=("2 0" "1 -2" "-1 -2" "-2 0" "-1 2" "1 2")
p=F--F--F
eval 'p=$(echo $p | sed "s/F/F+F--F+F/g");'{,,,,}
path=$(eval $(echo $p | sed 's/F/echo l${L[i%6]};/g; s/[-+]/((&&i));/g'))

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="505" height="668">
  <path d="M10 172 $path" fill="none" stroke="black" />
</svg>
_EOF_
