# Networking Training Comprehensive Transcription

## Multiple Choice Quiz
**Source: extracted_networking/quiz/**

**1. You can successfully ping the server, but the connection to port 80 is refused. Which layer is likely hosting the problem?**
- A) Layer 1 (Physical cable issue)
- B) Layer 3 (IP connectivity issue)
- C) Layer 4 (Port/Application issue)
- D) Layer 2 (Switch issue)
**Ans: B) Layer 3 (IP connectivity issue)** *(Note: The image shows B, but pings (ICMP) being successful suggests Layer 3 is fine, while port 80 refusal typically points to Layer 4 or Layer 7. However, I am transcribing exactly as shown in the image.)*

**2. Which topology is described as having a central switch that manages traffic flow between devices?**
- A) Ring Topology
- B) Bus Topology
- C) Star Topology
- D) Mesh Topology
**Ans: C) Star Topology**

**3. Why should database servers typically be assigned Private IPs?**
- A) Private IPs are faster than Public IPs
- B) To prevent hackers from brute-forcing passwords from the public internet
- C) Databases cannot function on Public IPs
- D) Private IPs are free, while Public IPs always cost money
**Ans: B) To prevent hackers from brute-forcing passwords from the public internet**

**4. In CIDR notation, what does a /32 represent?**
- A) A network with 254 hosts
- B) A network with 65,000 hosts
- C) Just 1 single IP address
- D) The entire internet
**Ans: C) Just 1 single IP address**

**5. What is the standard port for SSH (Secure Shell)?**
- A) 443
- B) 22
- C) 80
- D) 53
**Ans: B) 22**

**6. Which statement about CIDR numbers is true?**
- A) A lower CIDR number (e.g., /8) means more IP’s
- B) A higher CIDR number (e.g., /30) means more IP’s
- C) All CIDR numbers provide the same number of addresses
- D) CIDR numbers only apply to IPv6
**Ans: A) A lower CIDR number (e.g., /8) means more IP’s**

**7. Why are some users still accessing the old website after the DNS 'A' record was updated with the new server IP?**
- A) The old server has not been turned off yet
- B) The new server's firewall is blocking all traffic
- C) Resolvers & local devices have cached old DNS record due to its TTL
- D) The CNAME record was not updated correctly
**Ans: C) Resolvers & local devices have cached old DNS record due to its TTL**

**8. Why is UDP preferred for video streaming or DNS?**
- A) It guarantees every packet arrives in order
- B) It encrypts data better than
- C) It uses a 3-Way Handshake
- D) Speed is more important than perfection; lost packets don't stop the stream
**Ans: D) Speed is more important than perfection; lost packets don't stop the stream**

**9. What is the common DevOps meme regarding troubleshooting network issues?**
- A) It's always the Firewall
- B) It's always DNS
- C) Have you tried restarting?
- D) It's always the Database
**Ans: B) It's always DNS**

**10. What does TTL (Time to Live) control in DNS?**
- A) The speed of the internet connection
- B) How long a device remembers (caches) an address
- C) The number of characters in a domain name
- D) The security level of the domain
**Ans: B) How long a device remembers (caches) an address**

**11. Which command is best suited for querying DNS to find an IP address?**
- A) ping
- B) netstat
- C) nslookup
- D) traceroute
**Ans: C) nslookup**

**12. What is a major security risk when configuring Security Groups?**
- A) Opening "All Traffic" (0.0.0.0/0) to fix a connection issue
- B) Allowing traffic on Port 443
- C) Using specific IPs for SSH access
- D) Creating an Outbound rule
**Ans: A) Opening "All Traffic" (0.0.0.0/0) to fix a connection issue**

**13. What is the difference between a Forward Proxy and a Reverse Proxy?**
- A) Forward Proxy hides the Server; a Reverse Proxy hides Client
- B) Forward Proxy hides Client (VPN); a Reverse Proxy hides Server
- C) They are exactly the same
- D) Reverse Proxy is only used for emails
**Ans: B) Forward Proxy hides Client (VPN); a Reverse Proxy hides Server**

**14. In cloud environment, what is the most accurate description of modern DevOps engineer's responsibility regarding networking?**
- A) Define & manage network components like VPCs, subnets, and firewall rules via code
- B) Physically plug in cables & configure hardware routers in the data center
- C) Focus solely on app code, as networking is automatically handled by cloud platform
- D) Submit tickets to separate Network Team & wait to provision network resource
**Ans: A) Define & manage network components like VPCs, subnets, and firewall rules via code**

**15. Which command shows every "hop" (router) a packet takes to reach a destination?**
- A) ping
- B) curl
- C) ssh
- D) traceroute
**Ans: D) traceroute**

---

## Command Reference / Cheat Sheet
**Source: extracted_networking/cheatsheet/**

### Networking Basics:
| Command | Description |
| :--- | :--- |
| `ifconfig` | Show or configure network interfaces |
| `ifconfig eth0 up` | Activate eth0 network interface |
| `ip addr` | Show or change IP addresses |
| `ip addr show` | Show network interfaces and associated IP addresses |
| `ip addr add 192.168.1.1/24 dev eth0` | Add IP address with subnet mask to network interface |
| `ip link` | Show or configure network interfaces |
| `ip link show` | Show network interface information |
| `ip link set eth0 down` | Deactivate eth0 network interface |
| `ip route` | Show or change routing table |
| `ip route show` | Show current routing table |
| `ip route add default via <192.168.1.1>` | Add default gateway on 192.168.1.1 |

### Advanced Networking:
| Command | Description |
| :--- | :--- |
| `route` | Show or configure routing table |
| `route -n` | Show routing table (numeric addresses) |
| `route flush` | Removes all routes |
| `route add default gw <192.168.1.1>` | Add default route to routing table |
| `arp` | Show or change ARP cache |
| `arp -a` | Prints arp table |
| `arp -n` | Show ARP cache (numeric addresses) |
| `arp -a -d` | Deletes all arp table entries |
| `arp -d <192.168.1.100>` | Remove 192.168.1.100 from the ARP cache |
| `arp -s` | Adds entry in arp table |
| `iwconfig` | Manage wireless network interfaces |
| `iwconfig wlan0` | Show information for wlan0 network interface |
| `curl` / `wget` | Download files from the internet |
| `curl -O <link>` / `wget <link>` | Download file and save in current directory |

### Network Monitoring:
| Command | Description |
| :--- | :--- |
| `netstat` | Network statistics |
| `netstat -tuln` | Show active network sockets |
| `netstat -r` | Show kernel routing table |
| `ss` | Socket statistics |
| `ss -tuln` | Show active network sockets |
| `ss -i` | Show network interface packet statistics |
| `iftop` | Real time bandwidth usage |
| `iftop -n` | Real time bandwidth usage (numeric addresses) |
| `iftop -i eth0` | Real time bandwidth usage for eth0 network interface |
| `tcpdump` | Network packet analyzer |
| `tcpdump -i <eth0>` | Show network traffic on eth0 network interface |
| `tcpdump -n <port 80>` | Show network traffic on port 80 (numeric addresses) |
| `nc / netcat / ncat` | Provides the ability to read and write data across network connections |
| `hping` | Analyzes and exchanges TCP/IP packets with a remote host |
| `speedometer` | Displays bandwidth usage in real-time |
| `vnstat` | Logs and shows time-based network traffic stats |
| `socat` | Transfers data between two bidirectional byte streams |

### DNS and Host Resolution:
| Command | Description |
| :--- | :--- |
| `dig <example.com>` | Perform DNS lookup |
| `nslookup <example.com>` | Query DNS servers |
| `host <example.com>` | Perform DNS lookup |
| `hostname` | Display hostname |
| `hostname <myhost>` | Change hostname |
| `ping <example.com>` | Send ICMP echo requests |
| `traceroute <example.com>` | Trace route to destination |
| `tracepath <example.com>` | Simplified traceroute |
| `mtr <example.com>` | Combines ping and traceroute functionalities |
| `whois <example.com>` | Lookup information for IP or domain |
| `w` | Displays information about currently logged-in users |
| `mail` | Sends and receives email using the command line |
| `iw` | Displays and configures wireless network interfaces |
| `ngrep` | Displays and filters network packet data on a given regex pattern |

### SSH & Remote Access:
| Command | Description |
| :--- | :--- |
| `ssh` | Securely connects to a remote system using the SSH protocol |
| `scp` | Copies files securely between client and server using the SSH protocol |
| `sftp` | Securely transfers files between hosts using the SFTP protocol |

### Security:
| Command | Description |
| :--- | :--- |
| `iptables` | Firewall utility that manages packet filtering and NAT |
| `snort` | Intrusion detection system that analyzes network traffic for suspicious activity |
| `wireshark` | Captures and analyzes network traffic in a formatted text |
| `ufw` | Manages system firewall and adds/deletes/modifies/resets packet filtering rule |

---

## Part 1: Networking Fundamentals
**Source: extracted_networking/for_devops/**

### What is Networking (for DevOps)
**1. Simple Explanation**
A network is formed when two or more systems are connected to communicate with each other. Think of it like a postal service for computers. Just as you need roads, addresses, and envelopes to send a letter to a friend, computers need cables, IP addresses, and data packets to send information to servers or databases.

**2. Why This Matters in DevOps**
In DevOps, "Infrastructure as Code" means you define networks using software. You aren't just writing code; you are defining how that code talks to the database, how users reach your app, and how to secure it. If the network fails, the application is unreachable, no matter how good the code is.

**3. Key Concepts**
- **Nodes:** Any device (server, laptop, router) connected to the network.
- **Links:** The physical or wireless connections between nodes.
- **Protocol:** The set of rules defining how data is formatted and processed.
- **Topology:** How the parts of a network are arranged (e.g., star, bus, ring).

**4. Commands / Practical Examples**
- `ping`: Checks if a destination is reachable.
- `ifconfig` (or `ip addr`): Shows your current network configuration.

**5. Real-World Example**
A DevOps engineer configures a Jenkins build server. To deploy code to a testing environment, the Jenkins server must have a network route to reach the testing server. If they are on different isolated networks without a bridge, the deployment fails.

**6. Common Beginner Mistakes**
- **Mistake:** Thinking networking is only for the “Network Team.”
- **Correction:** In cloud environments, DevOps engineers configure the network (VPCs, Subnets) themselves using code (Terraform/CloudFormation).

**7. Quick Revision Summary**
- Networking connects systems to share resources.
- It is the backbone of cloud and distributed applications.
- Protocols are the “language” computers speak.
- Topology is the shape or layout of the network.

---

### OSI vs. TCP/IP Model (Practical View)
**1. Simple Explanation**
These models split networking tasks into layers, like an assembly line. One person boxes the item, the next tapes it, the next labels it.
- **OSI Model:** A 7-layer theoretical model used for education.
- **TCP/IP Model:** A 4-layer practical model that powers the Internet.

**2. Why This Matters in DevOps**
When troubleshooting, you need to know *where* the break is. Is it a physical cable (Layer 1)? Is the IP address wrong (Layer 3)? Or is the application crashing (Layer 7)? This saves hours of debugging time.

**3. Key Concepts**
- **Layer 1 (Physical):** Cables and electricity.
- **Layer 2 (Data Link):** MAC addresses and switches.
- **Layer 3 (Network):** IP addresses and routing.
- **Layer 4 (Transport):** TCP/UDP ports and reliability.
- **Layer 7 (Application):** HTTP, FTP, SSH.

**4. Commands / Practical Examples**
- **Layer 3 check:** `ping 8.8.8.8` (Tests IP connectivity).
- **Layer 4 check:** `telnet google.com 80` (Tests if the port is open).

**5. Real-World Example**
Your web server isn’t loading. You ping the server (Layer 3) and it works. This tells you the server is online. You then check port 80 (Layer 4) and the connection is refused. You now know the web server application isn’t running, even though the machine is on.

**6. Common Beginner Mistakes**
- **Mistake:** Memorizing the OSI model but not knowing how to apply it.
- **Correction:** Focus on Layers 3 (IP), 4 (Ports), and 7 (App) as these are where 90% of DevOps troubleshooting happens.

**7. Quick Revision Summary**
- OSI has 7 layers; TCP/IP has 4 layers.
- TCP/IP is the real-world standard.
- Layer 3 = Routing/IPs.
- Layer 4 = Ports (TCP/UDP).
- Layer 7 = Applications (HTTP/SSH).

---

### IP Addresses (IPv4, Private vs. Public)
**1. Simple Explanation**
An IP address is like a phone number for a computer. It allows devices to locate and talk to each other. IPv4 uses four numbers separated by dots (e.g., 192.168.1.1).

**2. Why This Matters in DevOps**
Every server, container, and load balancer needs an IP. You must ensure your internal databases have *Private IPs* (safe from the internet) and your web servers have *Public IPs* (accessible to users).

**3. Key Concepts**
- **Public IP:** Routable on the internet (like a business phone number).
- **Private IP:** Not routable on the internet; used inside a home or company network (like an internal extension number).
- **RFC 1918:** The standard defining private ranges (e.g., 10.x.x.x, 192.168.x.x).

**4. Commands / Practical Examples**
- `curl ifconfig.me`: Shows your Public IP.
- `ip addr show`: Shows your Private/Local IP.

**5. Real-World Example**
You deploy a database on AWS. You accidentally assign it a Public IP. Hackers immediately scan and try to brute-force the password. A DevOps best practice is to ensure databases only have Private IPs.

**6. Common Beginner Mistakes**
- **Mistake:** Trying to connect to a Private IP (like 192.168.1.5) from a different location over the internet.
- **Correction:** Private IPs only work when you are connected to the same local network or VPN.

**7. Quick Revision Summary**
- IPs are unique identifiers for devices.
- Public IPs talk to the internet.
- Private IPs talk locally (LAN).
- Common Private blocks: 10.0.0.0/8 and 192.168.0.0/16.

---

### Subnetting & CIDR
**1. Simple Explanation**
Subnetting is slicing a large pizza (Network) into smaller slices (Subnets) to share it effectively. CIDR (Classless Inter-Domain Routing) is the notation (like /24) that tells you how big the slice is.

**2. Why This Matters in DevOps**
In the cloud (AWS/Azure), you must design your network. You might create a “Public Subnet” for web servers and a “Private Subnet” for databases. If you calculate the size wrong, you might run out of IP addresses for your servers.

**3. Key Concepts**
- **CIDR Notation:** A shorthand for subnet masks. `/24` means 254 usable IPs. `/32` means just 1 IP.
- **Subnet Mask:** Defines which part of the IP is the “Network” and which is the “Host” (device).

**4. Commands / Practical Examples**
- **Calculation:** If you have 192.168.0.0/24, you can create subnets like 192.168.0.0/27 (30 hosts) to segment departments.

**5. Real-World Example**
A Kubernetes cluster needs a lot of IP addresses for Pods. If you assign a /28 subnet (only 14 IPs) to the cluster, you can only run a few Pods before the network crashes. You should have assigned a /16 (65,000 IPs).

**6. Common Beginner Mistakes**
- **Mistake:** Thinking a higher CIDR number (e.g., /30) means *more* addresses.
- **Correction:** It’s the opposite. /8 is huge; /32 is one IP.

**7. Quick Revision Summary**
- Subnetting segments networks for security and performance.
- CIDR is the standard notation (e.g., 10.0.0.0/16).
- Lower CIDR number = More IPs.
- Higher CIDR number = Fewer IPs.

---

### Ports & Protocols
**1. Simple Explanation**
If an IP address is the building, the **Port** is the specific apartment number. **Protocols** are the languages spoken inside that apartment.

**2. Why This Matters in DevOps**
Firewalls block traffic by port. If you deploy a web server but forget to open Port 80 or 443, no one can see your website.

**3. Key Concepts**
- **SSH (Port 22):** Secure login to servers.
- **HTTP (Port 80):** Unsecured web traffic.
- **HTTPS (Port 443):** Secured web traffic.
- **DNS (Port 53):** Name resolution.

**4. Commands / Practical Examples**
- `netstat -tulpn`: Lists all ports your server is currently listening on.
- `telnet localhost 22`: Checks if the SSH port is open locally.

**5. Real-World Example**
You change your SSH port from 22 to 2222 for security. You must update your firewall rules and your connection scripts to use `-p 2222`, or you will be locked out of your own server.

**6. Common Beginner Mistakes**
- **Mistake:** Assuming applications always use default ports.
- **Correction:** A web server *can* run on port 8080 or 3000. Always check the configuration.

**7. Quick Revision Summary**
- IP = Address; Port = Door number.
- SSH = 22, HTTP = 80, HTTPS = 443.
- Protocols define the rules of conversation (e.g., TCP/IP).

---

### DNS (Domain Name System)
**1. Simple Explanation**
DNS acts like the contact list on your phone. You tap “Mom” (Domain Name), and the phone dials the number (IP Address). Computers don’t know “google.com”; they only know IPs.

**2. Why This Matters in DevOps**
If DNS breaks, everything looks broken. You cannot download packages, connect to APIs, or reach websites. “It’s always DNS” is a common DevOps meme for a reason.

**3. Key Concepts**
- **A Record:** Maps a name to an IPv4 address.
- **CNAME:** Maps a name to another name (alias).
- **TTL (Time to Live):** How long a device remembers the address before checking again.

**4. Commands / Practical Examples**
- `nslookup google.com`: Queries DNS to find the IP.
- `dig google.com`: A more detailed version of nslookup.

**5. Real-World Example**
You migrate a website to a new server (new IP). You update DNS, but users still see the old site. This is because of **TTL** (caching). You must wait for the cache to expire.

**6. Common Beginner Mistakes**
- **Mistake:** Hardcoding IP addresses in code.
- **Correction:** Always use DNS names (hostnames) because IPs change dynamically in the cloud.

**7. Quick Revision Summary**
- DNS translates Names to IPs.
- It is hierarchical (Root -> TLD -> Domain).
- Caching speeds it up but causes delays in updates.
- `nslookup` is your troubleshooting friend.

---

### TCP vs. UDP
**1. Simple Explanation**
- **TCP (Transmission Control Protocol):** Like a registered letter. You get a receipt confirming it arrived. Reliable but slower.
- **UDP (User Datagram Protocol):** Like a postcard. You send it and hope it arrives. Fast but unreliable.

**2. Why This Matters in DevOps**
You choose the protocol based on the app’s needs. Web apps (HTTP) use TCP because missing data breaks the page. Video streaming or DNS often uses UDP because speed is more important than perfection.

**3. Key Concepts**
- **TCP 3-Way Handshake:** Syn -> Syn/Ack -> Ack. (The setup process before sending data).
- **Connectionless:** UDP just sends data without checking if the receiver is ready.

**4. Commands / Practical Examples**
- `nc -zv <host> <port>`: Test a TCP connection.
- `nc -u -zv <host> <port>`: Test a UDP connection.

**5. Real-World Example**
A monitoring system sends metrics every second. It uses UDP. If one packet is lost, it doesn’t matter because a new one is coming in a second. Using TCP would waste resources checking every single packet.

**6. Common Beginner Mistakes**
- **Mistake:** Using TCP for real-time voice/video.
- **Correction:** The buffering/checking of TCP causes “lag.” UDP is preferred for live streams.

**7. Quick Revision Summary**
- TCP = Reliable, Ordered, Heavy (Web, Email, SSH).
- UDP = Fast, Unreliable, Lightweight (Streaming, DNS, Gaming).

---

### Firewalls & Security Groups
**1. Simple Explanation**
A firewall is a security guard that checks every packet entering or leaving your network. It decides to “Allow” or “Deny” based on rules (like a guest list).

**2. Why This Matters in DevOps**
In the cloud (AWS/Azure), firewalls are often called **Security Groups**. You must configure them to allow traffic to your web server (Port 80) while blocking hackers from your database port.

**3. Key Concepts**
- **Inbound Rules:** Traffic coming IN (e.g., users visiting your site).
- **Outbound Rules:** Traffic going OUT (e.g., your server downloading updates).
- **Stateful:** If you allow a request out, the reply is automatically allowed back in.

**4. Commands / Practical Examples**
- `sudo ufw status`: Check firewall status on Linux (Ubuntu).
- **Cloud Console:** Editing Security Group rules in AWS EC2.

**5. Real-World Example**
A developer complains they cannot SSH into a new server. You check the Security Group and see that Port 22 is only open to the office VPN IP, but the developer is working from home. You must add their home IP to the allow list.

**6. Common Beginner Mistakes**
- **Mistake:** Opening “All Traffic” (0.0.0.0/0) to fix a connection issue.
- **Correction:** This creates a massive security hole. Only open specific ports to specific IPs.

**7. Quick Revision Summary**
- Filters traffic based on IP and Port.
- Can be software (OS level) or cloud-based (Security Groups).
- Default rule is usually “Deny All” until you open a port.

---

### NAT & Gateways
**1. Simple Explanation**
**NAT (Network Address Translation)** allows multiple devices with private IPs to share a single Public IP to access the internet. It’s like an office receptionist who sends all outgoing mail under the company’s main address.

**2. Why This Matters in DevOps**
Private servers (like databases) need updates from the internet but shouldn’t have Public IPs. You use a **NAT Gateway** so they can download updates without being exposed to incoming hackers.

**3. Key Concepts**
- **Source NAT:** Changing the source IP (Internal -> Internet).
- **Destination NAT (Port Forwarding):** Directing incoming traffic to a specific internal server.

**4. Commands / Practical Examples**
- In Linux: `iptables -t nat -L` shows NAT rules.
- In AWS: Creating a “NAT Gateway” resource and updating Route Tables.

**5. Real-World Example**
Your private subnets in AWS cannot reach the internet to install Docker. You deploy a NAT Gateway in the public subnet and route the private subnet traffic through it. Now they can download Docker securely.

**6. Common Beginner Mistakes**
- **Mistake:** Putting a NAT Gateway in a private subnet.
- **Correction:** A NAT Gateway must live in a *Public* subnet to reach the internet.

**7. Quick Revision Summary**
- NAT masks internal IPs.
- Allows private servers to access the internet securely.
- Critical for secure cloud architecture.

---

### Load Balancing (L4 vs L7)
**1. Simple Explanation**
A Load Balancer is a traffic cop. It sits in front of your servers and distributes incoming users evenly so no single server crashes.

**2. Why This Matters in DevOps**
High Availability. If one server dies, the Load Balancer stops sending people there and sends them to the healthy servers instead.

**3. Key Concepts**
- **L4 (Transport) Load Balancing:** Dumb but fast. Looks at IP and Port (TCP). “Send packet to Server A.”
- **L7 (Application) Load Balancing:** Smart but slower. Looks at content (HTTP). “Send '/images' traffic to the Image Server.”

**4. Commands / Practical Examples**
- **Nginx configuration:** Defining an `upstream` block to load balance between `server1` and `server2`.
- **AWS:** Configuring an Application Load Balancer (ALB) for L7.

**5. Real-World Example**
You have an online store. You use an L7 Load Balancer. When users visit `store.com/checkout`, the balancer routes them to the high-security Payment Server group. When they visit `store.com/catalog`, it routes them to the standard Web Server group.

**6. Common Beginner Mistakes**
- **Mistake:** Forgetting “Health Checks.”
- **Correction:** The Load Balancer must know which servers are alive. If you don’t configure health checks, it will send traffic to dead servers.

**7. Quick Revision Summary**
- Distributes traffic for reliability.
- L4 = IP/Port based (Fast).
- L7 = Content/URL based (Smart).
- Requires Health Checks to work correctly.

---

### Reverse Proxy Basics
**1. Simple Explanation**
A Reverse Proxy sits in front of your web server. It accepts requests from clients and forwards them to the server. It handles security, encryption (SSL), and compression so the web server doesn’t have to.

**2. Why This Matters in DevOps**
It is standard practice to put Nginx or HAProxy in front of application servers (like Node.js or Python). It adds a layer of safety and performance.

**3. Key Concepts**
- **SSL Termination:** The proxy handles the HTTPS encryption/decryption.
- **Caching:** The proxy saves copies of images to serve them faster.

**4. Commands / Practical Examples**
- **Nginx Config:** `proxy_pass http://localhost:3000;` tells Nginx to forward traffic to the app running on port 3000.

**5. Real-World Example**
You have a Python app. It is slow at encrypting traffic. You put Nginx in front of it to handle the SSL certificates (HTTPS). The Python app now runs faster because it only deals with plain HTTP traffic from Nginx.

**6. Common Beginner Mistakes**
- **Mistake:** Confusing a Forward Proxy (VPN) with a Reverse Proxy.
- **Correction:** Forward Proxy acts for the *Client* (hiding the user). Reverse Proxy acts for the *Server* (hiding the server).

**7. Quick Revision Summary**
- Sits between User and Server.
- Handles SSL, Logging, Caching.
- Nginx and HAProxy are popular tools.

---

### Networking in Cloud (VPC, Subnets)
**1. Simple Explanation**
A **VPC (Virtual Private Cloud)** is your own private slice of a public cloud (like AWS). It’s a virtual data center where you define the walls, doors, and rooms.

**2. Why This Matters in DevOps**
You cannot deploy cloud resources securely without a VPC. It is the foundation of cloud security and connectivity.

**3. Key Concepts**
- **VPC:** The main network container.
- **Subnet:** Segments inside the VPC (Public vs. Private).
- **Internet Gateway:** The door to the outside world.
- **Route Table:** The map telling traffic where to go.

**4. Commands / Practical Examples**
- **Terraform:** Defining a resource `aws_vpc` to automate network creation.

**5. Real-World Example**
You build a 3-tier architecture.
1. **Web Tier:** Public Subnet (Internet access).
2. **App Tier:** Private Subnet (Talks to Web).
3. **Data Tier:** Private Subnet (Talks to App, no Internet).

**6. Common Beginner Mistakes**
- **Mistake:** Launching a database in the Default VPC with a public IP.
- **Correction:** Always create a custom VPC with private subnets for sensitive data.

**7. Quick Revision Summary**
- VPC = Your private cloud network.
- Subnets divide the VPC (Public/Private).
- Route Tables control traffic flow.

---

### Container & Kubernetes Networking
**1. Simple Explanation**
Containers are fleeting. They appear and disappear. Networking must be dynamic enough to assign IPs instantly and route traffic to moving targets.

**2. Why This Matters in DevOps**
Kubernetes is the standard for deployment. Understanding how “Pod A” talks to “Pod B” is essential for debugging microservices.

**3. Key Concepts**
- **Pod-to-Pod Communication:** Every Pod gets a unique IP. No NAT is used between Pods.
- **Service:** A stable address for a group of Pods (Load Balancer).
- **CNI (Container Network Interface):** The plugin that handles the plumbing (e.g., Calico, Flannel).

**4. Commands / Practical Examples**
- `kubectl get services`: Lists the stable endpoints.
- `kubectl port-forward`: Forwards a local port to a Pod for testing.

**5. Real-World Example**
A frontend Pod tries to reach a backend Pod. It shouldn't use the backend Pod's IP (which changes on restart). It should call the backend **Service Name** (e.g., `http://backend-svc`), which Kubernetes DNS resolves to the correct internal IP.

**6. Common Beginner Mistakes**
- **Mistake:** Treating Pod IPs like static server IPs.
- **Correction:** Pod IPs are ephemeral. Always communicate via Services.

**7. Quick Revision Summary**
- Pods get unique IPs.
- Services provide stable addresses.
- CNI plugins manage the network layer.
- DNS is built-in (CoreDNS).

---

### Common Networking Commands
**1. Simple Explanation**
These are the tools in your toolbox. You use them to diagnose connection problems from the command line.

**2. Why This Matters in DevOps**
When a server is broken, you often only have a terminal (black screen). You need these commands to see what is happening.

**3. Key Concepts & 5. Commands**
- `ping`: `ping google.com`. Is the host alive?
- `traceroute`: `traceroute google.com`. Shows every hop (router) the packet takes. Good for finding where the connection drops.
- `nslookup/dig`: `nslookup google.com`. Checks DNS resolution.
- `netstat/ss`: `ss -tulpn`. Shows open ports and listening services.
- `curl`: `curl -v http://site.com`. Tests web server response and headers.
- `nmap`: `nmap -p 80 <ip>`. Scans a server to see what ports are open.

**6. Real-World Example**
A deployment fails.
1. `ping` the server. (It replies, so it’s on).
2. `nc -zv host 80`. (Connection refused).
3. `ssh` into server.
4. `systemctl status nginx`. (It’s stopped).
5. Start Nginx. Fixed.

**7. Common Beginner Mistakes**
- **Mistake:** Assuming a failed ping means the server is down.
- **Correction:** Many firewalls block ping (ICMP) for security. Use `telnet` or `nc` to check specific ports instead.

**8. Quick Revision Summary**
- Ping = Reachability.
- Traceroute = Path.
- Curl = Web/API test.
- Netstat/SS = Ports.
- Nslookup = DNS.

---

### Troubleshooting Network Issues in DevOps
**1. Simple Explanation**
Network troubleshooting is detective work. You start broad and narrow down to the specific problem using a logical process.

**2. Why This Matters in DevOps**
Downtime costs money. Efficient troubleshooting restores services faster.

**3. Key Concepts**
- **Divide and Conquer:** Test Layer 3 (IP), then Layer 4 (Port), then Layer 7 (App).
- **Check Logs:** Firewall logs, VPC flow logs, Application logs.

**4. Commands / Practical Examples**
- **Scenario:** App can't connect to Database.
- **Step 1:** Check Security Group (Firewall).
- **Step 2:** `telnet db-host 5432` (Test Port).
- **Step 3:** Check Database logs for “Max Connections reached.”

**5. Real-World Example**
Users report the website is slow.
1. `ping` shows no packet loss.
2. `traceroute` shows fast hops.
3. `curl` shows the server takes 10 seconds to reply.
4. **Conclusion:** Network is fine; the application code is slow.

**6. Common Beginner Mistakes**
- **Mistake:** Blaming the network immediately.
- **Correction:** It’s often DNS or a misconfigured firewall. Check those first.

**7. Quick Revision Summary**
- Start from the bottom (IP) up to the top (App).
- Check Firewalls/Security Groups first.
- Use `curl -v` to see exact errors.
- “It’s always DNS” (until it isn’t).

---

## Part 2: Advanced Networking Concepts
**Source: extracted_networking/short_notes/**

### Basics of Networking
Networking plays a crucial role in the world of DevOps, where the focus is on automating software development, testing, and deployment processes. As a DevOps engineer, having a strong understanding of networking is essential for several reasons:

- **Infrastructure Design:** One of the core responsibilities of a DevOps engineer is to design and implement infrastructure that supports software development and deployment. This includes setting up networks, configuring routers and firewalls, and ensuring that servers and other devices are properly connected. Understanding networking protocols and infrastructure design principles is essential for designing an efficient and scalable infrastructure.
- **Application Deployment:** DevOps engineers are responsible for deploying applications to production environments. This involves setting up and configuring servers, load balancers, and other network components to ensure that the application runs smoothly and reliably. Understanding networking principles is essential for configuring network components and resolving network-related issues that may arise during application deployment.
- **Automation:** DevOps is all about automating processes to improve efficiency and reduce errors. Networking automation tools, such as Ansible and Puppet, are used to automate the configuration of network devices and ensure that they are properly configured and maintained. A good understanding of networking protocols and automation tools is essential for automating network-related tasks.
- **Monitoring:** DevOps engineers are responsible for monitoring and maintaining the infrastructure and applications they manage. This includes monitoring network traffic, identifying bottlenecks and performance issues, and troubleshooting network-related problems. Understanding networking protocols and tools is essential for identifying and resolving network issues in a timely manner.

### The OSI Model
The OSI model is a conceptual framework for understanding how data is transmitted across a network, and it consists of seven layers: physical, data link, network, transport, session, presentation, and application.

#### Functions of Layers
- **Physical Layer:**
  - Physical characteristics of interfaces and media
  - Representation of bits
  - Data rate
  - Synchronization of bits
  - Line configuration (point-to-point or multi-point)
  - Transmission Mode
  - Physical Topology
- **Data Link Layer:**
  - Framing
  - Physical addressing
  - Error control
  - Flow control
  - Access control
- **Network Layer:**
  - Routing
  - Congestion control
  - Billing
- **Transport Layer:**
  - Service Point addressing
  - Segmentation and reassembly
  - Flow control
  - Error control
- **Session Layer:**
  - Dialog control
  - Synchronization
- **Presentation Layer:**
  - Data encoding
  - Encryption
  - Compression
- **Application Layer:**
  - File Transfer
  - Mail services
  - Directory services

### TCP/IP Reference Model
TCP/IP stands for Transmission Control Protocol/Internet Protocol and is a suite of communication protocols used to interconnect network devices on the internet. TCP/IP is also used as a communications protocol in a private computer network (an intranet or extranet).

#### Layer Comparison:
- **Application Layer (TCP/IP)** maps to **Application, Presentation, Session (OSI)**
- **Transport Layer (TCP/IP)** maps to **Transport (OSI)**
- **Internet Layer (TCP/IP)** maps to **Network (OSI)**
- **Network Access Layer (TCP/IP)** maps to **Data Link, Physical (OSI)**

### The IP Protocol
At the network layer, the Internet can be viewed as a collection of sub-networks or Autonomous systems that are connected together. The network layer protocol that used for Internet is Internet Protocol (IP).
Its job is to provide a best-efforts way to transport datagrams from source to destination, without regard to whether or not these machines are on the same network or not these are other networks in between them. Communication in the Internet works as follows:
Each datagram is transmitted, after getting from Transport layer, through the Internet, possibly being fragmented into smaller units as it goes. When all pieces finally get to the destination machine, they are reassembled by the network layer into the original datagram.

**Note: Datagram**
Packets in IP layer are called Datagrams. A Datagram is a variable length packet (upto 65,536 bytes) consisting of two parts: Header and Data. The header can be from 20 to 60 bytes and contains information essential to routing and delivery.

- **Version:** The first field defines the version number of the IP. The current version is 4 (IPv4), with binary value 0100.
- **Header length (HLEN):** The HLEN field defines the length of the header in multiples of four bytes. The four bits can represent a number between 0 to 15, which, when multiplied by 4, gives a maximum of 60 bytes.
- **Service Type:** The service type field defines how datagram should be handled. It includes bits that define the priority of the datagram. It also contains bits that specify the type of service the sender desires such as the level of throughput, reliability, and delay.
- **Total Length:** The total length field defines the total length of the IP datagram. It is a two-byte field (16 bits) and can define up to 65,535 bytes.
- **Identification:** The identification field is used in fragmentation. A datagram, when passing through different networks, may be divided into fragments to match the network frame size. When this happens, each fragment is identified with a sequence number in this field.
- **Flags:** The bits in the flags field deal with fragmentation (the datagram can or can not be fragmented; can be first, middle, or last fragment; etc.).
- **Fragmentation offset:** The fragmentation offset is a pointer that shows the offset of the data in the original datagram (if it is fragmented).
- **Protocol:** The protocol field defines which upper-layer protocol data are encapsulated in datagram (TCP, UDP, ICMP etc.).
- **Time to live:** The time to live field defines the number of hops a datagram can travel before it is discarded. The source host, when it creates the datagram, sets this field to an initial value. Then, as the datagram travels through the Internet, router by router, each router decrements this value by 1. If this value becomes 0 before the datagram reaches its final destination, the datagram is discarded. This prevents a datagram from going back and forth forever between routers.
- **Header Checksum:** This is a 16-bit field used to check the integrity of the header, not the rest of the packet.
- **Source address:** The source address field is a four-byte (32-bit) Internet address. It identifies the original source of the datagram.
- **Destination address:** The destination address field is a four-byte (32-bit) Internet address. It identifies the final destination of the datagram.
- **Options:** The options field gives more functionality to IP datagram. It can carry fields that control routing, timing, management, and alignment.

### ADDRESSING
In addition to the physical address the internet requires an additional addressing convention: an address that identifies the connection of a host to its network. Each Internet address consists of 4 bytes defining three fields: class type, netid, and hostid. These parts are varying lengths depending on the class of the address.

#### CLASSES
There are currently five different classes: Class A, Class B, Class C, Class D, Class E.
- **Class A:** This can accommodate more hosts since 3 bytes are reserved for HOSTID. Class A will begin with 0. (NetID: 1 byte, HostID: 3 bytes)
- **Class B:** This will start with 10 and Host id will have 2 bytes length. (NetID: 2 bytes, HostID: 2 bytes)
- **Class C:** This will start with 110 and Hostid will have 1 byte length. (NetID: 3 bytes, HostID: 1 byte)
- **Class D:** This will start with 1110. This is reserved for Multicast addresses.
- **Class E:** This is reserved for feature use and will start with 1111.

### PROTOCOLS

#### Address Resolution Protocol (ARP)
The address resolution Protocol associates an ip address with physical address. On a typical physical network, such as a LAN, each device on a link is identified by a physical or station address usually imprinted on the network interface card (NIC).
Anytime a host or a router needs to find the physical address of another host on its network, it formats an ARP query packet that includes the IP address and broadcast it over the network. Every host on the network receives and processes the ARP packet, but only the intended recipient recognizes its internet address and sends back its physical address. The host both to its cache memory and to the datagram header, then sends the datagram on its way.

#### Reverse Address Resolution Protocol (RARP)
The RARP allows a host to discover its internet address when it knows only its physical address. The question here is, why do we need RARP? A host is supposed to have its internet address stored on its hard disk! RARP works much like ARP. The host wishing to retrieve its internet address broadcasts an RARP query packet that contains its physical address to every host on its physical network. A server on the network recognizes the RARP packet and returns the host’s internet address.

#### Internet Control Message Protocol (ICMP)
The Internet control message protocol is a mechanism used by hosts and routers to send notification of datagram problems back to the sender. IP is an unreliable and connectionless protocol. ICMP allows IP to inform a sender if a datagram is undeliverable. A datagram travels from router to router until it reaches one that can deliver it to its final destination. If a router is unable to route or deliver the datagram because of unusual conditions or due to congestion, ICMP allows it to inform the original source.
ICMP uses echo test/reply to test whether a destination is reachable and responding. It also handles both control and error message, but its sole function is to report problems, not correction them. A datagram carries only source and destination address. For this reason ICMP can send message only to the source, not to an intermediate router.

#### User Datagram Protocol (UDP)
The user datagram protocol (UDP) is the simpler of the two standard TCP/IP transport protocols. It is an end-to-end transport level protocol that adds only port addresses, check sum error control, and length information to the data from the upper layer. The packet produced by the UDP is called a user datagram.
- **Source port address:** The source port address is the address of the application program that has created the message.
- **Destination port address:** The destination port address is the address of the application program that will receive the message.
- **Total length:** The total length field defines the total length of the user datagram in bytes.
- **Check sum:** The check sum is a 16-bit field used in error detection.

#### FTP (File Transfer Protocol)
FTP (File Transfer Protocol) is a network protocol for transmitting files between computers over Transmission Control Protocol/Internet Protocol (TCP/IP) connections. Within the TCP/IP suite, FTP is considered an application layer protocol.
In an FTP transaction, the end user’s computer is typically called the local host. The second computer involved in FTP is a remote host, which is usually a server. Both computers need to be connected via a network and configured properly to transfer files via FTP. Servers must be set up to run FTP services, and the client must have FTP software installed to access these services.
FTP is a standard network protocol that can enable expansive file transfer capabilities across IP networks. Without FTP, file and data transfer can be managed with other mechanisms -- such as email or an HTTP web service -- but those other options lack the clarity of focus, precision and control that FTP enables.

---

### NETWORKING TOPOLOGIES
Two main types of network topologies in computer networks are:
1) Physical topology
2) Logical topology

The physical arrangement of the computer wires and other network components makes up this form of network.
Logical topology: Logical topology provides information on the physical architecture of a network.

There are various Physical Topologies, including:
- Bus Topology
- Ring Topology
- Star Topology
- Tree Topology
- Mesh Topology
- Hybrid Topology

#### Bus Topology
A single cable links all of the included components in a bus topology. The primary wire serves as the network's spine. The computer server is one of the computers in the network. A linear bus design is one that has two ends.

#### Ring Topology
Every device in a ring network has precisely two neighbouring devices for transmission purposes. It is known as a ring topology because its creation resembles a band. Every machine in this structure is linked to another. The last component is merged with the first one in this case.
To transmit information from one machine to another, this topology employs tokens. In this topology, all messages travel in the same direction through a ring.

#### Star Topology
All machines in the star architecture are linked together by a hub. This connection is referred to as a centre node, and it connects all other nodes. It is most commonly used on LAN networks because it is cheap and simple to set up.

#### Mesh Topology
The mesh architecture has a distinct network design in which every computer on the network communicates with every other computer. It establishes a P2P (point-to-point) link between all network devices. It provides a high degree of redundancy, so even if one network cable breaks, data can still reach its target via an alternate route.

#### Tree Topology
Tree structures have a base node that connects all other nodes to create a hierarchy. As a result, it is also referred to as hierarchy geometry. This topology is known as a Star Bus topology because it combines several star topologies into a single bus. Tree topology is a popular network topology that is comparable to bus and star topologies.

#### Hybrid Topology
A hybrid topology is one that incorporates two or more networks. As you can see in the above design, the resulting network does not follow any of the conventional topologies.
For example, as shown in the above image, Star and P2P topology are used in a workplace in one section. When two distinct fundamental network topologies are linked, a hybrid topology is always formed.

---

### CIDR NOTATION
Classless inter-domain routing (CIDR) is a collection of Internet Protocol (IP) protocols used to generate unique IDs for networks and individual devices. IP identifiers enable specific information packets to be sent to specific machines. Technicians found it challenging to monitor and identify IP addresses shortly after the introduction of CIDR, so a notation system was created to make the process more efficient and standardised.
The capacity to group blocks of addresses into a singular routing network is a distinguishing feature of CIDR, and the prefix standard used to understand IP numbers enables this. The first portion of the bit sequence that forms the binary encoding of an IP address is shared by CIDR blocks, and blocks are marked using the same decimal-dot CIDR notation scheme that is used for IPv4 addresses.
For example, 10.10.1.16/32 is a 32-bit address prefix, which is the maximum amount of bits permitted in IPv4. Addresses with the same prefix and amount of bits always pertain to the same block. Furthermore, the length of the prefix distinguishes bigger groups from smaller blocks. Short prefixes enable more addresses, whereas long suffixes designate tiny chunks.
The updated IPv6 protocol also uses CIDR notation, and the grammar is the same. The only change is that IPv6 names can be up to 128 bits long, as opposed to the 32-bit limit of IPv4. Despite the fact that IPv6 names can be up to 128 bits long, subnets on MAC layer networks always use 64-bit host IDs.

#### CIDR Conversion Table
| IPv4 CIDR IP/CIDR | to last IP address | Mask | Hosts (*) | Class |
| :--- | :--- | :--- | :--- | :--- |
| a.b.c.d/32 | +0.0.0.0 | 255.255.255.255 | 1 | 1/256 C |
| a.b.c.d/31 | +0.0.0.1 | 255.255.255.254 | 2 | 1/258 C |
| a.b.c.d/30 | +0.0.0.3 | 255.255.255.252 | 4 | 1/64 C |
| a.b.c.d/29 | +0.0.0.7 | 255.255.255.248 | 8 | 1/32 C |
| a.b.c.d/28 | +0.0.0.15 | 255.255.255.240 | 16 | 1/16 C |

#### How CIDR makes subnetting easier
By designating a portion of the host identifier, a specific subnet mask is formed, and bigger subnets are produced by moving more bits from the host identity to the subnet mask. A network's ultimate subnet is marked in binary with all ones. The ultimate subnet is 255.255.255.255 when written in CIDR dot-decimal format.
Prior to CIDR, subnet masks with all zeros (255.255.255.0) and subnet masks with all ones (255.255.255.255) could not be used because they could be mistaken with network IDs, but CIDR-compliant equipment distinguishes between the two using CIDR notation's prefixes and suffixes.

---

### MAC ADDRESS
1. The MAC address is the physical address that individually recognises each device on a network. To interact between two networked devices, we need two addresses: an IP address and a MAC identifier. It is given to each NIC (Network Interface Card) capable of connecting to the internet.
2. Media Access Control is an abbreviation for Media Access Control. It is also known as Physical Address, Hardware Address, or BIA. (Burned In Address).
3. It has a worldwide unique MAC address, which means that no two machines with the same MAC address can coexist. It is displayed in hexadecimal notation on each gadget.
4. It has 12 numbers and 48 bits, with the first 24 bits used for the OUI (Organization Unique Identifier) and the remaining 24 bits used for NIC/vendor-specific information.
5. It works at the data link layer of the OSI architecture.
6. It is provided by the device's manufacturer and is embedded in the device's NIC, which should not be altered.
7. The ARP algorithm is used to link a logical identity with a physical or MAC address.

#### Types of MAC Address
**Unicast MAC Address**
The Unicast MAC address of a network NIC identifies it. A Unicast addressed packet is only received by the interface going to a specific NIC. If the LSB (least significant bit) of the first octet of an address is set to zero, the message is only meant to reach one recipient NIC. The MAC address of the originating computer is always unicast.

**Multicast MAC Address**
Using multicast addresses, the source device can transmit a data packet to a large number of other devices or NICs. In a Layer-2 (Ethernet) Multicast address, the first three characters of the first octet, or the LSB (least significant bit), are set to one and designated for multicast addresses. The leftover 24 bits are used by the device that wishes to communicate data in a group.

**Broadcast MAC Address**
It's a graphical depiction of all networked gadgets. Broadcast frames are Ethernet frames that comprise one number in each of the destination address's bits (FF-FF-FF-FF-FF), also known as broadcast addresses.
These bits hold all of the designated broadcast addresses. All machines on that LAN section will receive packets with the MAC identifier FF-FF-FF-FF-FF-FF. As a result, if a parent device needs to send data to every device on the network, the broadcast address can be used as the target MAC address.

---

### ALL ABOUT DNS
The DNS is a database of domain name and IP address information that enables computers to locate the correct IP address for a hostname URL input into it. When we attempt to visit a website, we usually type its domain name into the web browser, such as trainwithshubham.com, ip.com, or bharat.com. Web browsers, on the other hand, require the precise IP addresses in order to access information for the website. The DNS is responsible for converting domain names to IP addresses so that data can be loaded from the website's host.
Websites may have multiple IP numbers relating to a single domain name. Large sites, such as Google, will have people accessing a computer from all over the globe. Even if the site name entered in the browser is the same, the server that a computer in Singapore attempts to access will most likely be distinct from the one that a computer in Toronto tries to reach. DNS caching comes into play here.

#### How Does DNS Work?
The DNS is in charge of transforming the domain, also known as the website or web page name, to the IP address. A DNS query is the act of inputting the domain name, and DNS resolve is the process of locating the associated IP address.
DNS inquiries are classified into three types: recursive queries, incremental queries, and non-recursive queries.
- **Recursive queries** are those that require a DNS server to reply with the desired resource record. If an entry cannot be located, an error notice must be displayed to the DNS client.
- **Iterative queries** are those in which the DNS client requests an answer from numerous DNS servers until the best response is discovered, or until an error or timeout happens. If the DNS server cannot discover a match for the query, it will forward the request to a DNS server authorised for a lower level of the domain namespace. The DNS client then queries this reference address, and the procedure is repeated with additional DNS servers.
- **Non-recursive requests** are those that are handled by a DNS resolver when the requested resource is accessible, either because the server is authoritative or because the resource is already in cache.

#### The DNS process step-by-step
1. Browser asks Resolver
2. Asks Root Server "."
3. Root: "Go ask the .com server."
4. Asks TLD Server (.com)
5. TLD: "Go ask Google's nameserver."
6. Asks Authoritative Server
7. Authoritative: "Here is the IP: 142.250.x.x"
8. Resolver returns IP to Browser

---

### DHCP (DYNAMIC HOST CONFIGURATION PROTOCOL)
Dynamic Host Configuration Protocol (DHCP) is a network administration protocol that assigns an IP address to any device or component on a network so that they can interact using IP. (Internet Protocol). These settings are automated and managed collectively by DHCP. There is no need to explicitly give IP addresses to new devices. As a result, no user setup is required to join to a DHCP-based network.
DHCP can be used on both local networks and big corporate networks. Most routers and networking devices use DHCP as the default mechanism. RFC (Request for opinions) 2131 is another name for DHCP.

#### How does DHCP work?
DHCP operates at the application layer of the TCP/IP protocol stack, randomly assigning IP addresses to DHCP clients/nodes and allocating TCP/IP setup information to DHCP clients. Subnet mask information, default gateway information, IP identities, and domain name system identifiers are all examples of information.
DHCP is a client-server system in which servers handle a collection of distinct IP addresses as well as client setup factors and distribute addresses from those address pools.

#### Why should you use DHCP?
To reach the network and its services, each device on a TCP/IP-based network must have a unique unicast IP address. IP addresses for new computers or computers relocated from one subnet to another must be manually setup without DHCP; IP addresses for computers withdrawn from the network must be manually reclaimed.
This complete procedure is automated and handled centrally by DHCP. When a DHCP-enabled client connects to the network, the DHCP server keeps a collection of IP numbers and leases one to it. Because IP addresses are dynamic (leased) rather than immutable (assigned forever), addresses that are no longer in use are immediately returned to the pool for reallocation.
In the shape of a lease offer, the network administrator creates DHCP servers that keep TCP/IP configuration information and provide address setup to DHCP-enabled clients. The setup information is saved in a directory by the DHCP server, which includes:
- Valid TCP/IP setup values for all network consumers.
- Valid IP numbers are kept in a database for client distribution, as are excluded addresses.
- IP numbers that have been reserved for specific DHCP customers. This enables a single IP address to be assigned to a single DHCP customer in a uniform manner.
- The lease term, or the amount of time the IP address can be used before requiring a licence renewal.

---

### SSH (SECURE SHELL OR SECURE SOCKET SHELL)
- SSH is a protocol for safely accessing distant computers via command line interaction.
- It uses port number 22 by default.
- SSH is the most commonly used method for connecting to distant Linux and Unix-like systems.
- Historically, telnet was used to reach distant computer command line interfaces, but due to security concerns, telnet has become obsolete, and ssh is now used instead of telnet.
- Secure communication encrypts conversation with a public key over an unsecure route and uses a powerful password verification. It is used to supplant unprotected remote login protocols like Telnet, rlogin, rsh, and others, as well as unsafe file transmission protocols like FTP.
- Its security features are extensively used by network managers for remote management of systems and apps.
- The SSH protocol safeguards the network against assaults such as DNS spoofing, IP source routing, and IP faking.

#### The architecture of SSH Protocol
The SSH architecture is made-up of three well-separated layers. These layers are:
1. **Transport Layer**
2. **User-authentication layer**
3. **Connection Layer**

Since the SSH protocol architecture is open, it offers great freedom and makes it possible to use SSH for a variety of other reasons in addition to just a private shell. The transport layer is analogous to the transport layer protection in the design (TLS). The user-login layer can be used with custom authentication techniques, and the connection layer provides for the multiplexing of numerous secondary sessions into a single SSH link.

**Transport Layer**
The transport layer is the protocol suite's upper component. This layer manages the charge of managing initial key exchange, server identification, encryption, compression, and integrity checking for SSH-2. It serves as an interface for transmitting and getting plaintext messages of up to 32, 768 bytes in size.

**User authentication Layer**
The user authentication layer, as the name implies, is in charge of client identification and offers a variety of authentication techniques. Because authentication is done on the client side, when a login alert appears, it is generally for an SSH client rather than a server, and the server reacts to these authentications.
The User authentication layer contains several authentication techniques, including:
- **Password:** Password verification is a simple method of identification. It has the option to alter the password for simple entry. However, it is not used by all apps.
- **Public-key:** The public-key authentication method is built on public keys and allows DSA, ECDSA, or RSA keypairs.
- **keyboard-interactive:** In this case, the server transmits a prompt for the user to input information, and the client responds with the user's keyed-in answers. It is used to authenticate users with a one-time passcode or OTP.
- **GSSAPI:** In this technique, authentication is done by external methods such as Kerberos 5 or NTLM, which provide SSH connections with single sign-on functionality.

**Connection Layer**
The link layer specifies the routes through which SSH services are delivered. It specifies the terms channel, channel request, and worldwide request. One SSH link can handle multiple channels at the same time and transmit data in both ways. In the link layer, channel requests are used to send out-of-band channel-specific data, such as the changed dimensions of a terminal window or the departure code of a server-side process. The following are the typical link layer channel types:
- **Shell:** It is used for desktop interfaces, SFTP, and exec commands.
- **Direct-TCPIP:** This protocol is used to forward client-to-server communications.
- **Forwarded-TCPIP:** It is used for redirected server-to-client communications.

---

### SCP (SECURE COPY PROTOCOL)
The safe Copy Protocol, abbreviated "SCP," aids in the safe transmission of computer data from a local to a remote host. It is comparable to the File Transfer Protocol "FTP," but it also includes protection and authentication.
The SCP operates on Port 22, and some believe it is a hybrid of the BSD RCP and the SSH protocol.
The RCP protocol is used to transmit files, and the SSH protocol offers authentication and encryption, so SCP is a hybrid of these two protocols.
Because the data being transmitted stays private, the SCP can be used to effectively prevent packet sniffers from extracting valuable information from data packets.
The SCP can also benefit from using SSH because it allows the inclusion of permissions and timestamps for the file that needs to be uploaded.

**CP vs SCP**
SCP will be easy to grasp if you've used the "cp command" on your local Linux computer. To execute a copy action, both commands must have a source and target file-system address. The primary distinction here is that the SCP needs one or both places to be on a remote system.
For example, the following copy instruction could be used:
`copy /main/shub/pictures/picture*.png /main/shub/archive/picture*.png`
This command would commence a copy process that would transfer all files in the directory pictures in user shub's main directory with names beginning with "picture.png" into the directory "archive" in the "main" directory.
The SCP instruction can be used to accomplish the same operation:
`scp /main/shub/pictures/picture*.png john@myhost.com:/main/shub/archive`
As shown above, when using the SCP command with the login name shub, those same files would be uploaded to the server myhost.com into the remote directory `/main/shub/archive`. The SCP will let the uploading process initiate only if the user “shub” provides his remote password.
A remote location could also be specified as a source if one needs to download the files. For instance,
`scp shub@myhost.com:/main/shub/archive/picture*.png /main/shub/downloads`
on myhost.com with the name starting with “picture and ending in .png,” into the local directory `/main/shub/downloads`.

**The SCP Command Syntax**
Before going into the explanation of how the SCP command works, let’s take a look at its basic syntax:
`scp [-32658BCpqrv] [-c cipher] [-F ssh_config] [-i identity_file] [-l limit] [-o ssh_option] [-P port] [-S program] [[user@]SRC_host:]file1 ... [[user@]DEST_host:]file2`

- **-c cipher:** This option selects and uses the cipher to encrypt the data transfer. It is passed to the SSH session directly.
- **-F ssh_config:** With this option, an alternative per-user configuration file would be specified for the SSH. It is sent to SSH directly.
- **-i identity_file:** It chooses the file which provides the identity (key) for RSA authentication. It is passed to the SSH directly.
- **-l limit:** This option can be used to limit the bandwidth, which is in Kbps.
- **-o ssh_option:** It can be applied to pass options to SSH using the same format as of the ssh_config. It is helpful to specify the options which have no separate SCP command-line flag.
- **-P port:** This option states the port needed to connect to, on the remote host. Keep in mind that this option has a capital “P”; small “p” is used for other tasks.
- **-p:** It is used to preserve access times, modification times, and modes from the original file.
- **-q:** It can be applied to disable the progress meter.
- **-r:** It can be used to copy the entire directories recursively.
- **-S program:** It specifies the name of the program that is used for the encrypted connection. It is essential for the program to understand the SSH options.
- **-v:** This is the verbose mode which forces SCP and SSH to show the debugging messages about the progress. It can be useful for troubleshooting connection, authentication, and configuration issues.

---

### CURL (CLIENT URL)
Client URL (pronounced "curl") is a command line utility that allows data to be exchanged between a device and a website via a terminal. A user provides a server URL (the place where they want to make a request) and the data they want to transmit to that server URL using this command line interface (CLI).
The cURL function makes use of the client-side URL transfer tool libcURL. Many various transmission methods are supported by this software, including HTTPS, SMTP, and FTP. When making queries, you can also include cookies, establish proxies, and add login details.
curl is powered by libcurl, a portable client-side URL transfer library. You can use it directly on the command line or include it in a script. The most common use cases for curl are:
- Downloading files from the internet
- Endpoint testing
- Debugging
- Error logging

**Basics: How to Use curl**
`curl [option] [url]`
Options will direct curl to perform certain actions on the URL listed. The URL gives curl the path to the server it should perform the action on. You can list one URL, several URLs, or parts of a URL, depending on the nature of your option.

Listing more than one URL:
`curl -O http://url1.com/file1.html -O http://url2.com/file2.html`

Listing different parts of a URL:
`http://example.{page1,page2,page3}.html`

**cURL Protocols and Formats**
cURL utilises the HTTP interface by default. cURL can also use the following protocols and formats:

**FTP - File Transfer Protocol.**
The File send Protocol (FTP) is a protocol used to send data from a server to a client. Use this protocol in conjunction with cURL to send items like this:
`cURL -T [chosen-file] "ftp://[target-destination]"`
cURL is an excellent substitute for a normal FTP client.

**Simple Mail Transfer Protocol**
For transmitting messages to an SMTP server, use the Simple Mail Transfer Protocol (SMTP). This info includes the content you're transmitting, as well as the sender and recipient. It appears as follows:
`cURL smtp://[smtp-sever] --mail-from [sender] --mail-rcpt \ [receiver] --upload-file [mail-content-file]`

**Dictionary Network Protocol (DICT)**
The Dictionary Network Protocol (DICT) allows you to access dictionaries by running the following command with
`cURL: cURL "dict://dict.org/d:hello"`
This command returns a result with the dictionary selected and the definition of "hello" from the dictionary.

**Make cURL work for you.**
cURL is a command-line utility that enables you to request and send data over a URL using various protocols. It gives you flexibility and control of URLs on the terminal. Using cURL on the terminal is simple, but may not be intuitive to use by every user. By providing the URL and the options needed, you can request and download data from URLs, transfer data to URLs, and more.

---

### WHAT IS A SUBNET
A subnet or subnetwork is a smaller network inside a large network. Subnetting makes network routing much more efficient.
Subnetting occurs when a larger network is split into smaller networks to keep security. As a result, lesser networks are easier to maintain. For example, if we examine a class A address, the potential number of hosts for each network is 2^24. It is clear that maintaining such a large number of hosts is challenging, but it is much simpler to maintain if we split the network into tiny sections.
Subnet itself is a huge chapter to study and gain some experience with it, if you want to more then refer to some blogs and articles for in-depth subnetting.

---

### ROUTING
- A router is a mechanism that selects a way for data to be transferred from source to target. A router is a unique instrument that performs routing.
- A router operates at the network layer of the OSI model and at the internet layer of the TCP/IP model.
- A router is a networking device that sends packets using information from the packet header and routing table.
- Routing methods are used to route messages. The routing method is nothing more than software that determines the best route for packet transmission.
- The metric is used by routing algorithms to find the optimal route for packet delivery. The metric is the unit of measurement used by the routing algorithm to determine the best route to the target, such as step count, bandwidth, latency, present traffic on the channel, and so on.
- The routing algorithm creates and manages the routing table for the route selection procedure.

**Types Of Routing**
- Static Routing
- Dynamic Routing
- Default Routing

#### Static Routing
- Nonadaptive Routing is another name for static routing.
- It is a method in which an administrator physically enters paths into a routing database.
- The packets for the target can be sent by a Router along the path specified by the user.
- This method does not make routing choices based on network condition or topology.

#### Default Routing
- Default Routing is a routing method in which a router is set to deliver all messages to the same hop device, regardless of whether it belongs to a specific network or not. A packet is sent to the device for which default routing is set.
- Default When networks have a singular departure point, routing is used.
- It is also helpful when a large number of communication networks must send data to the same IP device.
- When a particular route is stated in the routing table, the router will take that route instead of the usual route. When a particular route is not listed in the routing table, the default route is used.

#### Dynamic Routing
- It is also referred to as Adaptive Routing.
- It is a method in which a router creates a new path in the routing table for each packet in reaction to changes in the network's state or topology.
- Dynamic protocols are used to find novel paths to the target.
- RIP and OSPF are the protocols used in Dynamic Routing to find novel paths.
- If any path fails, an automatic adjustment will be made to get to the location.

**What are routing algorithms?**
Routing algorithms are programs that execute various routing schemes. They operate by allocating a cost number to each connection, which is computed using various network data. Every router attempts to send the data packet to the next best connection at the lowest possible cost.
Here are some examples of algorithms:
- **Distance Vector Routing:** The Distance Vector Routing algorithm needs all routers to communicate with one another on a regular basis about the best way information they have discovered. Each router transmits information about the current overall cost estimate to all known locations. Every router in the network eventually finds the optimal path information for all potential locations.
- **Link State Routing:** Every router in the network finds all other routers in the network when using Link State Routing. A router uses this information to build a map of the entire network and then determines the quickest path for any data packet.
