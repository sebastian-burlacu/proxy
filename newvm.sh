#!/bin/bash

if [ $# -ne 5 ]; then
	echo "Usage: $0 <vmid> <name> <cores> <mem_mb> <disk_gb>"
	exit 1
else
	exists=$(pvesh get /cluster/resources --type vm --output-format json | jq -r " .[] | select(.id == \"qemu/$1\") | .name")
       	if [ ! -z "$exists" ]; then
		echo please do not reuse a VM ID - this is currently used for $exists
		exit 1
	fi
#	cp basenet.yaml net$1.yaml
	cp baseusr.yaml usr$1.yaml
	sed -i "s/VMNAME/$2/g" usr$1.yaml
#	sed -i "s/VMID/$1/g" net$1.yaml
	qm clone 100 $1 --name $2
#	qm set $1 --sshkey <(head -1 ~/.ssh/authorized_keys)
	qm set $1 --ipconfig0 ip=192.168.122.$1/24,gw=192.168.122.1
	qm set $1 --cicustom "user=cephfs:snippets/usr$1.yaml"
#	,network=snippets:snippets/net$1.yaml"
	qm set $1 --sockets 1 --cores $3 --memory $4 --agent enabled=1
	qm resize $1 scsi0 ${5}G
	qm start $1
	qm set $1 --cicustom ""
	mv usr$1.yaml oldfiles/
fi
