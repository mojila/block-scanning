#!/bin/sh

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install portsentry sed mailutils net-tools postfix -y
sudo sed -i 's/TCP_MODE="tcp"/TCP_MODE="atcp"/g' /etc/default/portsentry
sudo sed -i 's/UDP_MODE="udp"/UDP_MODE="audp"/g' /etc/default/portsentry
sudo sed -i 's/BLOCK_UDP="0"/BLOCK_UDP="1"/g' /etc/portsentry/portsentry.conf
sudo sed -i 's/BLOCK_TCP="0"/BLOCK_TCP="1"/g' /etc/portsentry/portsentry.conf
sudo sed -i 's/#KILL_RUN_CMD_FIRST = "0"/KILL_RUN_CMD_FIRST = "1"/g' /etc/portsentry/portsentry.conf
chmod +x mailer.sh
chmod +x send_block.sh
sudo cp -R mailer.sh /etc/portsentry/script/mailer.sh
sudo cp -R send_block.sh /etc/portsentry/script/send_block.sh
sudo sed -i 's|#KILL_RUN_CMD="/some/path/here/script $TARGET$ $PORT$"|KILL_RUN_CMD="/etc/portsentry/script/mailer.sh $TARGET$ $PORT$ $MODE$"|g' /etc/portsentry/portsentry.conf
sudo sed -i 's/SCAN_TRIGGER="0"/SCAN_TRIGGER="2"/g' /etc/portsentry/portsentry.conf
sudo /etc/init.d/portsentry restart