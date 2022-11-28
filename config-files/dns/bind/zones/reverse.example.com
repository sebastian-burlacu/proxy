;
; BIND reverse data file for local loopback interface
;
$TTL	604800
122.168.192.in-addr.arpa.	IN	SOA	dns01.example.com. root.example.com. (
			      7		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	dns01.example.com.

155		IN	PTR	prox1.example.com.
55		IN	PTR	prox2.example.com.
93		IN	PTR	prox3.example.com.
101		IN	PTR	vm101.example.com.
102		IN	PTR	ansible01.example.com.
103		IN	PTR	dns01.example.com.
104		IN	PTR	pihole.example.com.
105		IN	PTR	ldap1.example.com.
106		IN	PTR	gitea.example.com.
107		IN	PTR	gitlab.example.com.
