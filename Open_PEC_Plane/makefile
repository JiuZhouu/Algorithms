FFLAG  = -parallel -O3 -132
BLASLIB  = -lblas-icc
LAPACKLIB  = -llapack-icc

p0.x: p0.o self.o near.o far.o f1.o f2.o
	ifort  ${FFLAG} -o p0.x p0.o self.o near.o far.o f1.o f2.o $(LAPACKLIB) $(BLASLIB)

p0.o:
	ifort  ${FFLAG} -c p0.f -o p0.o

self.o:
	ifort  ${FFLAG} -c self.f -o self.o

near.o:
	ifort  ${FFLAG} -c near.f -o near.o

far.o:
	ifort  ${FFLAG} -c far.f -o far.o

f1.o:
	ifort  ${FFLAG} -c f1.f -o f1.o

f2.o:
	ifort  ${FFLAG} -c f2.f -o f2.o

clean:
	rm -rf *.o p0.x
