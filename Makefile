DESTDIR ?= tmp/output
INSTALL ?= install

all: patch-conffile-dlitz.1

clean:
	rm -f patch-conffile-dlitz.1

mrproper: clean
	rm -rf tmp/output
	-rmdir --ignore-fail-on-non-empty --parents tmp

install: all
	umask 022

	mkdir -p $(DESTDIR)/usr/bin
	cp -rt $(DESTDIR)/usr/bin bin/patch-conffile-dlitz

	mkdir -p $(DESTDIR)/usr/share/man/man1
	cp -t $(DESTDIR)/usr/share/man/man1 \
		patch-conffile-dlitz.1

	mkdir -p $(DESTDIR)/usr/share/config-dlitz-bashrc-root
	cp -rt $(DESTDIR)/usr/share/config-dlitz-bashrc-root \
		share/root.bashrc \
		share/template

	mkdir -p $(DESTDIR)/etc
	cp -rt $(DESTDIR)/etc root.bashrc

	mkdir -p $(DESTDIR)/etc/sudoers.d
	cp -rt $(DESTDIR)/etc/sudoers.d sudoers.d/*

	mkdir -p $(DESTDIR)/etc/wireguard/keys

patch-conffile-dlitz.1: bin/patch-conffile-dlitz
	argparse-manpage \
		--pyfile $< \
		--function make_arg_parser \
		--author "Darsey Litzenberger" \
		--description "Add/Update/Remove a managed section in a config file" \
		--project-name patch-conffile-dlitz \
		--url https://github.com/dlitz/config-dlitz-misc \
		> $@

.PHONY: all install clean
