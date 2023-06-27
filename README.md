## Notes

* this is a deeplearning4j project and uses quite a few jni libs (native)
* `nix run .#create-project-info` whenever pom.xml changes (or use the shell menu item `update-deps`)
    * locks maven dependencies and records them in project-info.json file
    * project-info.json _IS_ platform specific
    * current version of project-info.json checked in is for `linux-arm64` since I'm testing docker on a new mac
* build with `docker build -t docker/java-nix --progress plain`
* run with `docker run -it --rm docker/java-nix`
    * run will train a classic model with a dataset it downloads on runtime
* UNSOLVED: maven pom.xml files with parent poms don't work correctly (local bug fix but unmerged into nixpkgs)
