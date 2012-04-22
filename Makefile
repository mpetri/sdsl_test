GCCFLAGS=-g -O3 -DNDEBUG -funroll-loops
GCCINC=-I${HOME}/include/ 
GCCLIBDIR=-L${HOME}/lib/ 
GCCLIB=-lsdsl -ldivsufsort -ldivsufsort64 -lgtest -lpthread -msse4.2


all: IntVectorTest RankSupportTest SelectSupportTest SelectSupportTest0 BitMagicTest BitMagicTestSSE

IntVectorTest: IntVectorTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} IntVectorTest.cpp -o IntVectorTest ${GCCLIB}

RankSupportTest: RankSupportTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} RankSupportTest.cpp -o RankSupportTest ${GCCLIB}

SelectSupportTest: SelectSupportTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} SelectSupportTest.cpp -o SelectSupportTest ${GCCLIB}

SelectSupportTest0: SelectSupportTest0.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} SelectSupportTest0.cpp -o SelectSupportTest0 ${GCCLIB}

BitMagicTest: BitMagicTest.cpp
	g++ ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} BitMagicTest.cpp -o BitMagicTest ${GCCLIB}

BitMagicTestSSE: BitMagicTest.cpp
	g++ -msse4.2 ${GCCFLAGS} ${GCCINC} ${GCCLIBDIR} BitMagicTest.cpp -o BitMagicTestSSE ${GCCLIB}

test:
	./IntVectorTest
	./RankSupportTest
	./SelectSupportTest
	./SelectSupportTest0
	./BitMagicTest
	./BitMagicTestSSE

clean:
	rm -f IntVectorTest RankSupportTest SelectSupportTest BitMagicTest BitMagicTestSSE
