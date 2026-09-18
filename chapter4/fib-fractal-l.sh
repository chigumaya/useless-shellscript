L=(v-1 h1 v1 h-1)
p=A
for j in {1..21}; do
  p=$(echo $p | sed 's/A/ab/g; s/B/a/g; y/ab/AB/')
done
A(){ echo ${L[i%4]}; ((i+=++n%2?1:-1));}
B(){ echo ${L[i%4]}; ((++n));}
path=$(eval "$(echo $p | fold -1)")

cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="600" height="430">
  <path d="M10 420 $path" fill="none" stroke="black"/>
</svg>
_EOF_
