NOW=$(date +%F_%T)
LOGFILE="output-$NOW.log"
mkdir -p ./logs

time vagrant up gce --provider=google > logs/$LOGFILE 2>&1 &
