CFG1 :=`uname`
CFG :=$(shell echo $(CFG1) | sed "s/CYGWIN.*/CYGWIN/")

INPUT=../examples
PHREEQCDAT=../database/phreeqc.dat
PITZERDAT=../database/pitzer.dat
ISODAT=../database/iso.dat

PHREEQC=../src/Class_release_64/phreeqc
#PHREEQC=../src/Class_debug_64/phreeqc

ifeq ($(CFG), CYGWIN)
   PHREEQC=/cygdrive/c/Programs/phreeqc3-trunk/Class_release/phreeqcpp.exe
   #PHREEQC=/cygdrive/c/Programs/phreeqc3-trunk/Class_debug/phreeqcpp.exe
endif

all: ex1.out ex2.out ex2b.out ex3.out ex4.out ex5.out ex6.out ex7.out ex8.out ex9.out \
	ex10.out ex11.out ex12.out ex12a.out ex13a.out ex13b.out ex13c.out ex13ac.out \
	ex14.out ex15.out ex15a.out ex15b.out ex16.out ex17.out ex17b.out ex18.out \
	ex19.out ex19b.out ex20a.out ex20b.out ex21.out ex22.out

ex1.out: $(INPUT)/ex1 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex1 ex1.out $(PHREEQCDAT)  ex1.log

ex2.out: $(INPUT)/ex2 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex2 ex2.out $(PHREEQCDAT)  ex2.log

ex2b.out: $(INPUT)/ex2b $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex2b ex2b.out $(PHREEQCDAT)  ex2b.log

ex3.out: $(INPUT)/ex3 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex3 ex3.out $(PHREEQCDAT)  ex3.log

ex4.out: $(INPUT)/ex4 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex4 ex4.out $(PHREEQCDAT)  ex4.log

ex5.out: $(INPUT)/ex5 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex5 ex5.out $(PHREEQCDAT)  ex5.log

ex6.out: $(INPUT)/ex6 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex6 ex6.out $(PHREEQCDAT)  ex6.log

ex7.out: $(INPUT)/ex7 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex7 ex7.out $(PHREEQCDAT)  ex7.log

ex8.out: $(INPUT)/ex8 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex8 ex8.out $(PHREEQCDAT)  ex8.log

ex9.out: $(INPUT)/ex9 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex9 ex9.out $(PHREEQCDAT)  ex9.log

ex10.out: $(INPUT)/ex10 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex10 ex10.out $(PHREEQCDAT)  ex10.log

ex11.out: $(INPUT)/ex11 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex11 ex11.out $(PHREEQCDAT)  ex11.log

ex12.out: $(INPUT)/ex12 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex12 ex12.out $(PHREEQCDAT)  ex12.log

ex12a.out: $(INPUT)/ex12a $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex12a ex12a.out $(PHREEQCDAT)  ex12a.log

ex13a.out: $(INPUT)/ex13a $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex13a ex13a.out $(PHREEQCDAT)  ex13a.log

ex13b.out: $(INPUT)/ex13b $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex13b ex13b.out $(PHREEQCDAT)  ex13b.log

ex13c.out: $(INPUT)/ex13c $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex13c ex13c.out $(PHREEQCDAT)  ex13c.log

ex13ac.out: $(INPUT)/ex13ac $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex13ac ex13ac.out $(PHREEQCDAT)  ex13ac.log

ex14.out: $(INPUT)/ex14 $(PHREEQC) $(WATEQ4FDAT)
	$(PHREEQC) $(INPUT)/ex14 ex14.out $(PHREEQCDAT)  ex14.log

ex15.out: $(INPUT)/ex15 $(PHREEQC) $(INPUT)/ex15.dat
	$(PHREEQC) $(INPUT)/ex15 ex15.out $(INPUT)/ex15.dat  ex15.log

ex15a.out: $(INPUT)/ex15 $(PHREEQC) $(INPUT)/ex15.dat
	$(PHREEQC) $(INPUT)/ex15a ex15a.out $(INPUT)/ex15.dat  ex15a.log

ex15b.out: $(INPUT)/ex15b $(PHREEQC) $(INPUT)/ex15.dat
	$(PHREEQC) $(INPUT)/ex15b ex15b.out $(INPUT)/ex15.dat  ex15b.log

ex16.out: $(INPUT)/ex16 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex16 ex16.out $(PHREEQCDAT)  ex16.log

ex17.out: $(INPUT)/ex17 $(PHREEQC) $(PITZERDAT)
	$(PHREEQC) $(INPUT)/ex17 ex17.out $(PITZERDAT)  ex17.log

ex17b.out: $(INPUT)/ex17b $(PHREEQC) $(PITZERDAT)
	$(PHREEQC) $(INPUT)/ex17b ex17b.out $(PITZERDAT)  ex17b.log

ex18.out: $(INPUT)/ex18 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex18 ex18.out $(PHREEQCDAT)  ex18.log

ex19.out: $(INPUT)/ex19 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex19 ex19.out $(PHREEQCDAT)  ex19.log

ex19b.out: $(INPUT)/ex19b $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex19b ex19b.out $(PHREEQCDAT)  ex19b.log

ex20a.out: $(INPUT)/ex20a $(PHREEQC) $(ISODAT) 
	$(PHREEQC) $(INPUT)/ex20a ex20a.out $(ISODAT) ex20a.log

ex20b.out: $(INPUT)/ex20b $(PHREEQC) $(ISODAT)
	$(PHREEQC) $(INPUT)/ex20b ex20b.out $(ISODAT) ex20b.log

ex21.out: $(INPUT)/ex21 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex21 ex21.out $(PHREEQCDAT)   ex21.log

ex22.out: $(INPUT)/ex22 $(PHREEQC) $(PHREEQCDAT)
	$(PHREEQC) $(INPUT)/ex22 ex22.out $(PHREEQCDAT)  ex22.log
diff:
	svn diff --diff-cmd diff -x -bw	

ndiff:
	svn diff --diff-cmd /home/dlpark/bin/ndiff -x "--relative-error 1e-7"

clean:
	rm -f *.out *.log *.sel

revert:
	svn st | egrep ^! | cut -b 2- | xargs svn revert

diff_phreeqc:
	for FILE in ex*.out ex*.sel; \
		do \
			echo $$FILE; \
			diff -bw $$FILE ../../phreeqc/examples; \
		done; 
