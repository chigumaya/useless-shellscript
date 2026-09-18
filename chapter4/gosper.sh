. lsystem.function
L=("8 0" "4 -7" "-4 -7" "-8 0" "-4 7" "4 7")
A(){ echo l${L[i%6]};}
B(){ echo l${L[i%6]};}
path=$(eval "$(lsystem 4 A A:A-B--B+A++AA+B- B:+A-BB--B-A++A+B)")

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="470" height="450">
  <path d="M300 10 $path" fill="none" stroke="black" />
</svg>
_EOF_
