GCJ = gcj
LIBDIR=lib
PREFIX=/usr

all: javac

javac:
	$(GCJ) -Wl,-Bsymbolic -findirect-dispatch --main=org.eclipse.jdt.internal.compiler.batch.Main /usr/share/java/ecj-4.3.2.jar -lgcj -lgcj_bc -lgcc -o javac -Wl,-Bsymbolic 

install: all
	install -d ${DESTDIR}${PREFIX}/${LIBDIR}/jvm/gcj-jdk/bin ${DESTDIR}${PREFIX}/bin
	install -T javac ${DESTDIR}${PREFIX}/bin/ecj
	if [ -e ${DESTDIR}${PREFIX}/${LIBDIR}/jvm/gcj-jdk/bin/javac ];then rm ${DESTDIR}${PREFIX}/${LIBDIR}/jvm/gcj-jdk/bin/javac;fi 
	ln -sr ${DESTDIR}${PREFIX}/bin/ecj ${DESTDIR}${PREFIX}/${LIBDIR}/jvm/gcj-jdk/bin/javac

clean:
	rm -f javac

distclean: clean
