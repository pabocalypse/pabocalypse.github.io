{ pkgs, ... }:

{
  packages = [ pkgs.git pkgs.ruby pkgs.bundler pkgs.just pkgs.tzdata ];

  git-hooks.hooks = {
    nixpkgs-fmt.enable = true;
    check-merge-conflicts.enable = true;
  };

}
