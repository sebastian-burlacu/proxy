;
; BIND data file for local loopback interface
;
$TTL	604800
example.com.	IN	SOA	dns01.example.com. root.example.com. (
			      8		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	dns01.example.com.
dns01		IN	A	192.168.122.103

prox1		IN	A	192.168.122.155
prox2		IN	A	192.168.122.55
prox3		IN	A	192.168.122.93
vm101		IN	A	192.168.122.101
ansible01	IN	A	192.168.122.102
pihole		IN	A	192.168.122.104
ldap1		IN	A	192.168.122.105
gitea		IN	A	192.168.122.106
gitlab		IN	A	192.168.122.107
