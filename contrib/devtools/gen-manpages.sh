#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

MORRIGAND=${MORRIGAND:-$SRCDIR/morrigand}
MORRIGANCLI=${MORRIGANCLI:-$SRCDIR/morrigan-cli}
MORRIGANTX=${MORRIGANTX:-$SRCDIR/morrigan-tx}
MORRIGANQT=${MORRIGANQT:-$SRCDIR/qt/morrigan-qt}

[ ! -x $MORRIGAND ] && echo "$MORRIGAND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
MRGVER=($($MORRIGANCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for morrigand if --version-string is not set,
# but has different outcomes for morrigan-qt and morrigan-cli.
echo "[COPYRIGHT]" > footer.h2m
$MORRIGAND --version | sed -n '1!p' >> footer.h2m

for cmd in $MORRIGAND $MORRIGANCLI $MORRIGANTX $MORRIGANQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${MRGVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${MRGVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
