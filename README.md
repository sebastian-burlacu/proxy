# proxy
This repo contains various server configs and scripts.

newvm.sh: creating a new VM in proxmox using either a template or from scratch.  
newvmwithnet.sh: creating a new VM from iso image with cloud-init network config v2.

proxmox-configs.sh: first time commands to run on a new system  
baseusr.yaml: cloud-init for user data  
basenetv1.yaml: cloud-init for network config v1  
basenetv2.yaml: cloud-init for network config v2

## current running services

| vmname | ID | opsys | cores | mem | application | notes |
|---|---|---|---|---|---|---|
| dns01 | 103 | ubuntu 20.04 | 1 | 768M | bind dns server | zone: example.com |
| pihole | 104 | ubuntu 20.04 | 1 | 768M | pihole network-wide ad blocking |  |
| gitea | 106 | ubuntu 20.04 | 1 | 1G | gitea lightweight git server | works great |
| gitlab | 107 | ubuntu 20.04 | 2 | 5G | gitlab fully featured git server | kinda slow |
| ldap1 | 105 | ubuntu 20.04 | 2 | 2G | openldap directory server | easy to use but lacking in features |
| ansible01 | 102 | ubuntu 20.04 | 2 | 3G | ansible config mgmt |  |
| ldap2 | 108 | ubuntu 20.04 | 1 | 1G | openldap | to test deploying slapd via script |
| haproxy1 | 109 | ubuntu 20.04 | 1 | 768M | haproxy |  |
| haproxy2 | 110 | ubuntu 20.04 | 1 | 768M | haproxy |  |

## client machines

| vmname | ID | opsys | cores | mem | notes |
|---|---|---|---|---|---|
| vm101 | 101 | ubuntu 20.04 | 1 | 2G |  |
| vm111 | 111 | ubuntu 20.04 | 1 | 512M |  |
| vm112 | 112 | ubuntu 20.04 | 1 | 512M |  |
