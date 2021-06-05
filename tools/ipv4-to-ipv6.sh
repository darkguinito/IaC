#!/bin/bash -e

IP=$1
ping -c 1 "$IP" >/dev/null 2>/dev/null
MAC=$(arp -an "$IP" | awk '{ print $4 }')
IFACE=$(arp -an "$IP" | awk '{ print $7 }')

python3 -c "
from netaddr import IPAddress
from netaddr.eui import EUI
mac = EUI(\"$MAC\")
ip = mac.ipv6(IPAddress('fe80::'))
print('{ip}%{iface}'.format(ip=ip, iface=\"$IFACE\"))"
