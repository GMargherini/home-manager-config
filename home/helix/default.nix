{
  programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        indent-guides.render = true;
      };
    };
    languages = {
      language-server.typescript-language-server = {
        command = "rust-analyzer";
      };
      language = [{
        name = "rust";
        auto-format = true;
        formatter.command = "cargo fmt";
      }];
    };
  };
}
