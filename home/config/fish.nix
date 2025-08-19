{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set fish_greeting 
			starship preset nerd-font-symbols -o ~/.config/starship.toml
			starship init fish | source
		'';
	};
}
