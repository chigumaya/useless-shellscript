cat cover.sh | sed '
s/\$0/cover.sh/
/<\/svg>/i\
<!-- debug -->\
  <rect x="$wr" y="$wr" width="$wp" height="$hp" stroke="red" fill="none"/>\
  <rect x="$((wr+wp+wb))" y="$wr" width="$wp" height="$hp" stroke="red" fill="none"/>\
  <path d="M$((x1+wp/8)) 0 v$H \
	M$((x1+wp*2/8)) 0 v$H \
	M$((x1+wp*3/8)) 0 v$H \
	M$((x1+wp*4/8)) 0 v$H \
	M$((x1+wp*5/8)) 0 v$H \
	M$((x1+wp*6/8)) 0 v$H \
	M$((x1+wp*7/8)) 0 v$H \
	M$x1 $((wr+hp/4)) h$wp \
	M$x1 $((wr+hp*2/4)) h$wp \
	M$x1 $((wr+hp*3/4)) h$wp" \
	stroke="purple" fill="none" \
/>\
<!-- debug -->
' | bash
