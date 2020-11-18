# NMAP

This is documentation about using nmap as network scanning tools,
nmap is a powerful tool that you can get as penetration tester, in
Red or Blue team environment. This will help alot in your journey as
a penetration tester.

### [installation]

First, we need to install nmap, you can specify this in terminal
based on your distribution. Here's for kali linux and arch linux.

```
sudo apt-get install nmap
sudo pacman -S nmap
```
There are some settings that you can specify when you're doing scan
you can look each settings by typing `nmap -h` in the terminal.
I'll list some that can be used for this tutorial.

````
  -sn: Ping Scan - disable port scan
  -Pn: Treat all hosts as online -- skip host discovery
  -p : Only scan specified ports
  -sV: Probe open ports to determine service/version info [root]
  -O : Enable OS detection [root]
  -oX: Output scan in XML
	
EXAMPLES:
  nmap -v -A scanme.nmap.org
  nmap -v -sn 192.168.0.0/16 10.0.0.0/8
  nmap -v -iR 10000 -Pn -p 80
SEE THE MAN PAGE (https://nmap.org/book/man.html) FOR MORE OPTIONS AND EXAMPLES
````
    
### [scanning nmap]

You might want to scan by using root privileges, since some option
like `-sV -O` or `-A` might need escalated privileges to be used.
To access bash in root, you can type `sudo bash` to run `bash`
command as `sudo` user.

````
# nmap -A -T4 scanme.nmap.org
````
If you see in here, there's another option called `-T4`, this type
of scan is used for faster scanning, you can specify the speed
that you might want to use, generally `-T4` can be used in most
cases, but you can also use `-T1` [slow] until `-T5` [fast].

Also if you use `-A` it'll generally scan all ports with extended
options, so you don't have to write a long lines of code just
to scan all services within targets IP, just specify `-A` and
you're good to go.

````
Starting Nmap 7.80 ( https://nmap.org ) at yyyy-mm-dd hh:mm WIB
Nmap scan report for scanme.nmap.org (45.33.32.156)
Host is up (0.12s latency).
Other addresses for scanme.nmap.org (not scanned): 2600:3c01::f03c:91ff:fe18:bb2f
Not shown: 994 closed ports
PORT      STATE    SERVICE    VERSION
22/tcp    open     ssh        OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.13 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   1024 ac:00:a0:1a:82:ff:cc:55:99:dc:67:2b:34:97:6b:75 (DSA)
|   2048 20:3d:2d:44:62:2a:b0:5a:9d:b5:b3:05:14:c2:a6:b2 (RSA)
|   256 96:02:bb:5e:57:54:1c:4e:45:2f:56:4c:4a:24:b2:57 (ECDSA)
|_  256 33:fa:91:0f:e0:e1:7b:1f:6d:05:a2:b0:f1:54:41:56 (ED25519)
25/tcp    filtered smtp
53/tcp    open     domain     (generic dns response: NOTIMP)
80/tcp    open     http       Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Go ahead and ScanMe!
9929/tcp  open     nping-echo Nping echo
31337/tcp open     tcpwrapped
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port53-TCP:V=7.80%I=7%D=11/19%Time=5FB55C55%P=x86_64-unknown-linux-gnu%
SF:r(DNSStatusRequestTCP,E,"\0\x0c\0\0\x90\x04\0\0\0\0\0\0\0\0");
Aggressive OS guesses: HP P2000 G3 NAS device (93%), Linux 2.6.32 (92%), OpenWrt 12.09-rc1 Attitude Adjustment (Linux 3.3 - 3.7) (92%), Infomir MAG-250 set-top box (92%), Ubiquiti AirMax NanoStation WAP (Linux 2.6.32) (92%), Linux 3.7 (92%), Netgear RAIDiator 4.2.21 (Linux 2.6.37) (92%), Linux 2.6.32 - 3.13 (92%), Linux 3.3 (92%), Linux 3.13 or 4.2 (91%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 5 hops
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

TRACEROUTE (using port 80/tcp)
HOP RTT     ADDRESS
1   ...
2   6.00 ms 125.166.120.1
3   5.09 ms 180.252.0.153
4   ...
5   9.84 ms scanme.nmap.org (45.33.32.156)

OS and Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 55.04 seconds
 
````

On the other hand, if you want to scan one port, you can specify it
by using `-p 22`, this commmand will scan if `ssh` port is open or closed.

Also some other command that you might want to look at, is `--script`,
this option can be used to check target IP, if it's vulnerable to a
script or not.

```
nmap -sV --script vulners [--script-args mincvss=<arg_val>] <target>
```

One other thing that you might want to try is using all this script
inside an automation python script and combine the data with pandas,
this way, you can see open ports in different point of view.

```
usage:
python3 recon.py [ip_address]
```

This way, you can use nmap automation by using `ip_address` as args.
As of now, it's only capable of showing data in csv, so you might
want to see csv files related to the `ip_address` that you've input,
but you can also use Jupyter or Google Colab to see the output in
Python Notebook form.
