#
# Makefile
#
# this makefile is currently only used to make snapshots


VERSION=0.2
PACKAGE_VERSION=1
PROG=dpkg-deb
SOURCE=./tmp
FLAGS=--build
DEBTARGET=liblua5.1-captcha0_$(VERSION)-$(PACKAGE_VERSION)_i386.deb
TARGET=lua-captcha-$(VERSION)

default:
	@echo "options are 'snapshot', 'clean'"

snapshot:
	mkdir -p ./tmp
	svn export ./ $(TARGET)
	tar cvvf $(TARGET).tar $(TARGET)
	gzip $(TARGET).tar
	rm -R $(TARGET)

debian_package:
	mkdir -p tmp/
	mkdir -p tmp/usr/share/lua/5.1/
	mkdir -p tmp/usr/share/doc/liblua5.1-captcha0
	mkdir -p tmp/DEBIAN
	cp src/captcha.lua tmp/usr/share/lua/5.1/
	cp debian/control tmp/DEBIAN/control
	cp doc/copyright tmp/usr/share/doc/liblua5.1-captcha0/copyright
	fakeroot $(PROG) $(FLAGS) $(SOURCE) $(DEBTARGET)

clean:
	rm -Rf tmp/*
