# Debootstrap on NixOS

To make a systemd-nspawn based container you can use this command,
this is used in NixOS, so you might want to install `debootstrap` first
before doing this. This will create a lightweight container with it's
own processes intact.

```{shell}
mkdir ~/machina/debian -p
sudo debootstrap --include=systemd-container --components=main,universe buster ~/machina/debian https://deb.debian.org/debian
```

```{shell}
[ ~/machina/debian/etc/securetty ]

pts/0
pts/1
pts/2
pts/3
pts/4
pts/5
pts/6
pts/7
pts/8
pts/9
```

```{shell}
$ sudo umount ./debian/proc
$ sudo systemd-nspawn -b -D ~/machina/debian
```

After that do this command for backspace fixes,
this will set the terminal to understand that command.

```{shell}
export TERM=vt100
```
