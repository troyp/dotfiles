## Service Menus

### KDE4
* `~/.kde/share/kde4/services/ServiceMenus/`
* `/usr/share/kde4/services/ServiceMenus/`

### KF5
* `~/.local/share/kservices5/ServiceMenus/`
* `/usr/share/kservices5/ServiceMenus/`

To get KF5 Service Menus in a KDE4 app, you can link the KF5 directories into
the KDE4 directory.

    sudo ln -s /usr/share/kservices5/ServiceMenus/ /usr/share/kde4/services/ServiceMenus/
    ln -s ~/.local/share/kservices5/ServiceMenus/ ~/.kde/share/kde4/services/ServiceMenus/
