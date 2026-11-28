#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux
rpm --import https://repo.cider.sh/RPM-GPG-KEY

cat > /etc/yum.repos.d/cider.repo << 'EOF'
[cidercollective]
name=Cider Collective Repository
baseurl=https://repo.cider.sh/rpm/RPMS
enabled=1
gpgcheck=1
gpgkey=https://repo.cider.sh/RPM-GPG-KEY
EOF

dnf5 install -y Cider

sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/cider.repo

curl -fsSL https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-folders/master/install.sh | sh
papirus-folders -C palebrown --theme Papirus-Dark

dnf5 install -y cava
dnf5 install -y java-latest-openjdk
dnf5 install -y deja-dup
# Use a COPR Example:
#
dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
dnf5 -y copr enable infinality/kwin-effects-better-blur-dx
dnf5 -y install kwin-effects-better-blur-dx
dnf5 -y copr enable deltacopy/darkly
dnf5 -y install darkly
dnf5 -y copr enable errornointernet/klassy
dnf5 -y install klassy
# Disable COPRs so they don't end up enabled on the final image:
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable infinality/kwin-effects-better-blur-dx
dnf5 -y copr disable deltacopy/darkly
dnf5 -y copr disable errornointernet/klassy

dnf5 install -y git

tmp=$(mktemp -d)
git clone --depth 1 https://github.com/badams700/Orchis-kde "$tmp/Orchis-kde"
(cd "$tmp/Orchis-kde" && ./install.sh)
rm -rf "$tmp"

rpm --import https://downloads.1password.com/linux/keys/1password.asc
sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://downloads.1password.com/linux/keys/1password.asc" > /etc/yum.repos.d/1password.repo'
dnf5 install -y 1password
#### Example for enabling a System Unit File

systemctl enable podman.socket
