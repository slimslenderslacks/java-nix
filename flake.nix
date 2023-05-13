{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    mavenix.url = "github:nix-community/mavenix";
  };

  outputs = { nixpkgs, flake-utils, mavenix, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {inherit system;};
	maven = with pkgs; (buildMaven ./project-info.json);
	cli = import mavenix; 
      in
      rec {
        packages.repo = maven.repo;
	packages.build = maven.build;
        packages.create-project-info = pkgs.writeShellScriptBin "app" ''
          ${pkgs.maven}/bin/mvn org.nixos.mvn2nix:mvn2nix-maven-plugin:mvn2nix 
        '';

        devShells.default = pkgs.mkShell
          {
            packages = [
              pkgs.maven
            ];
          };
      });
}
