let
  nix-pre-commit-hooks = import (builtins.fetchTarball "https://github.com/cachix/pre-commit-hooks.nix/tarball/master");
in {
  # Configured with the module options defined in `modules/pre-commit.nix`:
  pre-commit-check = nix-pre-commit-hooks.run {
    src = ./.;
    hooks = {
      # Nix
      alejandra.enable = true;
      deadnix.enable = true;
      # Markdonw
      markdownlint.enable = true;
      # Speller check
      typos.enable = true;
      # git
      commitizen.enable = true;
    };
  };
}
