# Solution: Linux vs Unix vs POSIX

Linux is not the same thing as historical Unix. Linux is a Unix-like kernel used by Linux distributions.

The kernel manages low-level system resources such as processes, memory, filesystems, devices, and networking.

Userland means the tools and programs that run above the kernel, such as shells, commands, libraries, daemons, and package managers.

POSIX matters because it defines portable behavior for operating system interfaces and shell utilities. Scripts that stick to POSIX features are more likely to work across Unix-like systems.

A command may work on Ubuntu but fail in Alpine because Ubuntu commonly uses GNU tools while Alpine often uses BusyBox tools with fewer or different flags.

