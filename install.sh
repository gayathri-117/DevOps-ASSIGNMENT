#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as errors

echo "=== Updating system packages ==="
sudo apt-get update -y

echo "=== Installing prerequisites for Docker ==="
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https \
    software-properties-common

echo "=== Adding Docker's official GPG key ==="
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "=== Adding Docker repository ==="
DOCKER_REPO="deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "$DOCKER_REPO" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "=== Installing Docker Engine ==="
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "=== Docker installed ==="

echo "=== Installing kubectl ==="
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
echo "=== kubectl installed ==="

echo "=== Installing htop ==="
sudo apt-get install -y htop
echo "=== htop installed ==="

echo " Setup complete!"

echo "=== Creating user: devops-intern ==="
sudo adduser --disabled-password --gecos "" devops-intern || echo "User already exists"

echo "=== Adding devops-intern to sudo group ==="
sudo usermod -aG sudo devops-intern

echo "=== Giving passwordless sudo to devops-intern ==="
echo "devops-intern ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/devops-intern > /dev/null
sudo chmod 0440 /etc/sudoers.d/devops-intern

echo "=== Installing UFW ==="
sudo apt-get install -y ufw

echo "=== Resetting UFW to default settings ==="
sudo ufw --force reset

echo "=== Setting default policies: deny incoming, allow outgoing ==="
sudo ufw default deny incoming
sudo ufw default allow outgoing

echo "=== Allowing SSH (22), HTTP (80), and HTTPS (443) ==="
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

echo "=== Enabling UFW ==="
sudo ufw --force enable

echo "✅ UFW configured and active. Only ports 22, 80, and 443 are allowed."
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root!" >&2
  exit 1
fi

# Add a cron job to clean /tmp every 6 hours
echo "Adding cron job to clean /tmp every 6 hours..."

# Create the cron job entry
CRON_JOB="0 */6 * * * /bin/rm -rf /tmp/*"

# Add the cron job to the root user's crontab
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

# Verify if the cron job was added
echo "Cron job added successfully:"
crontab -l | grep "/bin/rm -rf /tmp/*"

echo "=== Cron job setup complete ==="
o "This script must be run as root!" >&2
  exit 1
fi




# Add a cron job to clean /tmp every 6 hours
echo "Adding cron job to clean /tmp every 6 hours..."




# Create the cron job entry
CRON_JOB="0 */6 * * * /bin/rm -rf /tmp/*"




# Add the cron job to the root user's crontab
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -




# Verify if the cron job was added
echo "Cron job added successfully:"
crontab -l | grep "/bin/rm -rf /tmp/*"




echo "=== Cron job setup complete ==o "This script must be run as root!" >&2
  exit 1
fi




# Add a cron job to clean /tmp every 6 hours
echo "Adding cron job to clean /tmp every 6 hours..."




# Create the cron job entry
CRON_JOB="0 */6 * * * /bin/rm -rf /tmp/*"




# Add the cron job to the root user's crontab
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -




# Verify if the cron job was added
echo "Cron job added successfully:"
crontab -l | grep "/bin/rm -rf /tmp/*"




echo "=== Cron job setup complete ==="::w"
