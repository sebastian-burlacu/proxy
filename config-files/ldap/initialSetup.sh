#!/bin/sh

DEBIAN_FRONTEND=noninteractive apt install -y slapd ldap-utils libnss-ldap libpam-ldap
systemctl stop slapd
mv /var/lib/ldap/data.mdb /var/lib/ldap/data.mdb.old
slapadd -l initialSetup.ldif
chown openldap. /var/lib/ldap/data.mdb
systemctl start slapd
ldapadd -Q -Y EXTERNAL -H ldapi:/// -f configRootAccount.ldif
