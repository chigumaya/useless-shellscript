echo '<svg xmlns="http://www.w3.org/2000/svg" width="250" height="250">'
for i in 0 1 2 3 4 5; do
  for j in 0 1 2 3 4 5; do
    echo "<path d=\"M $((j*40+10)) $((i*40+10)) h30 v30 h-30 v-30\" fill=\"black\"/>"
  done
done
echo '</svg>'
