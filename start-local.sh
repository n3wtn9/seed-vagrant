NOW=$(date +%F_%T)
LOGFILE="output-$NOW.log"
mkdir -p ./logs

time vagrant up local --provider=virtualbox > logs/$LOGFILE 2>&1 &
