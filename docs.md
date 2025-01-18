# project file hierarchy
```sh
$ tree -L 2
.
├── .gitignore
├── LICENCE
├── README.md
├── docs.md
├── nixos_conf/ # nixos configuration
│   ├── flake.lock
│   ├── flake.nix
│   ├── home-manager/
│   │   ├── home.nix
│   │   └── modules
│   └── nixos/
│       ├── configuration.nix
│       ├── hardware-configuration.nix
│       └── modules/
└── rices/ # desktop rice dotfiles
    └── river_rice/ # for now its only for my river config
        └── .config
```

>[!NOTE]
> 
> make sure to configure `stow` to stow files at `$HOME` or `$HOME/.config`
