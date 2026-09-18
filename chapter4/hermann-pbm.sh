echo P1 250 250
for i in {0..249}; do
  l=""
  for j in {0..249}; do
    l="$l $(((i/10%4&&j/10%4)?1:0))"
  done
  echo $l
done
