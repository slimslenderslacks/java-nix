# use mavenBuild https://ryantm.github.io/nixpkgs/languages-frameworks/maven/
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    platform-engineering.url = "github:slimslenderslacks/nix-modules";
  };

  outputs = { nixpkgs, ... }@inputs:
    inputs.platform-engineering.java-project
      {
        inherit nixpkgs;
        dir = ./.;
      };
}
