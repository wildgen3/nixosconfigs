{ nixpkgs, ... }:

{
	
	users.extraUsers.rome = {
	        isNormalUser = true;
	        uid = 1002;
	        home = "/home/rome";
	        extraGroups = ["wheel"];
	};
}
