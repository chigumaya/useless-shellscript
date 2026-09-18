x=(250 0 500); y=(33 466 466)
px=250; py=250
for i in {001..300}; do
  for j in {1..100};do
    r=$[RANDOM%3]
    echo $[px=(px+x[r])/2] $[py=(py+y[r])/2]
  done >> tmpfile.$$
  awk '{t[$1+$2*500]=1} END{print "P1",500,500;for(;i++<500^2;)print t[i]?1:0}' < tmpfile.$$ > s$i.pbm
done
convert -delay 3 -layers optimize s???.pbm sierpinski.gif
rm tmpfile.$$ s???.pbm
