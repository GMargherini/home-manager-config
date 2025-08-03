{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set fish_greeting 
			starship preset gruvbox-rainbow -o ~/.config/starship.toml
			starship init fish | source
		'';
	};
}
