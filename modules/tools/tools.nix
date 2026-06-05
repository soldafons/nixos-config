{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
	    wget
	    curl
	    vim
	    zip
	    unzip
	    bat
	    ripgrep
    ];
}
