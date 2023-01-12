# RaspberryPi

Install Raspberry Pi Imager, and flash 64-bit Raspberry Pi OS with Desktop to microsd card.

## Essentials

```sh
sudo apt update && sudo apt upgrade -y
sudo apt autoremove -y

sudo raspi-config
# Enable SSH
# Enable VNC
# Change hostname to `pi`
```

```sh
sudo apt install neovim tmux -y
```

#### Avahi mDNC
1. Ensure avahi-daemon is running with `sudo service avahi-daemon status` (should be by default)
2. You can now `ssh pi.local`

#### SSH
1. `ssh-copy-id` over SSH pub key
2. `sudo service ssh reload` on pi
3. Set `PasswordAuthentication no` in `/etc/ssh/sshd_config`
4. Do ``eval `ssh-agent` && ssh-add`` and `ssh pi.local` for fast login

#### VNC
Once enabled, login with regular username and password combination

## ZeroTier
```sh
curl -s https://install.zerotier.com | sudo bash
sudo zerotier-cli join [network]
# accept on my.zerotier.com
sudo zerotier-cli listnetworks
```

### ZeroTier VPN Router
```sh
sudo zerotier-cli join [vpn network]
# accept on my.zerotier.com
# managed route 1: 0.0.0.0/0 via [raspberry pi assigned zerotier ip]
# managed route 2: [zerotier network range] via (LAN)
sudo zerotier-cli listnetworks

# Enable and persist ipv4 forwarding
sudo vim /etc/sysctl.conf # uncomment #net.ipv4.ip_forward=1
sudo sysctl -p /etc/sysctl.conf

# iptables masquerading or snat (had some issues)
sudo iptables -t nat -A POSTROUTING -s [zerotier network range] -o eth0 -j MASQUERADE

# Persist iptables rule
sudo apt install iptables-persistent -y # yes to ipv4, no to ipv6
cat /etc/iptables/rules.v4 # check if rules are saved here, if not, run: sudo iptables-save > /etc/iptables/rules.v4
```


## Node
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Reopen terminal, or run the following:
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install --lts
```