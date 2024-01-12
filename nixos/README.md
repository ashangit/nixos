# Update package
```shell
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
```

# Full GC
```shell
nix-collect-garbage -d
sudo nix-collect-garbage -d
```
