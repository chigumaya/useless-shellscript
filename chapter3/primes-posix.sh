q='{ [ ${#i} -le ${#j} ] || expr $i : "\($j\)*$" >/dev/null &&
sed -n 3,7p $0 || { j=.$j; echo "$q";} } >>$0'
[ -n "$i" -a "$i" = "$j" ] && echo ${#i}
expr ${#i} : ... >/dev/null && exit
i=.$i
j=..
eval $q
