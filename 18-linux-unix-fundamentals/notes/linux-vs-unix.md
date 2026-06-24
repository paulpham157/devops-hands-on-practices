# Linux vs Unix Notes

Unix is both a historical operating system family and a design tradition.

Linux is a Unix-like kernel created independently. A full Linux distribution combines the Linux kernel with userland tools, libraries, init systems, package managers, and applications.

GNU/Linux usually means a Linux system using GNU userland tools such as Bash and GNU Coreutils.

POSIX is a standards family that defines portable interfaces for operating systems, shells, and utilities. POSIX compatibility matters when scripts need to run across different Unix-like systems.

## Practical Differences

| Topic | Linux | Unix / Unix-like |
| --- | --- | --- |
| Kernel | Linux kernel | Different kernels depending on system |
| Userland | GNU, BusyBox, musl, systemd, distro tools | BSD, macOS, commercial Unix tools |
| Package manager | apt, dnf, apk, pacman, zypper | varies by system |
| Container usage | dominant container runtime target | less common as container base |
| Command flags | often GNU flags on mainstream distros | BSD and BusyBox flags can differ |

## DevOps Takeaway

Do not assume every system has the same command flags.

For portable scripts, prefer POSIX `sh` features unless you intentionally require Bash.

For container debugging, first check:

```bash
cat /etc/os-release
echo "$SHELL"
which sh
which bash
```

