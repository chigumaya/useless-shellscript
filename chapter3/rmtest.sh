tmpfile=$(mktemp /tmp/XXXXX)
seq 5 > $tmpfile              # 一時ファイルを作成(各行に1,2,3,4,5)

{ sleep 10; rm $tmpfile;} &   # バックグラウンドで10秒後に一時ファイルを削除

while read i; do              # ループで各行を取得
   sleep 3                    # 3秒スリープ
   echo $i                    # 取得した行を出力
   ls -i $tmpfile             # 一時ファイルに関する情報を表示
done < $tmpfile               # ……という処理を一時ファイルに対して実行
wait                          # バックグラウンド処理の終了を待つ
