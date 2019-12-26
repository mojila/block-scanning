#!/bin/sh

TARGET=$1
PORT=$2
MODE=$3

echo "Scanning dari ${TARGET} pada port ${PORT} dengan mode ${MODE}" | mail -s "Pemberitahuan Aktivitas Scanning Mencurigakan" ajilaksono@it.student.pens.ac.id
sh /etc/portsentry/script/send_block.sh