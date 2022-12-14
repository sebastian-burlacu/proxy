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
	qm create $1 --memory $4 --net0 virtio,bridge=vmbr0 --sockets 1 --cores $3 --name $2
	qm importdisk $1 /mnt/pve/cephfs/template/iso/focal-server-cloudimg-amd64.img pool
	qm set $1 --scsihw virtio-scsi-pci --scsi0 pool:vm-$1-disk-0
	qm set $1 --ide2 local-lvm:cloudinit
	qm set $1 --boot c --bootdisk scsi0
	qm set $1 --serial0 socket --vga serial0
#	qm set $1 --sshkey <(head -1 ~/.ssh/authorized_keys)
#	qm set $1 --ipconfig0 ip=192.168.122.$1/24,gw=192.168.122.1 --nameserver 192.168.122.104 --searchdomain "example.com"
	mac=$(qm config $1 | grep ^net0 | cut -d'=' -f2 | cut -d',' -f1)
	mac=${mac,,}
	qm set $1 --agent enabled=1
	qm resize $1 scsi0 ${5}G
	cp baseusr.yaml /mnt/pve/cephfs/snippets/usr$1.yaml
	cp basenetv2.yaml /mnt/pve/cephfs/snippets/net$1.yaml
	sed -i "s/VMNAME/$2/g" /mnt/pve/cephfs/snippets/usr$1.yaml
	sed -i "s/VMID/$1/g" /mnt/pve/cephfs/snippets/net$1.yaml
	sed -i "s/VMMAC/$mac/g" /mnt/pve/cephfs/snippets/net$1.yaml
	qm set $1 --cicustom "user=cephfs:snippets/usr$1.yaml,network=cephfs:snippets/net$1.yaml"
	qm start $1
	qm set $1 --cicustom ""
	mv /mnt/pve/cephfs/snippets/usr$1.yaml /mnt/pve/cephfs/snippets/net$1.yaml oldfiles/
fi
