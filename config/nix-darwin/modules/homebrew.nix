{ username, inputs, ... }:
let
  inherit (inputs) homebrew-core homebrew-cask;
in
{
  nix-homebrew = {
    enable = true;
    user = "${username}";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };
    mutableTaps = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = [];
    brews = [];

    casks = [
      "iina"
      "devtoys"
      "wezterm"
      "raycast"
      "squirrel"
      "spotify"
      "visual-studio-code"
    ];
  };
}