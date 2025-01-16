# project file hierarchy
```txt
- `rice/`
    - `river/`
        - .config/
        - .stow-local-ignore
    - `dwm/`
        - .config/
        - .stow-local-ignore
- `common/`
    - .config/
    - .stow-local-ignore
- `nixos_flake/`
    - flake.nix
    - nixos/
    - home-manager/
- `scripts/`
- README.md
- LICENCE
```

>[!NOTE]
> 
> make sure to configure `stow` to stow files at `$HOME` or `$HOME/.config`
