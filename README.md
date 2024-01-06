# Update package
```shell
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
```

# Apply using specific configuration
```shell
cd /home/nfraison/dev/nixos
sudo NIX_PATH="/home/nfraison/dev/nixos/configuration.nix" nixos-rebuild switch
```

# Full GC
```shell
sudo nix-collect-garbage -d
nix-collect-garbage -d
```
