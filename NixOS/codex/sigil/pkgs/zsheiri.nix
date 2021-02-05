{ config, pkgs, lib, ... }:

{
  programs.zsh = {

    shellAliases = {
      eiri   = "vim $ZARC/.aliases";
      zshh   = "source $ZARC/.zshrc";
      mach   = "cd $NIXDIR && source machina";

      cfg  = "cd $CFG";
      dl   = "cd $DLO";

      grep = "grep --color=auto";
      ls   = "ls --color=auto --group-directories-first";
      lt   = "ls --human-readable --size -1 -S --classify";
      la   = "ls -A --color=auto --group-directories-first";

      burn  ="trash-put";
      smoke ="trash-list";
      heal  ="trash-restore";
      incinerate="trash-empty";

      vim  = "nvim";
      sv   = "sudo -E nvim";
      rm   = "rm --preserve-root";
      rmd  = "sudo rm -R";

      cl   = "clear";

      mv   = "mv -iv";
      cp   = "cp -iv";
      ln   = "ln -iv";
      df   = "df -h";
      du   = "du -hs * | sort -h";

      cpy  = "xclip";
      pst  = "xclip -o";
      cs   = "xclip -selection clipboard";
      vs   = "xclip -o -selection clipboard";
      q    = "exit";
      sudo = "sudo ";

      i    ="cd $NIXDIR && source machina";

      mtp-on  = "jmtpfs $HOME/Mount";
      mtp-off = "fusermount -u $HOME/Mount";
      juno    = "sudo jupyter-notebook --allow-root";

      bluetooth = "sudo rfkill unblock all && bluetoothctl";
      daijoubu  = "reboot";
      sayonara  = "shutdown -h now";
      fping     = "ping -c 10";
    };
  };
}

