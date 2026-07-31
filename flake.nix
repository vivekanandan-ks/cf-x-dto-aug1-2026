{
  description = "Nix Shells Workshop Presentation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { pkgs, lib, ... }: {
        apps = {
          default = {
            type = "app";
            program = lib.getExe (pkgs.writeShellApplication {
              name = "run-presentation";
              runtimeInputs = [ pkgs.presenterm ];
              text = ''
                presenterm -c ${./.}/presenterm.yaml ${./.}/presentation.md
              '';
            });
          };
          with-foot = {
            type = "app";
            program = lib.getExe (pkgs.writeShellApplication {
              name = "run-presentation-foot";
              runtimeInputs = [ pkgs.presenterm pkgs.foot ];
              text = ''
                foot presenterm -c ${./.}/presenterm.yaml ${./.}/presentation.md
              '';
            });
          };
          html = {
            type = "app";
            program = lib.getExe (pkgs.writeShellApplication {
              name = "build-html";
              runtimeInputs = [ pkgs.presenterm ];
              text = ''
                presenterm -c ${./.}/presenterm.yaml --export-html ${./.}/presentation.md
              '';
            });
          };
          pdf = {
            type = "app";
            program = lib.getExe (pkgs.writeShellApplication {
              name = "build-pdf";
              runtimeInputs = [ pkgs.presenterm pkgs.python314Packages.weasyprint ];
              text = ''
                presenterm -c ${./.}/presenterm.yaml --export-pdf ${./.}/presentation.md
              '';
            });
          };
        };
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.presenterm ];
        };
      };
    };
}
