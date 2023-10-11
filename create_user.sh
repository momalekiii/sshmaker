#!/bin/bash
# Script developed by Momalekiii

# ASCII art with "M  O"
echo -e "\e[1m\e[34m  MM    MM  OOO  \e[0m"
echo -e "\e[1m\e[34m M  M  M  M O   O \e[0m"
echo -e "\e[1m\e[34m M   MM   M O   O \e[0m"
echo -e "\e[1m\e[34m M        M O   O \e[0m"
echo -e "\e[1m\e[34m M        M  OOO  \e[0m"

# Function to set bandwidth limits for a user
set_bandwidth_limits() {
  local username=$1
  local download_limit=$2  # in kbps
  local upload_limit=$3    # in kbps

  # Limit download and upload speed for the user
  tc qdisc add dev eth0 handle 1: root htb default 11
  tc class add dev eth0 parent 1: classid 1:1 htb rate ${download_limit}kbit
  tc class add dev eth0 parent 1: classid 1:2 htb rate ${upload_limit}kbit
  tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip src ${username} flowid 1:1
  tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip dst ${username} flowid 1:2
}

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if enough arguments are provided
if [ $# -lt 5 ]; then
  echo "Usage: $0 <username> <expire_date> <download_limit_kbps> <upload_limit_kbps>"
  exit 1
fi

username=$1
expire_date=$2
download_limit=$3
upload_limit=$4

# Generate a random password
password=$(openssl rand -base64 12)

# Create the user with the generated password
useradd --create-home --shell /bin/bash --user-group --groups sshusers $username
echo -e "$password\n$password" | passwd $username

# Set the account expiration date
chage --expiredate $expire_date $username

# Create an SSH key pair for the user (optional)
ssh-keygen -t rsa -b 2048 -f "/home/$username/.ssh/id_rsa" -N ""

# Set bandwidth limits for the user
set_bandwidth_limits $username $download_limit $upload_limit

# Restrict SSH access for the user
echo "Match User $username" >> /etc/ssh/sshd_config
echo "    PasswordAuthentication yes" >> /etc/ssh/sshd_config
echo "    AllowTcpForwarding no" >> /etc/ssh/sshd_config
echo "    PermitRootLogin no" >> /etc/ssh/sshd_config
echo "    X11Forwarding no" >> /etc/ssh/sshd_config
echo "    AllowGroups sshusers" >> /etc/ssh/sshd_config

# Restart SSH service to apply changes
systemctl restart sshd

echo "User $username created with limited SSH access and password: $password"
echo "User $username will expire on: $expire_date"
echo "Bandwidth limits set for user $username: Download: ${download_limit} kbps, Upload: ${upload_limit} kbps"
