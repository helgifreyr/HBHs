# $1 = nr
# $2 = frequency
# $3 = rh
# $4 = # of runs
# testing git


echo "$1" > parameters
echo "$2" >> parameters
echo "$3" >> parameters
for i in `seq 1 $4`;
do
  ./BHs | tee output.txt
done    
math -script extract-data.m
mkdir -p m=$1/w=$2/rh=$3
mv *txt m=$1/w=$2/rh=$3
cp *dat m=$1/w=$2/rh=$3
