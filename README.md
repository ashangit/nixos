# Nixos

Nixos configuration

## Correct files

```shell
alejandra *
deadnix -e
statix fix
markdownlint -f *
```

## Update package

```shell
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
home-manager switch
```

## Full GC

```shell
nix-collect-garbage -d
sudo nix-collect-garbage -d
```
