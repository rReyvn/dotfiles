# ✯ Reyvn's Dotfiles ✯

## General Setup
- SSH Setup
    - Generate SSH Key 
        ```sh
        ssh-keygen -t ed25519 -f <ssh_file_name> -C <EMAIL_STRING>
        eval `ssh-agent -s`
        ssh-add .ssh/id_ed25519_reyvn
        ```
    - Setup SSH Key to Github
    - Create ssh config file (Default: ~/.ssh/config)
        ```
        Host github.com
            HostName github.com
            User git
            IdentityFile ~/.ssh/<ssh_file_name>
            IdentitiesOnly yes
          
        Host github.com-alt
            HostName github.com
            User git
            IdentityFile ~/.ssh/<ssh_file_name_alt>
            IdentitiesOnly yes
        ```

- Desktop Setup
    - [Terminal Setup](/docs/term-env-setup.md)
    - [KDE Setup](/docs/kde-setup.md)
    - [Hyprland Setup](/docs/hyprland-setup.md)

- Dotfiles Setup
    - Clone Repository
        ```sh
        git clone git@github.com-reyvn:rReyvn/dotfiles.git && cd dotfiles
        ```
    - Install
        ```makefile
        make rice
        ```
    - Install terminal dots only
        ```makefile
        make rice-term
        ```
    - Uninstall
        ```makefile
        make unrice
        ```
- Apps
    ``` yay -S brave-bin visual-studio-code-bin obsidian discord cmus --needed ```

- Utilities
    ``` yay -S syncthing docker distrobox --needed ```

- Flatpak
    ```
    yay -S flatpak --needed
    flatpak install flathub com.obsproject.Studio 
    ```

- Misc
    - Wifi driver fix
        ``` yay -S rtl8821ce-dkms-git --needed ```
    - Sync dual-boot bluetooth devices
        ```
        yay -S python-pipx --needed
        pipx install bt-dualboot
        ```
    - Fonts
        ```
        yay -S inter-font ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-ms-fonts
        ttf-nerd-fonts-symbols-mono ttf-font-awesome otf-font-awesome --needed
        ```
    - [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - JetBrainsMono Nerd Font
    - [Bibata-cursor](https://www.bibata.live/studio)
