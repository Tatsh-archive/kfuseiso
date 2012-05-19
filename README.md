# Installation

## Gentoo

Install layman:

```bash
emerge layman
```

Add my overlay and install:

```bash
layman -o http://tatsh.github.com/tatsh-overlay/layman.xml -a tatsh-overlay
echo 'kde-misc/kfuseiso ~amd64' >> /etc/portage/package.keywords
emerge kde-misc/kfuseiso
```

If the layman command fails, edit `/etc/layman/layman.cfg` and add the URL manually.

## Others

Install dependencies (preferably through your package manager):

* [FuseISO](http://sourceforge.net/projects/fuseiso/)
* Dolphin
* KDialog

Modify `kfuseiso_mount.desktop`'s `Exec=` line  to use the path where `mountiso.sh` is. Full path recommended!

```bash
cd ~
git clone git://github.com/tatsh/kfuseiso.git
cd kfuseiso
cp kfuseiso_mount.desktop ~/.kde4/share/kde4/services/ServiceMenus
```

Now right-click any ISO file (or any file of mime type `application/x-cd-image`) and you should see an option named __Mount__.
