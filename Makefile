
CC         = gcc
CXX        = g++
FC         = ifort
CPPFLAGS   = -g -Wall
CPPFLAGS   = -O2 -Wall
DEFS       = -DFC_FUNC\(name,NAME\)=name\ \#\#\ _ -DFC_FUNC_\(name,NAME\)=name\ \#\#\ _ -DSWIG_SHARED_OBJ 
TARGET     = lib/libphreeqcmms.a


TARGET_ARCH = -IIPhreeqc/include -I./src -I./IPhreeqc/src -I./IPhreeqc/src/phreeqcpp

VPATH=src:IPhreeqc/src/phreeqcpp:IPhreeqc/src

%.o: %.f
	$(FC) $(FFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.F
	$(FC) $(FFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.F90
	$(FC) $(FFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.f90
	$(FC) $(FFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.c
	$(CC) $(DEFS) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.cxx
	$(CXX) $(DEFS) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -o $@ $<

%.o: %.cpp
	$(CXX) $(DEFS) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c -o $@ $<


POBJS =	\
	dense.o \
	advection.o \
	cvdense.o \
	cl1.o \
	dumper.o \
	cvode.o \
	dw.o \
	cxxMix.o \
	cxxKinetics.o \
	GasComp.o \
	ExchComp.o \
	Use.o \
	basicsubs.o \
	Exchange.o \
	Surface.o \
	input.o \
	gases.o \
	Temperature.o \
	GasPhase.o \
	ISolution.o \
	tally.o \
	ISolutionComp.o \
	step.o \
	integrate.o \
	isotopes.o \
	NumKeyword.o \
	KineticsComp.o \
	nvector.o \
	sundialsmath.o \
	UserPunch.o \
	nvector_serial.o \
	StorageBinList.o \
	Keywords.o \
	NameDouble.o \
	parse.o \
	Utils.o \
	phqalloc.o \
	Parser.o \
	utilities.o \
	inverse.o \
	PHRQ_base.o \
	StorageBin.o \
	kinetics.o \
	PHRQ_io_output.o \
	PHRQ_io.o \
	model.o \
	structures.o \
	tidy.o \
	pitzer_structures.o \
	System.o \
	PPassemblage.o \
	pitzer.o \
	SurfaceComp.o \
	Pressure.o \
	read.o \
	mainsubs.o \
	PPassemblageComp.o \
	Reaction.o \
	SelectedOutput.o \
	SurfaceCharge.o \
	Phreeqc.o \
	print.o \
	runner.o \
	smalldense.o \
	transport.o \
	readtr.o \
	PBasic.o \
	sit.o \
	SolutionIsotope.o \
	ReadClass.o \
	prep.o \
	SS.o \
	SSassemblage.o \
	spread.o \
	SScomp.o \
	Solution.o \
	fwrap.o \
	Var.o
SOBJS = \
	IPhreeqcF.o \
	IPhreeqcLib.o \
	CSelectedOutput.o \
	IPhreeqc.o 
MMSC_OBJS = \
	cdecl.o \
	fortran.o \
	IPhreeqcMMS.o \
	IPhreeqcMMSLib.o \
	stdcall.o
#MOBJS are compiled in WEBMOD Makefile
MOBJS = \
	phr_mix.o \
	phr_multicopy.o \
	phr_precip.o 

all: $(TARGET)

$(TARGET): $(POBJS) $(SOBJS) $(MMSC_OBJS) lib 
	$(AR) rcs $(TARGET) $(POBJS) $(SOBJS) $(MMSC_OBJS)
#	$(RANLIB) $(TARGET)	

lib:
	mkdir -p lib

clean:
	cd gccDebug/src; $(RM) *.o *.d
	cd gccRelease/src; $(RM)  *.o *.d
	$(RM)  *.o *.d

# POBJS
-include dependencies

# MOBJS
phr_mix.o: src/phr_mix.f90
phr_multicopy.o: src/phr_multicopy.f90
phr_precip.o: src/phr_precip.f90

depends:
	mkdir -p temp_dependency_dir
	cd temp_dependency_dir; g++ -MM -I. -I../src -I../include -I../IPhreeqc/src -I../IPhreeqc/src/phreeqcpp \
	../src/*.cpp \
	../IPhreeqc/src/*.cpp ../IPhreeqc/src/*.c \
	../IPhreeqc/src/phreeqcpp/*.cxx ../IPhreeqc/src/phreeqcpp/*.cpp  > ../dependencies
	rm -rf temp_dependency_dir
