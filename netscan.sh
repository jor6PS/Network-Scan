#!/bin/bash

if [ $1 ] && [ $2 ]; then

	is_alive_ping()
	{
	  ping -c 1 $1 > /dev/null
	  [ $? -eq 0 ] && echo $i - ACTIVA replace
	  [ $? -eq 1 ] && echo $i - FREE replace
	}

	ips_list=$(for i in $1.{1..254};
	do
		is_alive_ping $i & disown;
	done;)

	free_ips=$(echo $ips_list | sed s/"replace"/\\n/g | grep "FREE" | awk -F '-' '{print $1}' | sort)

	for i in $free_ips; do
		sudo ip link set eth0 down
		sleep 1;
		sudo ifconfig eth0 $i netmask 255.255.255.0 up;
		sleep 1;
		#sudo route add default gw 192.168.1.1

		ping -c 1 $2 > /dev/null 2>&1
		sleep 1;
		[ $? -eq 0 ] && echo $i - tiene acceso a al host $2;
	done; wait
else
	echo -e "\n[*] ./netscan.sh <3 primeros brupos de la ip_addr X.X.X> <ip_objetivo>\n"
	exit 1
fi
