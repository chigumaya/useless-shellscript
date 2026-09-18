. lsystem.function
L=("2 2" "2 -2" "-2 -2" "-2 2")
F(){ echo l${L[i%4]};}
X(){ echo l${L[i%4]};}
Y(){ echo l${L[i%4]};}
path=$(eval "$(lsystem 12 FX X:X+YF+ Y:-FX-Y F:F)")

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="610" height="445">
  <path d="M0 0 $path" fill="none" stroke="black" transform="translate(435,350)"/>
  <path d="M0 0 $path" fill="none" stroke="gray" transform="rotate(180) translate(-179,-94)"/>
</svg>
_EOF_
