PREFIX = /usr/local

CC = gcc
CFLAGS = -O3 -Wall -Wextra

X11CFLAGS = $(shell pkg-config --cflags x11)
X11LIBS = $(shell pkg-config --libs x11)

all: dwmblocks

config.h:
	cp config.def.h $@

dwmblocks: dwmblocks.c config.h block.h
	${CC} -o $@ -Wno-missing-field-initializers -Wno-unused-parameter ${CFLAGS} ${X11CFLAGS} $< ${X11LIBS}

E0BLOCKS = $(abspath blocks)
# two level escaping of `\', one for sed and one for C
E1BLOCKS = $(subst \,\\\\,${E0BLOCKS})
# escaping special character `&' and delimiter `=' for sed
E2BLOCKS = $(subst &,\&,${E1BLOCKS})
E3BLOCKS = $(subst =,\=,${E2BLOCKS})
# escaping `"' for C
E4BLOCKS = $(subst ",\\",${E3BLOCKS})
# escaping `'' for shell
EFBLOCKS = $(subst ','\'',${E4BLOCKS})

clean:
	rm -f dwmblocks

BINDIR = ${DESTDIR}${PREFIX}/bin
PIDDIR = /var/local/dwmblocks

install: all
	mkdir -p ${BINDIR}
	cp -f dwmblocks ${BINDIR}
	chmod 755 ${BINDIR}/dwmblocks
	mkdir -p ${PIDDIR}
	chmod 777 ${PIDDIR}

uninstall:
	rm -f ${BINDIR}/dwmblocks
	rm -df ${PIDDIR} || exit 0

.PHONY: all clean install uninstall
