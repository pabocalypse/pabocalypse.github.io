{ pkgs, ... }:

{
  packages = [ pkgs.git pkgs.ruby pkgs.bundler pkgs.just pkgs.tzdata ];
}
