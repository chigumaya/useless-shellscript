. lsystem.function
x=65; y=385
X(){ :;}
F(){
  # c(): cos, s(): sin, "scale=0;a/1": 小数点以下切り捨て
  dx=$(echo "a=5*c($i*25*3.1416/180); scale=0; a/1" | bc -l)
  dy=$(echo "a=5*s($i*25*3.1416/180); scale=0; a/1" | bc -l)
  xx=$x; yy=$y
  x=$((x+dx))
  y=$((y-dy))
  echo M$xx $yy L$x $y
}
i=3
path=$(eval "$(lsystem 5 X F:FF "X:F+[[X]-X]-F[-FX]+X")")

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="345" height="395">
  <path d="$path" fill="none" stroke="black" />
</svg>
_EOF_
