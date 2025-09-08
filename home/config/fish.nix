{
	programs.fish = {
		enable = true;
		interactiveShellInit = ''
			set fish_greeting 

      alias mpv_cam "mpv av://v4l2:/dev/video0"
		'';
	};
}
