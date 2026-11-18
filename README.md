# NixOS Configuration

My personal NixOS configuration and dotfiles, managed declaratively with Nix Flakes and Home Manager.

## Structure

- `hosts/` — host-specific NixOS configurations
- `home/` — Home Manager configurations
- `modules/` — reusable system and home modules
- `assets/` — wallpapers and other assets
- `config/` — application configuration files

## Usage

Apply the desktop configuration:

```bash
sudo nixos-rebuild switch --flake .#desktop
```

Apply the laptop configuration:

```bash
sudo nixos-rebuild switch --flake .#laptop
```
