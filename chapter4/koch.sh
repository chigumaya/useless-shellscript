p=F
H=30
echo '<svg xmlns="http://www.w3.org/2000/svg" width="182" height="360">'
for j in 1 2 3 4 5; do
    w=$((3**(5-j)))
    w2=$((w*2))
    L=("$w2 0" "$w -$w2" "-$w -$w2" "-$w2 0" "-$w $w2" "$w $w2")
    i=0
    path=$(eval $(echo $p | sed 's/[-+]/((&&i));/g; s/F/echo l${L[i%6]};/g'))
    echo '<path d="M10' $H $path '" fill="none" stroke="black" />'
    p=$(echo $p | sed "s/F/F+F--F+F/g")
    H=$((H+80))
done
echo '</svg>'
