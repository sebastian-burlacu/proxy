cat > /etc/apt/sources.list.d/pve-enterprise.list << EOF
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
deb http://security.debian.org/debian-security bookworm-security main contrib
EOF
apt install vim jq git -y
apt update -y
apt upgrade -y
apt autoremove -y
