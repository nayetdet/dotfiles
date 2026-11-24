.PHONY: install-hooks format check

install-hooks:
	git config core.hooksPath .githooks

format:
	nix fmt

check:
	nix flake check
