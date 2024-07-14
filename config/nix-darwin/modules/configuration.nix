{ self, pkgs, lib, username, hostname, ... }: {

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = lib.mkForce [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
    trusted-users = [ username ];
    builders-use-substitutes = true;
    auto-optimise-store = true;
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "x86_64-darwin";

  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 7d";
  };

  security.pam.enableSudoTouchIdAuth = true;

  networking = {
    hostName = hostname;
  };

  # user
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
  };
}