## Installation

Boot from Arch Linux ISO, connect to the internet, and run:

```bash
archinstall --config-url https://raw.githubusercontent.com/PetyaBiszeps/arch.config/main/config/archinstall.json
```

The configuration preselects system settings, packages, and services.

Before starting the installation, manually configure:

1. **Disk configuration** — select the target SSD, Btrfs filesystem, default subvolumes, and compression.
2. **Authentication** — create a user with sudo privileges and configure passwords.

## Post-installation

Run the bootstrap script:

```bash
curl -fsSL https://raw.githubusercontent.com/PetyaBiszeps/arch.config/main/bootstrap.sh | bash
```

The script automatically clones or updates the repository at ~/Documents/dev/os/arch.config and initializes the environment:

1. Creates XDG user directories and generates an SSH key if needed.
2. Installs the AUR helper and required packages.
3. Updates Git submodules.
4. Links configuration files.
5. Reboots the system.

> **Note:** The setup replaces managed configuration paths with symlinks and automatically reboots after successful completion.
