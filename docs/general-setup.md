# GENERAL SETUP

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

- Apps
  `yay -S brave-bin visual-studio-code-bin obsidian discord cmus --needed`

- Utilities
  `yay -S syncthing docker distrobox ncdu --needed`

- Flatpak Setup

  ```
  yay -S flatpak --needed
  flatpak install flathub com.obsproject.Studio
  ```

- Misc

  - Wifi driver fix
    `yay -S rtl8821ce-dkms-git --needed`
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
  - Mount HDD

    ```sh
    sudo blkid # Check HDD UUID
    sudo mkdir /mnt/HDD
    # Add this to /etc/fstab
    UUID=<HDD-UUID> /mnt/HDD ntfs-3g x-gvfs-show,uid=1000,guid=1000,dmask=022,fmask=133 0 0
    ```

  - Environtment Variables
    ```sh
    # Add this to /etc/environment
    EDITOR=nvim
    TERMINAL=kitty
    ```
