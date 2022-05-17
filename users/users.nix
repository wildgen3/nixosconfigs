{ nixpkgs, ... }:

{
	imports = [
		./grayson.nix
		./rome.nix
	];

	security.sudo.wheelNeedsPassword = false;	
	users.extraUsers.backdoor = {
        	isNormalUser = true;
        	uid = 1003;
        	home = "/home/backdoor";
        };
}
