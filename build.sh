LIBNAME="entry"
BUILDDIR="/vagrant/"
NIMDIR=$HOME/.cache/nim/${LIBNAME}_d
rm $NIMDIR/*
nim c -f --cpu:i386 --os:linux --noMain --app:staticlib --header -d:nimDebugDlOpen --genScript "$LIBNAME.nim"
retval=$?
if [ $retval -ne 0 ]; then
    exit
fi
cd $NIMDIR
sh "compile_${LIBNAME}.sh"
cp "${LIBNAME}.h" $BUILDDIR
cp "nimbase.h" $BUILDDIR
cd $BUILDDIR
make clean
make
cp ./linux/linuxxdoom ./id1
