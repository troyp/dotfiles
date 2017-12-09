troyp dotfiles directory
------------------------

## General structure

* Dotfiles under ~ are generally symlinked from the corresponding folders in the repo's base directory.
* Dotfiles in system directories are generally hardlinked from the corresponding folders under `/ROOT/`.
* - ~/.gitignore and ~/.gitconfig are symlinked from their entries under `/ROOT/home/troy/`.
* 

## Dotfiles in ~/autostart

* Autostart files are kept in four subdirectories:
    - login-before-desktop-scripts
    - login-desktop-files
    - login-scripts
    - logout-scripts

* The script kde-autostart-update copies the entries to their corresponding directories under ~/.config

