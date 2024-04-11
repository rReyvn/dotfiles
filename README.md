# ✯ Reyvn's Dotfiles ✯

## 🔓 Requirement**
- 🐱 Kitty Terminal
- Fish Shell
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - JetBrainsMono Nerd Font
- git
- C Compiler
- stow
- zoxide
- fzf
- ripgrep 
- fd
- bat
- eza
- npm
- Clipboard Manager 

## 🛎️ Optional
- ranger
- lazygit

## 🪄 Dotfiles Installation
- Generate SSH Key 
    > For Reyvn, save ssh key as id_ed25519_reyvn
    ```sh
    ssh-keygen -t ed25519 -C <EMAIL_STRING>
    ssh-add .ssh/id_ed25519_reyvn
    ```
- Setup SSH Key to Github
- Create ssh config file (Default: ~/.ssh/config)
    ```
    Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_ed25519
        IdentitiesOnly yes
      
    Host github.com-reyvn
        HostName github.com
        User git
        IdentityFile ~/.ssh/id_ed25519_reyvn
        IdentitiesOnly yes
    ```
- Clone Repository
    ```sh
    git clone git@github.com-reyvn:rReyvn/dotfiles.git && cd dotfiles
    ```
- Install
    ```makefile
    make all
    ```
- Uninstall
    ```makefile
    make delete
    ```
