output=sierpinski.png
# __=1
: /dev/fd/0
s=$_
: /${s:1+1:1}??
tr=${_:1+1:1}
: /${s:1+1+1:1}??
tr+=${_:1+1+1:1}
cell=(1)
size=$[1<<10-1]
s=$($tr \!-@ @-_<<<1)
s+="1 $size $size"
main='((i=1,
${loop=cell[i]^=cell[i-1],
++i<size&&loop}))
s+="
${cell[@]}"
((++j<size))&&$tr . .<<<"$main">>$0||
$($tr \ -/:-@ \`-\{<<<"#/.@%<>") - $output<<<"$s"'
$tr . .<<< "$main">>$0
