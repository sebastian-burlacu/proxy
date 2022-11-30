# proxy
This repo contains various server configs and scripts.

newvm.sh: creating a new VM in proxmox using either a template or from scratch.  
proxmox-configs.sh: first time commands to run on a new system  
baseusr.yaml: cloud-init for user data  
basenet.yaml: cloud-init for network config

## current running services

| vmname | opsys | cores | mem | application | notes |
|---|---|---|---|---|---|
| dns01 | ubuntu 20.04 | 1 | 768M | bind dns server | zone: example.com |
| pihole | ubuntu 20.04 | 1 | 768M | pihole network-wide ad blocking |  |
| gitea | ubuntu 20.04 | 1 | 1G | gitea lightweight git server | works great |
| gitlab | ubuntu 20.04 | 2 | 5G | gitlab fully featured git server | kinda slow |
| ldap1 | ubuntu 20.04 | 2 | 2G | openldap directory server | easy to use but lacking in features |
| ansible01 | ubuntu 20.04 | 2 | 3G | ansible config mgmt |  |
