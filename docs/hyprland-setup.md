# Hyprland Setup

## Login Setup

- Put this on bash_profile
  ```
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
  fi
  ```
- Fill in username automatically and only prompt password to login
  /etc/systemd/system/getty@tty1.service.d/skip-username.conf
  ```
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty -o '-p -- reyvn' --noclear --skip-login - $TERM
  ```

## Package & Dependencies List

```
yay -S hyprland hyprpaper hyprcursor hypridle hyprlock hyprpicker xdg-desktop-portal-hyprland waybar wofi dunst \
grim slurp playerctl brightnessctl xorg-xev wev cliphist wlogout git ntfs-3g rofimoji \
nwg-look adw-gtk-theme nautilus loupe file-roller gnome-keyring polkit-gnome gnome-tweaks papirus-icon-theme \
gnome-calculator evince xdg-desktop-portal-gtk --needed
```

# QT/KDE Apps Support

```
yay -S qt5-wayland qt6-wayland qt6ct-kde kvantum kvantum-theme-libadwaita-git
```

# Keyring

```
# Add this at the end of auth section
auth       optional     pam_gnome_keyring.so
# Add this at the end of session section
session    optional     pam_gnome_keyring.so auto_start
```

## Package List (Manual Install)

- Bibata-cursor (Both for xcursor or hyprcursor)
