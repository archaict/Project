# Containers

## Introduction

Arch Linux can be spawned in NixOS by using this nix-expressions
and `systemd-nspawn`, append this in your `configuration.nix`.

```{nix}
  systemd.targets.machines.enable = true;
  systemd.nspawn."archlinux" = {
    enable = true;
    execConfig = {
      Boot = true;
    };
    networkConfig.VirtualEthernet = false; # disable network v-eth
  };
  systemd.services."systemd-nspawn@archlinux" = {
    enable = true;
    wantedBy = [ "machines.target" ];
  };
```

This will then spawn ArchLinux container inside your NixOS machine,
to run this, you can run `$ machinectl login archlinux`.

## Mirrorlist

Backup your Arch mirrorlist with `mv mirrorlist mirorrlist.bak`,
this way, you can access your mirrorlist backup if something goes
wrong (which probably will if you don't backup).

```{shell}
cat << 'EOF' > mirrorlist

##
## Arch Linux repository mirrorlist
## Filtered by mirror score from mirror status page
## Generated on YYYY-MM-DD
##

##Indonesia
Server = http://mirror.gi.co.id/archlinux/$repo/os/$arch
Server = https://mirror.gi.co.id/archlinux/$repo/os/$arch
Server = http://vpsmurah.jagoanhosting.com/archlinux/$repo/os/$arch
Server = https://vpsmurah.jagoanhosting.com/archlinux/$repo/os/$arch
Server = http://mirror.labkom.id/archlinux/$repo/os/$arch
Server = http://mirror.papua.go.id/archlinux/$repo/os/$arch
Server = https://mirror.papua.go.id/archlinux/$repo/os/$arch
Server = http://mirror.poliwangi.ac.id/archlinux/$repo/os/$arch
Server = http://suro.ubaya.ac.id/archlinux/$repo/os/$arch
Server = http://mirror.telkomuniversity.ac.id/archlinux/$repo/os/$arch
Server = https://mirror.telkomuniversity.ac.id/archlinux/$repo/os/$arch
```

Just in case ArchLinux doesn't play nice with your keys:

```
# pacman -S archlinux-keyring
# pacman-key --refresh-keys
```


## AUR (yay)

Add user and add to sudo group
```{shell}
# pacman -S sudo archlinux-keyring
# groupadd sudo
# vim /etc/sudoers

[sudoers]
user_name ALL=(ALL)  ALL

# useradd -m user_name
```

and then login as your new user with `su user_name`.

```{shell}
$ pacman -S vim git glibc base-devel
$ cd /opt
$ git clone https://aur.archlinux.org/yay-git.git
$ chown -R user:user ./yay-git
$ cd yay-git
$ makepkg -si
```
