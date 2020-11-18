# Metasploitable2
This is an overview for metasploitable 2 vulnerability lists
#### HOST//192.168.56.101//Metasploitable2
Scanning all open ports using nmap, it'll be used  for vulnerability checking.

**NMAP SCAN**
````
$ sudo nmap -O -sV -T4 192.168.56.101
````


| PORT    | NAME          | PRODUCT // VERSION                     | EXTRAINFO                              | CPE                                       |
| ------- | ------------- | -------------------------------------- | -------------------------------------- | ----------------------------------------- |
| 21      | ftp           | vsftpd 2.3.4                           |                                        | cpe:/a:vsftpd:vsftpd:2.3.4                |
| 22      | ssh           | OpenSSH 4.7p1 Debian 8ubuntu1          | protocol 2.0                           | cpe:/o:linux:linux_kernel                 |
| 23      | telnet        | Linux telnetd                          |                                        | cpe:/o:linux:linux_kernel                 |
| 25      | smtp          | Postfix smtpd                          |                                        | cpe:/a:postfix:postfix                    |
| 53      | domain        | ISC BIND 9.4.2                         |                                        | cpe:/a:isc:bind:9.4.2                     |
| 80      | http          | Apache httpd 2.2.8                     | (Ubuntu) DAV/2                         | cpe:/a:apache:http_server:2.2.8           |
| 111     | rpcbind       | 2                                      | RPC #100000                            |                                           |
| 139     | netbios-ssn   | Samba smbd 3.X - 4.X                   | workgroup: WORKGROUP                   | cpe:/a:samba:samba                        |
| 445     | netbios-ssn   | Samba smbd 3.X - 4.X                   | workgroup: WORKGROUP                   | cpe:/a:samba:samba                        |
| 512     | exec          | netkit-rsh rexecd                      |                                        | cpe:/o:linux:linux_kernel                 |
| 513     | login         |                                        |                                        |                                           |
| 514     | shell         | Netkit rshd                            |                                        | cpe:/a:netkit:netkit_rsh                  |
| 1099    | java-rmi      | GNU Classpath grmiregistry             |                                        |                                           |
| 1524    | bindshell     | Metasploitable root shell              |                                        |                                           |
| 2049    | nfs           | 2-4                                    | RPC #100003                            |                                           |
| 2121    | ftp           | ProFTPD 1.3.1                          |                                        | cpe:/a:proftpd:proftpd:1.3.1              |
| 3306    | mysql         | MySQL 5.0.51a-3ubuntu5                 |                                        | cpe:/a:mysql:mysql:5.0.51a-3ubuntu5       |
| 3632    | distccd       | distccd v1                             | (GNU) 4.2.4 (Ubuntu 4.2.4-1ubuntu4)    |                                           |
| 5432    | postgresql    | PostgreSQL DB 8.3.0 - 8.3.7            |                                        | cpe:/a:postgresql:postgresql:8.3          |
| 5900    | vnc           | VNC                                    | protocol 3.3                           |                                           |
| 6000    | X11           |                                        | access denied                          |                                           |
| 6697    | irc           | UnrealIRCd                             |                                        | cpe:/a:unrealircd:unrealircd              |
| 8009    | ajp13         | Apache Jserv                           | Protocol v1.3                          |                                           |
| 8180    | http          | Apache Tomcat/Coyote JSP engine 1.1    |                                        | cpe:/a:apache:coyote_http_connector:1.1   |
| 8787    | drb           | Ruby DRb RMI                           | Ruby 1.8; path /usr/lib/ruby/1.8/drb   | cpe:/a:ruby-lang:ruby:1.8                 |
| 33206   | nlockmgr      | 1-4                                    | RPC #100021                            |                                           |
| 40304   | mountd        | 1-3                                    | RPC #100005                            |                                           |
| 57133   | status        | 1                                      | RPC #100024                            |                                           |
| 57741   | java-rmi      | GNU Classpath grmiregistry             |                                        |                                           |


### EXPLOITABLE
###### Tested // Arch Linux // Manjaro

- [B] Backdoor
- [?] Missing
- [v] Checked
- [!] Errors

````
[B] 21    | vsftpd 2.3.4                        | cpe:/a:vsftpd:vsftpd:2.3.4
[B] 22    | OpenSSH 4.7p1 Debian 8ubuntu1       | cpe:/o:linux:linux_kernel
[B] 23    | Linux telnetd                       | cpe:/o:linux:linux_kernel
[ ] 25    | Postfix smtpd                       | cpe:/a:postfix:postfix
[ ] 53    | ISC BIND 9.4.2                      | cpe:/a:isc:bind:9.4.2
[ ] 80    | Apache httpd 2.2.8                  | cpe:/a:apache:http_server:2.2.8
[B] 512   | netkit-rsh rexecd                   | cpe:/o:linux:linux_kernel
[B] 514   | Netkit rshd                         | cpe:/a:netkit:netkit_rsh
[ ] 2121  | ProFTPD 1.3.1                       | cpe:/a:proftpd:proftpd:1.3.1
[ ] 3306  | MySQL 5.0.51a-3ubuntu5              | cpe:/a:mysql:mysql:5.0.51a-3ubuntu5
[ ] 5432  | PostgreSQL DB 8.3.0 - 8.3.7         | cpe:/a:postgresql:postgresql:8.3
[ ] 8180  | Apache Tomcat/Coyote JSP engine 1.1 | cpe:/a:apache:coyote_http_connector:1.1
````
Can be exploited // no cpe information
````
[ ]  111   | rpcbind 2 
[ ]  111   | rpcbind 2
[B]  513   | login   
[ ]  1099  | java-rmi GNU Classpath grmiregistry
[ ]  1524  | bindshell Metasploitable root shell
[ ]  5900  | vnc 
[ ]  6000  | X11
[ ]  8009  | ajp13 Apache Jserv
[ ]  33206 | nlockmgr 1-4 
[ ]  40304 | mountd 1-3  
[ ]  57133 | status 1  
[ ]  57741 | java-rmi GNU Classpath grmiregistry 
````

###### Not Running // Arch Linux // Manjaro
````
[!]  139   | Samba smbd 3.X - 4.X                | cpe:/a:samba:samba
[!]  445   | Samba smbd 3.X - 4.X                | cpe:/a:samba:samba
[!]  2049  | nfs 2-4 
[!]  3632  | distccd distccd v1
[!]  6697  | UnrealIRCd | cpe:/a:unrealircd:unrealircd            

````
