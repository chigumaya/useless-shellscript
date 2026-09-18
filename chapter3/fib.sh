p='c=${a=1};echo $c;a=$((a+b));b=$c;n=$((n+1));[ $n -eq 10 ]||echo "$p">>$0'
eval "$p"
