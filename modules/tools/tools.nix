{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
	wget
	git
	curl
	vim
	pnpm
	zip
	unzip
	bat
	tree
	tealdeer
	ripgrep
    ];
}
