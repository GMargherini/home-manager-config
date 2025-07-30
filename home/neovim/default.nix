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
        plenary-nvim
        gruvbox-material
        mini-nvim
        surround
      ]; 
  extraLuaConfig = /* lua */ ''
    vim.o.termguicolors  = true
    vim.cmd('colorscheme gruvbox-material')
    vim.g.gruvbox_material_background = 'hard'
  '';
  };
}
