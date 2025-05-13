#!/bin/bash

# Installer for disable_keyboard service
# Ensure the compiled binary is in /usr/local/bin

echo "Before using this script, make sure you have compiled disable_keyboard.sh into a Linux binary and moved it to /usr/local/bin."
sleep 1
echo "To do this, run: sudo mv your_binary_file /usr/local/bin/"
sleep 1
echo "This installer sets up a systemd service that will run your disable_keyboard tool once after the graphical desktop starts, disabling your laptop's internal keyboard at each boot."
sleep 1

read -p "Do you wish to continue? [y/n]: " answer
if [[ $answer =~ ^[Yy]$ ]]; then
  echo "Continuing..."

  # Create the systemd unit file
  sudo tee /etc/systemd/system/disable_keyboard.service > /dev/null << 'EOF'
[Unit]
Description=Disable internal keyboard at startup
After=graphical.target

[Service]
Type=oneshot
Environment=DISPLAY=:0
Environment=XAUTHORITY=/home/$USER/.Xauthority
ExecStart=/usr/local/bin/disable_keyboard

[Install]
WantedBy=graphical.target
EOF

  # Reload systemd, enable and start the service
  sudo systemctl daemon-reload
  sudo systemctl enable disable_keyboard.service
  sudo systemctl start disable_keyboard.service

  echo "Installation complete. Service enabled at boot."
else
  echo "Aborting..."
  exit 1
fi

