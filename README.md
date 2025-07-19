# Dotfiles

A collection of dotfiles - as originally setup on the Ubuntu Server "Osvald". The use of the repo hinges on *GNU Stow* to create symlinks to files in a ~/dotfiles/` directory.

#### Setup instructions

- Create a `~/dotfiles/` directory in the home `~/`directory
- Clone repository to the `~/dotfiles/` directory
```bash
git clone git@github.com:MadsSRasmussen/dotfiles.git
```
- Install `stow` with the system package-manager
- Remove any dotfiles in the home `~/` folder that are also in the repo
- Run `stow .` in the `~/dotfiles/` directory
