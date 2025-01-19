{pkgs, ...}:
{
    environment.systemPackages = with pkgs;
	[
        # code stuff
        nodejs
        python3
        gnumake
        p7zip
        zip
        unzip
        gcc

	godot_4

	# terminal
	fish
	starship
	zoxide
	];
}
