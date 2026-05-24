# 🧪 Day 07 Solution: Networking Fundamentals

**Jagu:** "Shabash Golu! Tune server ki identity aur packet ka rasta (Routing) dono samajh liya hai. Ye raha tera 'Proof of Work' networking report!"

---

## 🛠️ Step-by-Step Command History

### 1. Identity Check
```bash
# Golu checked his IDs
$ ip addr show eth0 | grep inet
    inet 172.31.16.45/20  # This is Private!

$ curl ifconfig.me
    103.21.144.12         # This is Public!
```

### 2. Connectivity Test (`ping`)
```bash
$ ping -c 5 google.com
    5 packets transmitted, 5 received, 0% packet loss, time 4005ms
    rtt min/avg/max/mdev = 28.125/30.450/32.112/1.450 ms
```

### 3. Route Tracing (`traceroute`)
```bash
$ traceroute google.com
    1  gateway (172.31.16.1)  0.512 ms
    ...
    12 google.com (142.250.190.46)  30.122 ms
    # "Total 12 stations (Hops) cross kiye!" — Golu
```

### 4. Port Listening Check
```bash
$ ss -tuln
    Netid  State      Recv-Q Send-Q  Local Address:Port
    tcp    LISTEN     0      128     0.0.0.0:22       # SSH is listening!
```

---

## 🔍 Network Observations

| Tool | Result | Meaning |
| :--- | :--- | :--- |
| **Ping** | 0% Loss | Connection is healthy. |
| **Traceroute** | 12 Hops | The packet took 12 jumps to reach Google. |
| **Curl -I** | Server: GitHub.com | The destination is identifying itself correctly. |

---

## 💡 Jagu's Pro Tip:
"Golu, agar website nahi khul rahi, toh pehle `ping` karo (Layer 3 connectivity), phir `telnet/nc` karo (Layer 4 port check). Rasta clear hona zaroori hai!"

---
*#LearnDevOpsIn90Days • Day 07 • Golu & Jagu Edition*
