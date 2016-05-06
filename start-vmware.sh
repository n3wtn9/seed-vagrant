NOW=$(date +%F_%T)
LOGFILE="output-$NOW.log"
mkdir -p ./logs

time vagrant up vmware --provider=vmware_fusion > logs/$LOGFILE 2>&1 &
