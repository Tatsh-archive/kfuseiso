# Installation

## Gentoo

## Others

Install [FuseISO](http://sourceforge.net/projects/fuseiso/) (preferably through your package manager).

Modify `kfuseiso_mount.desktop`'s `Exec=` line  to use the path where `mountiso.sh` is. Full path recommended!

```bash
cd ~
git clone git://github.com/tatsh/kfuseiso.git
cp kfuseiso_mount.desktop ~/.kde4/share/kde4/services/ServiceMenus
```

Now right-click any ISO file (or any file of mime type `x-cd-image`) and you should see an option named _Mount_.
