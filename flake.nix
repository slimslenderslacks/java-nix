# use mavenBuild https://ryantm.github.io/nixpkgs/languages-frameworks/maven/
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    platform-engineering.url = "github:slimslenderslacks/nix-modules";
    #platform-engineering.url = "/Users/slim/slimslenderslacks/nix-modules";
  };

  outputs = { nixpkgs, ... }@inputs:
    inputs.platform-engineering.java-project
      {
        inherit nixpkgs;
        dir = ./.;
        main-class = "org.deeplearning4j.examples.sample.LeNetMNIST";

        # maven deps have a small number of platform deps
        project-info-map = system: builtins.getAttr system {
          "x86_64-linux" = ./project-info.linux-amd64.json;
          "aarch64-linux" = ./project-info.linux-arm64.json;
          "aarch64-darwin" = ./project-info.macosx-arm64.json;
        };
      };
}
