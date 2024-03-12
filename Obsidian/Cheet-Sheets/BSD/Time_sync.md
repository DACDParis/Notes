
If you are getting warning  messages at the login you can check if the following commands  are set in your config files.

Go  (https://www.ntppool.org/) and chose your location by pressing on the continent name at the Active Servers List and  another page will open. Scroll down and chose the country.
Copy the servers list and replace the older pools links in the ntp.conf file.

as root:
```
vim /etc/ntp.conf
```

and:
```
vim /etc/rc.conf 
```
change or add:
```
ntpd_enable="YES"
ntpd_sync_on_start="YES"
```
