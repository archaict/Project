{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell rec {
  name = "pythond-dev";
  venvDir = "./.venv";
  buildInputs = [
    pkgs.python38Full
    pkgs.python38Packages.venvShellHook
  ];

  propagatedBuildInputs = [
    pkgs.pythonManylinuxPackages.manylinux2014Package
  # pkgs.python38Packages.tkinter
  ];

  # Add .so to the linker path
  LD_LIBRARY_PATH = "/run/opengl-driver/lib:${
    pkgs.pythonManylinuxPackages.manylinux2014Package
  }/lib";

  postShellHook = ''
    pip install -r requirements.txt
  '';
}
