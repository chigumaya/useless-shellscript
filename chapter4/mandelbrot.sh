X=$1; : ${X:=-0.5}
Y=$2; : ${Y:=0}
K=$3; : ${K:=1}
D=$4; : ${D:=16}
W=$5; : ${W:=384}
k=$((W*K/3))
sx=$(echo "(($X)*$k*2-$W+1)/2" | bc)
sy=$(echo "(($Y)*$k*2-$W+1)/2" | bc)

echo P2 $W $W $D
for cy in $(seq $sy $((sy+W-1))); do
  for cx in $(seq $sx $((sx+W-1))); do
    x=$cx
    y=$cy
    d=$D
    while [ $d -gt 0 ]; do
      p=$((x*x-y*y+cx*k))
      q=$((2*x*y+cy*k))
      x=$((p/k))
      y=$((q/k))
      if [ $((p*p+q*q-4*k*k*k*k)) -le  0 ]; then
        d=$((d-1))
      else
        break
      fi
    done
    echo $d
  done
done
