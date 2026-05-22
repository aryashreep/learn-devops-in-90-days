# 🐧 Linux Fundamentals: The "Blackboard Edition"

This guide covers the core essentials of Linux, designed for beginners in the #LearnDevOpsIn90Days journey.

---

## 1. What is Linux?
Linux is an **open-source Kernel**—the core "engine" that manages your computer's hardware (CPU, RAM, Disks) so that applications can run. Unlike Windows or macOS, Linux is free, transparent, and highly customizable.

## 2. Who developed it?
**Linus Torvalds** released the first version in **1991**. What started as a hobby project for a Finnish university student has now grown into the world's most critical software.

## 3. History in a Nutshell
*   **1970s:** UNIX is created at Bell Labs.
*   **1991:** Linus Torvalds announces Linux.
*   **2000s:** Linux becomes the backbone of the Internet (Web servers, Databases).
*   **Today:** Powers 100% of supercomputers, 90% of the Cloud, and billions of Android devices.

## 4. The ASK Model (Layers of Linux)
*   **A - Architecture:** The blueprint of how components work together.
*   **S - Shell:** The command-line "Translator" where you type commands.
*   **K - Kernel:** The "Heart" that communicates directly with hardware.

> **Analogy:** Hardware is the **Kitchen**, Applications are the **Customers**, and the OS/Kernel is the **Restaurant Manager** coordinating everything!

## 5. The Root Directory (/) Structure
In Linux, everything is a file, and everything starts from the Root (`/`).

| Directory | Purpose |
| :--- | :--- |
| `/bin` | Essential command binaries (ls, cp, cd). |
| `/sbin` | System binaries for administration. |
| `/etc` | **Configuration files** (where you edit settings). |
| `/home` | Personal folders for regular users. |
| `/root` | The home folder for the Superuser (Admin). |
| `/var` | Variable data like **logs** and databases. |
| `/tmp` | Temporary files (cleared on reboot). |
| `/usr` | User-installed applications and libraries. |
| `/mnt` | Mount points for external storage. |
| `/dev` | Hardware device files (your disk is `/dev/sda`). |

---

*Generated for Day 02 of the #LearnDevOpsIn90Days Challenge.*
