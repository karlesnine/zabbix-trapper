#! /bin/bash

# A single mandatory parameter: the Zabbix Server host
# Send just the first 7 values
FIELDS=(insert query update delete getmore command flushes mapped vsize res faults locked_% idx_miss_%  qr qw ar aw netIn netOut conn time)
SEND_IDX=(0 1 2 3 4 5 6 10 11 12 13 14 15 16 19)
IFS=$' \t\n|'

mongostat -n 1 6 | (
read;
read;
read -a values;
for i in ${SEND_IDX[@]} 
do echo "- mongostat[${FIELDS[i]}] ${values[i]}"
done
)
