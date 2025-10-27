{ pkgs, ... }:

{
  packages = [
    pkgs.bundler # Package installer for ruby
    pkgs.git # Make sure we have git for committing
    pkgs.just # Helper tool for creating script snippets
    pkgs.ruby # Main language for jekyll
    pkgs.tzdata # Used to set timezone data
  ];

  git-hooks.hooks = {
    nixpkgs-fmt.enable = true;
    check-merge-conflicts.enable = true;
  };

  scripts.install.exec = ''
    ${pkgs.just}/bin/just install
  '';

  scripts.serve.exec = ''
    ${pkgs.just}/bin/just serve
  '';

  scripts.clean.exec = ''
    ${pkgs.just}/bin/just clean
  '';

}
