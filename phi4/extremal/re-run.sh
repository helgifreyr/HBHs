# for dir in m=1.0/c2=100.0/*/*/*; do
for dir in "$@"; do
  echo $dir
  cp extract-data-extremal-phi4.m $dir/
  cd $dir
  rm tmp.txt
  math -script extract-data-extremal-phi4.m > math-output.txt
  cd ../../../../../
done
