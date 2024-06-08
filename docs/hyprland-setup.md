# Hyprland Setup

## Login Setup

- Put this on bash_profile
  ```
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
  fi
  ```
- Fill in username automatically and only prompt password to login
  /etc/systemd/system/getty@tty1.service.d/autologin.conf
  ```
  [Service]
  ExecStart=
  ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin <USERNAME> %I $TERM
  ```

## Package & Dependencies List

```
yay -S hyprland hyprpaper hyprcursor hypridle hyprlock hyprpicker xdg-desktop-portal-hyprland waybar wofi dunst \
grim slurp playerctl brightnessctl wev cliphist wlogout archlinux-xdg-menu git ntfs-3g xwaylandvideobridge rofimoji \
nwg-look adw-gtk-theme nautilus loupe file-roller gnome-keyring polkit-gnome gnome-tweaks papirus-icon-theme --needed
```

# QT/KDE Apps Support

```
yay -S qt5-wayland qt6-wayland qt6ct-kde kvantum kvantum-theme-libadwaita-git
```

## Package List (Manual Install)

- Bibata-cursor (Both for xcursor or hyprcursor)
