with (import <nixpkgs> {});
  mkShell {
    shellHook = ''
      ${(import ./default.nix).pre-commit-check.shellHook}
    '';
    nativeBuildInputs = with pkgs.buildPackages; [
      # Check tools
      ## Git
      commitizen
      ## Nix
      alejandra
      deadnix
      ## Markdown
      markdownlint-cli
      ## Spell checker
      typos
    ];
  }
