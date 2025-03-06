#!/bin/bash

# Install Fluxbox and dependencies
sudo xbps-install -S fluxbox

# Create Fluxbox configuration directory
mkdir -p ~/.fluxbox

# Create Fluxbox init file
cat << EOF > ~/.fluxbox/init
session.menuFile: ~/.fluxbox/menu
session.styleFile: /usr/share/fluxbox/styles/Emerge
session.keyFile: ~/.fluxbox/keys
session.autoRaise: true
session.doubleClickInterval: 250
EOF

# Create Fluxbox menu file
cat << EOF > ~/.fluxbox/menu
[begin] (Fluxbox)
    [exec] (Terminal) {xterm}
    [exec] (Web Browser) {firefox}
    [exec] (File Manager) {thunar}
    [separator]
    [config] (Configure)
    [restart] (Restart)
    [exit] (Exit)
[end]
EOF

# Set Fluxbox as the default desktop environment
sudo sed -i 's/DEFAULTDE=.*/DEFAULTDE=fluxbox/' /etc/default/void-desktop

echo "Fluxbox has been installed and configured."
echo "Please reboot your system to apply the changes."
