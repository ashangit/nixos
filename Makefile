.PHONY: lint upgrade clean repair

lint:
	nix-shell --command "alejandra *;deadnix -e"

upgrade:
	sudo nixos-rebuild switch --upgrade-all

clean:
	nix-collect-garbage -d
	sudo nix-collect-garbage -d

repair:
	sudo nix-store --verify --check-contents --repair
