all:
	@true

UNITSDIR ?= /usr/lib/systemd/system

install:
	install -m 0644 -D bind-dirs-snapd.conf \
		$(DESTDIR)/usr/lib/qubes-bind-dirs.d/30_snapd.conf
	install -m 0755 -D qubes-snapd-mount \
		$(DESTDIR)/usr/lib/qubes/qubes-snapd-mount
	install -m 0644 -D qubes-snapd-mount.service \
		$(DESTDIR)$(UNITSDIR)/qubes-snapd-mount.service
	install -m 0644 -D qubes-snapd.preset \
		$(DESTDIR)$(UNITSDIR)-preset/70-qubes-snapd.preset
