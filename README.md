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
sudo nixos-rebuild switch --upgrade-all
```

## Full GC

```shell
nix-collect-garbage -d
sudo nix-collect-garbage -d
```

## Check store

```shell
sudo nix-store --verify --check-contents --repair
```
