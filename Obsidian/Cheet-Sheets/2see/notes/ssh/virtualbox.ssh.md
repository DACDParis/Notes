install ssh server
sudo status ssh        # check if not sshd instead
sudo systemctl enable ssh --now
sudo systemctl status ssh
sudo lsof -i -P -n | grep LISTEN
### if issues check firewall port 22 state

# VirtualBox network settings
NAT connection
# go advanced options
Name: ssh
Protocol: TCP
Host Port: 2222
Guest Port: 22

### VirtualBox Client
install openssh client 

### Connect to VirtualBox address
ssh -p 2222 user@localhost

#########################   Bridged Adapter connection   #############################

### find VirtualBox IP address
ip a

add Port Forwarding in the router config

use strong password and ssh authentification
disallow root access over SSH
do not use port 22
disallow nummerous SSH login attempts



ssh user@the.ip.of.the.vm

# good tuto at:

https://averagelinuxuser.com/how-to-install-and-use-ssh-on-linux/

https://averagelinuxuser.com/how-to-use-public-key-authentication/
