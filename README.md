# Update package
```shell
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
```

# Full GC
```shell
sudo nix-collect-garbage -d
nix-collect-garbage -d
```
