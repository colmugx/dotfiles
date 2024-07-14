{
  description = "Darwin system flake";

  nixConfig = {
    substituters = [
      # Query the mirror of USTC first, and then the official cache.
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "git+https://mirrors.ustc.edu.cn/homebrew-core.git";
      flake = false;
    };
    homebrew-cask = {
      url = "git+https://mirrors.ustc.edu.cn/homebrew-cask.git";
      flake = false;
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    darwin,
    home-manager,

    nix-homebrew,
    homebrew-core,
    homebrew-cask,
    homebrew-bundle,
    ...
  }:
  let
    username = "__USERNAME__";
    hostname = "__HOSTNAME__";
    system = "__SYSTEM__";
    specialArgs = inputs // {
      inherit username hostname system;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macos
    darwinConfigurations."macos" = darwin.lib.darwinSystem {
      inherit inputs system specialArgs;
      modules = [
        ./modules/configuration.nix

        # home manager
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.users.${username} = import ./homemanager;
        }

        # nix-homebrew
        nix-homebrew.darwinModules.nix-homebrew
        ./modules/homebrew.nix
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."macos".pkgs;
  };
}
