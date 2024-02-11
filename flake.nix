{
  description = "A Rust project template using Nix.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = with inputs; [
        devenv.flakeModule
        treefmt-nix.flakeModule
      ];
      systems = [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devenv.shells.default = {
          name = "rusted";

          env = {
            RUST_BACKTRACE = "full";
            RUST_LIB_BACKTRACE = "full";
          };

          languages = {
            nix.enable = true;

            rust = {
              enable = true;
              channel = "nixpkgs";
            };
          };

          packages = with pkgs; [
            bacon
            just
          ] ++ [ config.treefmt.build.wrapper ];

          devcontainer = {
            enable = true;

            settings.customizations.vscode.extensions = [
              "mkhl.direnv"
              "pinage404.nix-extension-pack"
              "swellaby.rust-pack"
              "skellock.just"
            ];
          };
        };

        treefmt.config = {
          projectRootFile = "flake.nix";
          programs = {
            nixpkgs-fmt.enable = true;
            rustfmt.enable = true;
            prettier.enable = true;
          };
        };
      };
    };
}
