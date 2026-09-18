_(){
  : ${__:=@}
  path ${#__}                           # 出力を関数呼び出しに変更
  ___=$@$__
  __=$@
  ____=.$____
  [ $____ = .......... ] || _ $___
}

# 関数定義
path(){
    r=$(($1*5))
    dx=(0 $r 0 -$r)
    dy=($r 0 -$r 0)
    sq="$sq l${dx[i%4]} ${dy[i%4]} l${dx[(i+1)%4]} ${dy[(i+1)%4]} l${dx[(i+2)%4]} ${dy[(i+2)%4]} m${dx[i%4]} ${dy[i%4]}"
    arc="$arc a$r $r 0 0 0 $((dx[i%4]+dx[(i+1)%4])) $((dy[i%4]+dy[(i+1)%4]))"
    i=$((++i))
}

# フィボナッチ数計算
_ :

# SVG出力
cat<<_EOF_
<svg xmlns="http://www.w3.org/2000/svg" width="455" height="295">
  <path d="M130 80 l-5 0 $sq" fill="none" stroke="gray"/>
  <path d="M125 80 $arc" fill="none" stroke="black" stroke-width="2"/>
</svg>
_EOF_
