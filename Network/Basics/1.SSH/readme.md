# Secure Shell [SSH]
How to use ssh to go in and out from server.

#### Installation
------------------------------------------------------------
Checking update and upgrade on your device and install
ssh and ufw for basic firewall rules to allow ssh.
````
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get install openssh-server ufw
````

#### configure firewall [ufw]
------------------------------------------------------------
We need to configure ufw to allow access of ssh and change
the port in which ssh is allowed.

[ufw default policies]
````
sudo ufw default deny incoming
sudo ufw default allow outgoing
````

Before we set rules for allowing ssh into ufw, we can
make some changes on the `sshd_config` in
`/etc/ssh/sshd_config/`, in here we change port in which
ssh will be allowed by changing `Port 22` in default config
into `Port 2222`.
````
[sshd_config]
...
Port 2222
...
````

[ufw allow ssh or custom port]
````
sudo ufw allow ssh
sudo ufw allow 2222
````

After we make some rules for ssh to accept connection,
then enable ufw with `ufw enable` and check ufw by typing
`ufw status`.
````
sudo ufw enable
sudo ufw status
````
#### enabling service
------------------------------------------------------------
After setting up ufw and sshd_config, then we can enable
ssh service.

````
sudo systemctl enable ssh
sudo systemctl start ssh
````

#### rsa_id
------------------------------------------------------------
To generate a key that can be used for public service or
login into ssh, you can use `ssh-keygen` to generate that key.

````
ssh-keygen
Enter file in which to save the key (/Users/yourname/.ssh/id_rsa): [press enter here]
Enter passphrase (empty for no passphrase): [enter passphrase]
Enter same passphrase again: [enter passphrase]
Your identification has been saved in /Users/yourname/.ssh/id_rsa.
Your public key has been saved in /Users/yourname/.ssh/id_rsa.pub.
The key fingerprint is:
ra:nd:om:00:al:ph:an:um:er:ic:00:in:00:he:re:00 user@hostname
The key's randomart image is: [random image will be generated]
+--[ RSA 2048]----+
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
|                 |
+-----------------+
````
