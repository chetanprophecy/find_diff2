#!/bin/bash
# Sainithin Molugu              01/16/2018              Initial Draft

#Usage
usage()
{
echo "Usage: $0 RUN_ID <INBOUND_PATH> <SERIAL_PENDING_PATH>"
}

RUN_ID=$1
INBOUND_PATH=$2
AI_SERIAL_PENDING=$3

if [ $# -ne 3 ]
then
echo "Invalid number of params."
usage
exit 1
fi

if [ -f  "$AI_SERIAL_PENDING/PDFS.RESP.$RUN_ID.dat" ]
then
rm "$AI_SERIAL_PENDING/PDFS.RESP.$RUN_ID.dat" ;
fi

date=`cut -c 1-8 <<< $RUN_ID`
req_files=`ls "$INBOUND_PATH"|grep -ie "PDFS.RESP|PDFS_RESP" -e "$date"`;
IFS="
"


for i in $req_files
do
echo "File matched: $i"
if ( echo $i | egrep -i 'zip$|gz$' 1>/dev/null)
then
zcat "$INBOUND_PATH/$i"|gawk '{if ($0 ~ /RUN DATE: /) pat1=$3; if ($0 ~ /FILE ID: /) pat2=$3; if ($0 ~ /FILE ID: /) pat3=$4;}{if (pat1 && pat2 && pat3) print pat2,pat1,pat3;pat=pat2=pat3=""}' >> "$AI_SERIAL_PENDING/PDFS.RESP.$RUN_ID.dat" ;
else
cat "$INBOUND_PATH/$i"|gawk '{if ($0 ~ /RUN DATE: /) pat1=$3; if ($0 ~ /FILE ID: /) pat2=$3; if ($0 ~ /FILE ID: /) pat3=$4;}{if (pat1 && pat2 && pat3) print pat2,pat1,pat3;pat=pat2=pat3=""}' >> "$AI_SERIAL_PENDING/PDFS.RESP.$RUN_ID.dat" ;
fi
done
