GCCFLAGS=-g -O3 -DNDEBUG -funroll-loops
GCCINC=-I${HOME}/include/ 
GCCLIBDIR=-L${HOME}/lib/ 
GCCLIB=-lsdsl -ldivsufsort -ldivsufsort64 -lgtest -lpthread


all: IntVectorTest RankSupportVTest RankSupportTest SelectSupportTest

IntVectorTest: IntVectorTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} IntVectorTest.cpp -o IntVectorTest ${GCCLIB}

RankSupportVTest: RankSupportVTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} RankSupportVTest.cpp -o RankSupportVTest ${GCCLIB}

RankSupportTest: RankSupportTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} RankSupportTest.cpp -o RankSupportTest ${GCCLIB}

SelectSupportTest: SelectSupportTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} SelectSupportTest.cpp -o SelectSupportTest ${GCCLIB}

test:
	./IntVectorTest
	./RankSupportTest
	./SelectSupportTest

clean:
	rm -f IntVectorTest RankSupportVTest RankSupportTest SelectSupportTest
