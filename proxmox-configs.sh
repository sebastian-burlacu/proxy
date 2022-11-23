cat > /etc/apt/sources.list.d/pve-enterprise.list << EOF
deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription
deb http://security.debian.org/debian-security bullseye-security main contrib
EOF
apt install vim jq git -y
apt update -y
apt upgrade -y
apt autoremove -y
