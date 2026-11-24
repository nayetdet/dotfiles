.PHONY: format check

format:
	nix fmt

check:
	nix flake check
