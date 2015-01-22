# $1 = nr
# $2 = frequency
# $3 = c2
# $4 = branch
# $5 = # of runs


echo "$1" > parameters
echo "$2" >> parameters
echo "$3" >> parameters
for i in `seq 1 $5`;
do
  ./v1 | tee output.txt
done    
math -script extract-global-data.m | tee math-output.txt
mkdir -p m=$1/c2=$3/$4/w=$2/
mv *txt m=$1/c2=$3/$4/w=$2/
cp *dat m=$1/c2=$3/$4/w=$2/

# useful stuff for later
# folders = (*/)
# last_folder = $folders(*/)[-1]
