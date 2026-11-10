# Qubes snapd Helper

This package is part of [Qubes OS](https://www.qubes-os.org). It makes snaps
survive a reboot inside an app qube, where the root filesystem is normally
reset each time the qube starts.

It does this in two parts:

- A [bind-dirs](https://www.qubes-os.org/doc/bind-dirs/) rule that keeps
  `/var/lib/snapd` and `/snap` across reboots, so installed snaps and their
  data persist.
- A systemd service (`qubes-snapd-mount`) that, on each boot, rebuilds the
  per-snap `.mount` and `.automount` units. snapd keeps each snap as a
  squashfs image and relies on these units to mount it; they live outside the
  persisted directories, so they are regenerated at startup.

Both parts only act when snapd is installed (`/usr/bin/snap` is present), so
the package is harmless on qubes without it.
