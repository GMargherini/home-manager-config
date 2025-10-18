{ config, lib, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      mini-nvim
      surround
      rustaceanvim
    ]; 
  extraLuaConfig = /* lua */ ''
      require("config.lazy")
      require("nvim-surround")
      require("rustaceanvim")

      vim.o.termguicolors  = true
    '';
  };
}
