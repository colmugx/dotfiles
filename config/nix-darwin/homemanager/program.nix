{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    jq
  ];

  programs = {
    fish = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}