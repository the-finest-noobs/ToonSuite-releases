{
  description = "Tunetoon — multi-toon launcher for Toontown Rewritten and Corporate Clash";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      version = "0.0.0"; # bump on release

      appimage = pkgs.fetchurl {
        url = "https://github.com/kittkittlou/ToonSuite-releases/releases/download/v${version}/Tunetoon-Linux.AppImage";
        hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # fill in after first release
      };

      tunetoonBin = pkgs.runCommand "tunetoon-bin" {
        nativeBuildInputs = [ pkgs.squashfsTools ];
      } ''
        unsquashfs -d squashfs ${appimage}
        mkdir -p $out/bin
        cp squashfs/usr/bin/Tunetoon $out/bin/Tunetoon
        chmod +x $out/bin/Tunetoon
      '';

      fhs = pkgs.buildFHSEnv {
        name = "tunetoon";
        targetPkgs = _: [
          pkgs.dotnet-runtime_10
          pkgs.fontconfig
          pkgs.libGL
          pkgs.icu
          pkgs.xorg.libX11
          pkgs.xorg.libXext
          pkgs.xorg.libXrandr
          pkgs.xorg.libXi
          pkgs.xorg.libXcursor
          pkgs.xorg.libICE
          pkgs.xorg.libSM
          pkgs.xorg.libXcomposite
          pkgs.xorg.libXdamage
          pkgs.xorg.libXfixes
          pkgs.xorg.libXrender
          pkgs.xorg.libXtst
          pkgs.libxkbcommon
          pkgs.dbus
          pkgs.pulseaudio
          pkgs.alsa-lib
          pkgs.winetricks
          pkgs.cabextract
        ];
        runScript = "${tunetoonBin}/bin/Tunetoon";
        extraInstallCommands = ''
          mkdir -p $out/share/applications
          cat > $out/share/applications/tunetoon.desktop <<EOF
[Desktop Entry]
Name=Tunetoon
Comment=Multi-toon launcher for Toontown Rewritten and Corporate Clash
Exec=tunetoon
Icon=tunetoon
Terminal=false
Type=Application
Categories=Game;
EOF
        '';
      };
    in
    {
      packages.${system}.default = fhs;

      apps.${system}.default = {
        type = "app";
        program = "${fhs}/bin/tunetoon";
      };
    };
}
