{ pkgs }:

with pkgs;

mkDevShell {
  name = "Arkiv";
  motd = ''
    Welcome to ARKIV
  '';
  commands = [
    name = "chants";
    help = "chanting oratorio";
    command = "echo oratorio";
  ];

}
