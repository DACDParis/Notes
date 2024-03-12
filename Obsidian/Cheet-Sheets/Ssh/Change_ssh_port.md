1. edit /etc/ssh/sshd_config file
2. uncomment = remove the # at the start of the line 

3. uncomment the port 22 line and replace the number by the one of your new port number. Here i will use 2222

4. Authorize it in SELinux
``` semanage 
   sudo semanage port -a -t ssh_port_t -p tcp 2222
   sudo semanage port -l | grep ssh_port_t  #to check 
```

5. add port permitions to the firewall
```
sudo firewall-cmd --permanent --service="ssh" --add-port "2222/tcp"
sudo firewall-cmd --reload
sudo systemctl reload sshd
```

6. remove the old port 22 rule
```
firewall-cmd --permanent --service="ssh" --remove-port "22/tcp"
firewall-cmd --reload
```

7. done.
