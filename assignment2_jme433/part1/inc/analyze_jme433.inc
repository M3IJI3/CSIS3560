# analyze_jme433.inc

# Log file being analyzed
LOG_FILE_NAME="data/squidaccess.log"

# Number of records

RECORDS_NUM=`cat data/squidaccess.log | wc -l`

# Number of unique IP address

UNIQ_IP_ADDR_NUM=`cat data/squidaccess.log | awk -F ' ' '{print $3}' | sort | uniq | wc -l`

# Response code sent by the server

RESPONSE_CODE=`cat data/squidaccess.log | awk -F ' ' '{print $4}' | awk -F '/' '{print $2}' | sort | uniq | tr '\n' ' '`

# Request times sort by file types

APP=`cat data/squidaccess.log | awk -F ' ' '{print $10}' | awk -F '/' '{print $1}' | grep application | wc -l`
IMG=`cat data/squidaccess.log | awk -F ' ' '{print $10}' | awk -F '/' '{print $1}' | grep image | wc -l`
TEXT=`cat data/squidaccess.log | awk -F ' ' '{print $10}' | awk -F '/' '{print $1}' | grep text | wc -l`
VIDEO=`cat data/squidaccess.log | awk -F ' ' '{print $10}' | awk -F '/' '{print $1}' | grep video | wc -l`


# Display the informarion 

echo "Log file being analyzed: $LOG_FILE_NAME"
echo "Number of records: $RECORDS_NUM"
echo "Number of uniq IP address: $UNIQ_IP_ADDR_NUM"
echo "The response code are: $RESPONSE_CODE"
echo "The file type requested:"
echo "    File type application $APP times"
echo "    File type image times $IMG times"
echo "    File type text $TEXT times"
echo "    File type video $VIDEO times"
