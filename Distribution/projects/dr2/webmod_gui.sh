#!/bin/sh
JARDIR=../../lib
../../bin/webmod -C./control/webmod.control -print
java -cp $JARDIR/oui4.jar:$JARDIR/AbsoluteLayout.jar:$JARDIR/jcommon-1.0.12.jar:$JARDIR/jfreechart-1.0.9.jar oui.mms.gui.Mms ./control/webmod.control
