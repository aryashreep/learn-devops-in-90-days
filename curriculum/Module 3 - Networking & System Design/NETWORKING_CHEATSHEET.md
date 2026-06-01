# 🛠️ Networking Command Cheat Sheet for DevOps

A comprehensive guide to networking commands every DevOps engineer should know.

---

## 🏗️ Networking Basics
| Command | Description |
|---------|-------------|
| `ifconfig` | Show or configure network interfaces (classic) |
| `ifconfig eth0 up` | Activate `eth0` network interface |
| `ip addr` | Show or change IP addresses (modern) |
| `ip addr show` | Show network interfaces and associated IP addresses |
| `ip addr add 192.168.1.1/24 dev eth0` | Add IP address with subnet mask to network interface |
| `ip link` | Show or configure network interfaces |
| `ip link show` | Show network interface information |
| `ip link set eth0 down` | Deactivate `eth0` network interface |
| `ip route` | Show or change routing table |
| `ip route show` | Show current routing table |
| `ip route add default via <192.168.1.1>` | Add default gateway |

## 🛰️ Advanced Networking
| Command | Description |
|---------|-------------|
| `route` | Show or configure routing table |
| `route -n` | Show routing table (numeric addresses) |
| `route flush` | Removes all routes |
| `arp` | Show or change ARP cache |
| `arp -a` | Prints ARP table |
| `arp -d <IP>` | Remove an IP from the ARP cache |
| `iwconfig` | Manage wireless network interfaces |
| `curl -O <link>` | Download file from the internet |
| `wget <link>` | Download file and save in current directory |

## 📊 Network Monitoring
| Command | Description |
|---------|-------------|
| `netstat` | Network statistics |
| `netstat -tuln` | Show active network sockets (listening) |
| `ss` | Socket statistics (faster alternative to netstat) |
| `ss -tuln` | Show active network sockets |
| `iftop` | Real-time bandwidth usage |
| `tcpdump` | Network packet analyzer (deep inspection) |
| `tcpdump -i eth0` | Show network traffic on `eth0` |
| `nc` / `netcat` | Read and write data across network connections |
| `hping` | Analyze and exchange TCP/IP packets |
| `speedometer` | Displays bandwidth usage in real-time |
| `vnstat` | Logs and shows time-based network traffic stats |
| `socat` | Transfers data between two bidirectional byte streams |

## 🔍 DNS & Host Resolution
| Command | Description |
|---------|-------------|
| `dig <example.com>` | Perform detailed DNS lookup |
| `nslookup <domain>` | Query DNS servers |
| `host <domain>` | Perform simple DNS lookup |
| `hostname` | Display current system hostname |
| `ping <host>` | Send ICMP echo requests to check reachability |
| `traceroute <host>` | Trace the full path to destination |
| `mtr <host>` | Combines ping and traceroute functionalities |
| `whois <domain>` | Lookup ownership information for IP or domain |

## 🔒 Security & Connectivity
| Command | Description |
|---------|-------------|
| `ssh <user@host>` | Securely connect to a remote system |
| `scp <file> <user@host:/path>` | Copy files securely between hosts |
| `iptables` | Firewall utility for packet filtering and NAT |
| `ufw` | Uncomplicated Firewall (Ubuntu standard) |
| `ufw status` | Check firewall status |
| `telnet <host> <port>` | Test if a specific port is open and accepting connections |

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 2: The Networking Foundation*
