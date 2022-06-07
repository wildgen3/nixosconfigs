{
  description = "A very basic flake";

  inputs = { 
	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	
	};


  outputs = { self, nixpkgs }: {

	nixosConfigurations = {
		lab1 = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./systems/lab1/configuration.nix
				./modules/ssh-phone-home.nix
				./users/users.nix
			];
		};
		lab2 = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./systems/lab2/configuration.nix
				./modules/ssh-phone-home.nix
				./users/users.nix
			];
	};
		lab3 = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./systems/lab3/configuration.nix
				./modules/ssh-phone-home.nix
				./users/users.nix
	};
deploy = {
	
		nodes.lab1 = {

			hostname = "192.168.1.156";
			profiles.system = {
				user = "root":
				path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.lab1;
				};

		};
	};
	
};

}

