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

After installation, reboot and log in to your user account.

#### 1. Generate an SSH key

```bash
ssh-keygen -t ed25519
```

Display your public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Add the public key to [GitHub SSH keys](https://github.com/settings/ssh/new).

Verify the connection:

```bash
ssh -T git@github.com
```

#### 2. Create XDG user directories

```bash
xdg-user-dirs-update
```

#### 3. Clone the repository

```bash
cd ~/Documents/dev/os
git clone git@github.com:PetyaBiszeps/arch.config.git
```

#### 3. Initialize the environment

```bash
cd ~/Documents/dev/os/arch.config
bash init.sh
```
