NOW=$(date +%F_%T)
LOGFILE="output-$NOW.log"
mkdir -p ./logs

time vagrant up amazon --provider=aws > logs/$LOGFILE 2>&1 &
