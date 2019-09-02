LIBNAME="entry"
BUILDDIR="/vagrant/"
NIMDIR=$HOME/.cache/nim/${LIBNAME}_d
nim c --noMain --app:staticlib --header -d:nimDebugDlOpen --genScript "$LIBNAME.nim"
cd $NIMDIR
sh "compile_${LIBNAME}.sh"
cp "${LIBNAME}.h" $BUILDDIR
cp "nimbase.h" $BUILDDIR
cd $BUILDDIR
make clean
make
cp ./linux/linuxxdoom ./id1