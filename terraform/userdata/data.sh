#!/bin/bash

useradd -m web -s /bin/bash
cp -Rp /root/.ssh /home/web/ && chown -R web:web /home/web/
echo "web ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/web

# Configure ssh to non standart post
cat > /etc/ssh/sshd_config.d/sshd.conf << EOF
Port 22
PermitRootLogin no
PasswordAuthentication no
EOF

systemctl restart ssh.service

# Ugrade
apt-get update && apt-get upgrade -y

# Install additions sofrware 
apt-get install ca-certificates curl apt-transport-https htop gnupg software-properties-common git -y

apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
usermod -aG docker web

cd /home/web && git clone https://github.com/oleksandr-mazur/web_app.git src
mkdir traefik && touch traefik/acme.json && chmod 600 traefik/acme.json
mv src/docker-compose.yaml .
rm -r src
docker compose up -d