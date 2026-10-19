#!/bin/bash
# Strict nftables firewall for Arch Linux

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

cat > /etc/nftables.conf << 'EOF'
#!/usr/bin/nft -f
flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0; policy drop;
        iif lo accept
        ct state established,related accept
        ct state invalid drop
        ip protocol icmp accept
        ip6 nexthdr icmpv6 accept
        tcp dport { 22 } accept   # SSH - change if needed
    }
    chain forward {
        type filter hook forward priority 0; policy drop;
    }
    chain output {
        type filter hook output priority 0; policy accept;
    }
}
EOF

nft -f /etc/nftables.conf
systemctl enable --now nftables
echo "[+] Strict nftables firewall applied"
