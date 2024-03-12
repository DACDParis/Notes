in your home directory

Generate keys
```
ssh-keygen -t ed25519   #  add -C "comment_you_want_inside" ...if you want
```

Send generated public key to the server
```
ssh-copy-id -i ~/.ssh/created_file.pub user_name_on_server@ip_adress_of_server
```

Check ssh-agent
```
eval "$(ssh-agent)" or eval 'ssh-agent -s'
ps aux | grep ssh-agent
```

Store key in ssh-agent
```
ssh-add ~/.ssh/created_file    # This time the private one
```

Enable or restart the sshd service - Ubuntu & Debian is ssh not sshd
```
sudo systemctl enable sshd
```
or
```
sudo systemctl restart sshd
```

 Making a backup of the default file
```
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original
sudo chmod a-w /etc/ssh/sshd_config.original
```

Edit /etc/ssh/sshd_config
```
sudo nano /etc/ssh/sshd_config
```

Find and uncomment or add if it doesn't exists
```
Port 2223  # put the number you want, if you want to chage it or just leave the 22 by default
PasswordAuthetication no
ChallengeResponseAuthentication no
PermitRootLogin no  # do it AFTER all configs to better protection
```

Restart and check the ssh service Ubuntu & Debian is ssh not sshd
```
sudo systemctl restart sshd
sudo systemctl status sshd
```

create a config file to make logins easier 
```
touch ~/.ssh/config
nano ~/.ssh/config
```

add:
```
Host name_of_the_server
Hostname ip_adress_of_server
Port 22 #or the other if you had it changed
User name_of_user_you_want_to_connect
```

if you want to add more than one server just continue to add the same kinf of commands on the same file
```
Host name_of_the_second_server
Hostname ip_adress_of_second_server
Port 22 #or the other if you had it changed
User name_of_user_you_want_to_connect
```

to check logs
```
journalctl -fu sshd  #Ubuntu & Debian is ssh not sshd
```
