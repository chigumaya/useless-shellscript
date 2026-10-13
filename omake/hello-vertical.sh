H(){
expr "$1" : '\(.\)'; }
l(){ exec 2>/dev/null; }
l
o(){ printf %s $(H "$1" "
,")
 }
while
o $line
read -r \
line; do IFS=
done < $0
! ねこ大好き
