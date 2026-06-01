# 🏆 Module 3 Mastery Exam: Networking & System Design

Welcome to the **Networking Mastery Exam**! This assessment tests your knowledge of networking fundamentals, troubleshooting, and cloud-native architecture.

---

## 📝 Part 1: Networking Fundamentals

**1. You can successfully ping the server, but the connection to port 80 is refused. Which layer is likely hosting the problem?**
- A) Layer 1 (Physical cable issue)
- B) Layer 3 (IP connectivity issue)
- C) Layer 4 (Port/Application issue)
- D) Layer 2 (Switch issue)
- **Ans: C (Layer 4)** *(Note: The original image had B, but port refusal is a Layer 4 issue since ping/L3 works)*

**2. Which topology is described as having a central switch that manages traffic flow between devices?**
- A) Ring Topology
- B) Bus Topology
- C) Star Topology
- D) Mesh Topology
- **Ans: C**

**3. Why should database servers typically be assigned Private IPs?**
- A) Private IPs are faster than Public IPs
- B) To prevent hackers from brute-forcing passwords from the public internet
- C) Databases cannot function on Public IPs
- D) Private IPs are free, while Public IPs always cost money
- **Ans: B**

**4. In CIDR notation, what does a /32 represent?**
- A) A network with 254 hosts
- B) A network with 65,000 hosts
- C) Just 1 single IP address
- D) The entire internet
- **Ans: C**

**5. What is the standard port for SSH (Secure Shell)?**
- A) 443
- B) 22
- C) 80
- D) 53
- **Ans: B**

**6. Which statement about CIDR numbers is true?**
- A) A lower CIDR number (e.g., /8) means more IP's
- B) A higher CIDR number (e.g., /30) means more IP's
- C) All CIDR numbers provide the same number of addresses
- D) CIDR numbers only apply to IPv6
- **Ans: A**

**7. Why are some users still accessing the old website after the DNS 'A' record was updated with the new server IP?**
- A) The old server has not been turned off yet
- B) The new server's firewall is blocking all traffic
- C) Resolvers & local devices have cached old DNS record due to its TTL
- D) The CNAME record was not updated correctly
- **Ans: C**

**8. Why is UDP preferred for video streaming or DNS?**
- A) It guarantees every packet arrives in order
- B) It encrypts data better
- C) It uses a 3-Way Handshake
- D) Speed is more important than perfection; lost packets don't stop the stream
- **Ans: D**

---

## 🚀 Part 2: Advanced Concepts & Troubleshooting

**9. What is the common DevOps meme regarding troubleshooting network issues?**
- A) It's always the Firewall
- B) It's always DNS
- C) Have you tried restarting?
- D) It's always the Database
- **Ans: B**

**10. What does TTL (Time to Live) control in DNS?**
- A) The speed of the internet connection
- B) How long a device remembers (caches) an address
- C) The number of characters in a domain name
- D) The security level of the domain
- **Ans: B**

**11. Which command is best suited for querying DNS to find an IP address?**
- A) ping
- B) netstat
- C) nslookup
- D) traceroute
- **Ans: C**

**12. What is a major security risk when configuring Security Groups?**
- A) Opening "All Traffic" (0.0.0.0/0) to fix a connection issue
- B) Allowing traffic on Port 443
- C) Using specific IPs for SSH access
- D) Creating an Outbound rule
- **Ans: A**

**13. What is the difference between a Forward Proxy and a Reverse Proxy?**
- A) Forward Proxy hides the Server; a Reverse Proxy hides Client
- B) Forward Proxy hides Client (VPN); a Reverse Proxy hides Server
- C) They are exactly the same
- D) Reverse Proxy is only used for emails
- **Ans: B**

**14. In cloud environment, what is the most accurate description of modern DevOps engineer's responsibility regarding networking?**
- A) Define & manage network components like VPCs, subnets, and firewall rules via code
- B) Physically plug in cables & configure hardware routers in the data center
- C) Focus solely on app code, as networking is automatically handled by cloud platform
- D) Submit tickets to separate Network Team & wait to provision network resource
- **Ans: A**

**15. Which command shows every "hop" (router) a packet takes to reach a destination?**
- A) ping
- B) curl
- C) ssh
- D) traceroute
- **Ans: D**

---
*#LearnDevOpsIn90Days • @AryashreePritikrishna • Phase 2: The Networking Foundation*
