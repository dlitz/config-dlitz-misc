DESTDIR ?= tmp/output
INSTALL ?= install

all:

clean:

mrproper: clean
	rm -rf tmp/output
	-rmdir --ignore-fail-on-non-empty --parents tmp

install:
	umask 022

	mkdir -p $(DESTDIR)/usr/bin
	cp -rt $(DESTDIR)/usr/bin bin/patch-conffile-dlitz

	mkdir -p $(DESTDIR)/usr/share/config-dlitz-bashrc-root
	cp -rt $(DESTDIR)/usr/share/config-dlitz-bashrc-root \
		share/root.bashrc \
		share/template

	mkdir -p $(DESTDIR)/etc
	cp -rt $(DESTDIR)/etc root.bashrc

	mkdir -p $(DESTDIR)/etc/sudoers.d
	cp -rt $(DESTDIR)/etc/sudoers.d sudoers.d/*

	mkdir -p $(DESTDIR)/etc/wireguard/keys

.PHONY: all install clean
