# Change the shell of User and/or root

To change the shell in Linux, you can follow these steps:

It's important to note that changing the shell for an account can have implications on scripts or configurations that rely on specific features or syntax of a particular shell. Make sure you are familiar with the new shell and its compatibility with existing software before making any changes.

1. Open a terminal and log in as the root user or a user with administrative privileges.

2. Check the available shells on your system by running the following command:
   ```
   cat /etc/shells
   ```

3. Choose a shell from the list and make note of its path (e.g., `/usr/local/bin/bash`).

4. To change the shell for a specific user, use the `chsh` command followed by the username and desired shell path. For example, to change the shell for the user "john" to Bash:
   ```
   chsh -s /usr/local/bin/bash john
   ```

5. If you want to change your own shell, simply run `chsh` without any arguments (or with your username) and follow the prompts to select a new shell.

6. After changing the shell, you may need to log out and log back in for the changes to take effect.

... another way that you can do it its by editing the /etc/passwd file and change the paths on the user name line. You can do the same to change the root shell too.
 
```
root:xxxxxx:UID:GID:User Info:Home Directory:/the/path/of/the/shell
```

or / and :

```
username:xxxxxx:UID:GID:User Info:Home Directory:/the/path/of/the/shell
```
Remember, when editing critical system files like `/etc/passwd`, exercise caution as incorrect modifications can lead to system instability or lockouts from user accounts.