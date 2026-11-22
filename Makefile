.PHONY: install-hooks format check

install-hooks:
	git config core.hooksPath .githooks

format:
	rg --files -g '*.nix' -0 | xargs -0 -r nixfmt --strict --width 80

check:
	rg --files -g '*.nix' -0 | xargs -0 -r nixfmt --strict --width 80 --check
	nix flake check
