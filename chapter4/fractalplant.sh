. lsystem.function
L=(0 -1 -2 -3 -4 -3 -2 -1 0 1 2 3 4 3 2 1)
x=130; y=605
X(){ :;}
F(){
  echo M$x $y L$((x+=L[i%16])) $((y+=L[(i+4)%16]))
}
i=0
path=$(eval "$(lsystem 6 X F:FF 'X:F+[[X]-X]-F[-FX]+X')")

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="365" height="615">
  <path d="$path" fill="none" stroke="black" />
</svg>
_EOF_
