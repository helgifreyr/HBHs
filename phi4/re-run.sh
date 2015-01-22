for dir in m=1.0/c2=100.0/*/*/*; do
  echo $dir
  cp extract-data-phi4.m $dir/
  cd $dir
  rm tmp.txt
  math -script extract-data-phi4.m
  cd ~/skoli/pt/projects/HBHs/phi4
done
