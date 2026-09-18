p='<N>++<N>++<N>++<N>++<N>'
for i in 1 2 3 4 5 6; do
    p=$(echo $p | sed '
        s/M/oA++pA----nA<-oA----mA>++/g
        s/N/+oA--pA<---mA--nA>+/g
        s/O/-mA++nA<+++oA++pA>-/g
        s/P/--oA++++mA<+pA++++nA>--nA/g
        s/A/\n/g
        y/mnop/MNOP/')
done
path=$(echo "$p" | sed 's/[-+]/((i&&));/g
    s/[MNOP]/echo M$x $y L$[x+=X[i%10]] $[y+=Y[i%10]];/g
    s/</S[++s]=\"x=$x;y=$y;i=$i\";/g
    s/>/eval ${S[s--]};/g
    1i\
        x=0; y=0; X=(59 95 95 59 0 -59 -95 -95 -59 0); Y=(81 31 -31 -81 -100 -81 -31 31 81 100)' |\
    bash | sort -u)
cat <<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4000 4000" width="100%" height="100%">
  <path stroke="black" d="$path" transform="translate(2000,2000)"/>
</svg>
_EOF_
