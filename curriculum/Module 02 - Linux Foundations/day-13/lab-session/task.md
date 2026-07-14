# 🧪 Lab Session: Day 13 — LVM Hands-on

**Jagu:** "Golu, imagine that the server disk is full and production is going on! Today we will explore the 'Elastic' magic of LVM so that we can expand the disk of a live server."

## 🎯 Task Objectives
- Understand the LVM hierarchy (PV -> VG -> LV).
- List and inspect existing logical volumes.
- (Simulation) Understand how to extend a volume.

## 🛠️ Hands-on Challenges

1.  **Inspector Gadget:** Use `pvdisplay`, `vgdisplay`, and `lvdisplay` (use sudo) to see if your current system uses LVM.
2.  **The Map:** Run `lsblk` and identify which partitions are part of an LVM group.
3.  **Search & Learn:** Find the configuration file for LVM in `/etc`. (Hint: use `find`).
4.  **The "What If" Scenario:** Write down the 3 commands you would use to:
    - Create a Physical Volume.
    - Create a Volume Group.
    - Create a Logical Volume of 1GB.
5.  **Real-world check:** Run `df -h` and check if your `/` root partition is an LVM mapper device.

---

### ✅ Proof of Work
**Jagu:** "Disk management is pro level skill Golu! Save your LVM map."

1. Create a file named `lvm-check.md` in the **`solution/`** folder.
2. Paste the output of `lsblk` and your 3-command "What If" answers.
3. Commit and push!

---
*#LearnDevOpsIn90Days • Day 13 • Golu & Jagu Edition*
