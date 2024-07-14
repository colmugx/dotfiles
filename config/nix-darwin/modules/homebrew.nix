{ lib, inputs, username, ... }:
let 
  homebrew_mirror_env = {
    HOMEBREW_BREW_GIT_REMOTE = "https://mirrors.ustc.edu.cn/brew.git";
    HOMEBREW_CORE_GIT_REMOTE = "https://mirrors.ustc.edu.cn/homebrew-core.git";
    HOMEBREW_BOTTLE_DOMAIN = "https://mirrors.ustc.edu.cn/homebrew-bottles";
    HOMEBREW_API_DOMAIN = "https://mirrors.ustc.edu.cn/homebrew-bottles/api";
  };
  inherit (inputs) homebrew-core homebrew-cask homebrew-bundle;
in
{
  environment.variables = homebrew_mirror_env;

  system.activationScripts.homebrew.text =
    let
      env_script = lib.attrsets.foldlAttrs (acc: name: value: acc + "\nexport ${name}=${value}") "" homebrew_mirror_env;
    in
    lib.mkBefore ''
      echo >&2 '${env_script}'
      ${env_script}
    '';

  nix-homebrew = {
    enable = true;
    user = "${username}";
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-bundle" = homebrew-bundle;
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
      "raycast"
      "sf-symbols"
      "squirrel"
      "wezterm"
      # "podman-desktop"
      "font-jetbrains-mono-nerd-font"
      # "visual-studio-code"
    ];
  };
}