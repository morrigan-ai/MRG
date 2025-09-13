
Debian
====================
This directory contains files used to package morrigand/morrigan-qt
for Debian-based Linux systems. If you compile morrigand/morrigan-qt yourself, there are some useful files here.

## morrigan: URI support ##


morrigan-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install morrigan-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your morrigan-qt binary to `/usr/bin`
and the `../../share/pixmaps/morrigan128.png` to `/usr/share/pixmaps`

morrigan-qt.protocol (KDE)

