{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    jq

    neovim
  ];

  programs = {
    # modern vim
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
}