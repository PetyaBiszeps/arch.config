## Installation

Boot from Arch Linux ISO, connect to the internet, and run:

```bash
archinstall --config-url https://raw.githubusercontent.com/PetyaBiszeps/arch.config/main/archinstall/config.json
```

The configuration preselects system settings, packages, and services.

Before starting the installation, manually configure:

1. **Disk configuration** — select the target SSD, Btrfs filesystem, default subvolumes, and compression.
2. **Authentication** — create a user with sudo privileges and configure passwords.
