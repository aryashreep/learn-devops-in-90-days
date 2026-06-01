# Core Components of Linux

## Kernel
- The kernel is the core part of Linux.
- It manages:
  - CPU
  - Memory
  - Devices
  - Filesystems
  - Processes
  - Communication between hardware and software

## Shell
- The shell is the area where users interact with the operating system.
- Examples:
  - Bash shell
  - Commands like `ls`, `cp`, and `mkdir`

## Init / systemd
- The first process started by the kernel (PID 1).
- In modern Linux systems, `systemd` is the init system.
- Responsible for:
  - Starting services
  - Managing background processes

---

# Process Creation and Management

## How Processes Are Created
- A process starts when you run a command.
- Linux uses:
  - `fork()` → Creates a new process
  - `exec()` → Loads the program into memory

## Process States
- **Running** → Currently executing
- **Sleeping** → Waiting for input
- **Stopped** → Temporarily paused
- **Zombie** → Finished execution but parent has not collected status
- **Orphan** → Parent process ended before child process

## Process Management Commands
- `ps` → Shows running processes
- `top` → Real-time process monitoring
- `kill` → Terminates a process
- `jobs` → Shows background jobs
- `nice` → Changes process priority

---

# What systemd Does and Why It Matters

## systemd Functions
- Starts services during boot
- Restarts failed services automatically
- Manages system services and background processes

## Why systemd Matters
- Faster boot process
- Better service management
- Improved system reliability

---

# 5 Daily Linux Commands

- `ls` → List files and directories
- `cd` → Change directory
- `pwd` → Show current directory
- `mkdir` → Create a new directory
- `touch` → Create a new file
