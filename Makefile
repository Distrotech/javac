GCJ = gcj
LIBDIR=lib
PREFIX=/usr/

all: javac

javac:
	$(GCJ) -Wl,-Bsymbolic -findirect-dispatch --main=org.eclipse.jdt.internal.compiler.batch.Main /usr/share/java/ecj-3.5.2.jar -lgcj -lgcj_bc -lgcc -o javac -Wl,-Bsymbolic 

install: all
	install -d ${DESTDIR}${PREFIX}${LIBDIR}/jvm/gcj-jdk/bin
	install -t ${DESTDIR}${PREFIX}${LIBDIR}/jvm/gcj-jdk/bin javac

clean:
	rm -f javac
