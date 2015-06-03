::
::  The purpose of this batch file is to eliminate all existing Windows environment
::  variables and replace them with only those variables that CMake needs to see.
::  This is a brute-force attempt to keep CMake from mixing and matching compilers and
::  tools and libraries that will not work together (e.g. 32-bit MinGW and 64-bit MinGW)
::

:: nuke all existing environment variables
for /f "delims==" %%a in ('set') do set %%a=

:: delete existing CMake cache files, previous build and test files
del /F /Q *.cmake
del /F /Q CMakeCache.txt
rmdir /S /Q Testing
rmdir /S /Q tests
rmdir /S /Q src
rmdir /S /Q CMakeFiles

:: set CMAKE-related and build-related variables
set CMAKEROOT=C:\Program Files (x86)\CMake 2.8
set MINGWBASE=c:\MinGW64
set R_HOME=C:\Program Files\R\R-3.0.1\bin

:: define where 'make copy' will place executables
set INSTALL_PREFIX=d:\DOS

:: define other variables for use in the CMakeList.txt file
:: options are "Release" or "Debug"
set BUILD_TYPE="Release"

:: IMPORTANT!! Make sure a valid TEMP directory exists!!
set TEMP=d:\TEMP

:: set path to include important MinGW locations
set PATH=%MINGWBASE%\bin;%MINGWBASE%\include;%MINGWBASE%\lib

:: recreate clean Windows environment
set PATH=%PATH%;c:\windows;c:\windows\system32;c:\windows\system32\Wbem
set PATH=%PATH%;C:\Program Files (x86)\7-Zip
set PATH=%PATH%;%CMAKEROOT%\bin;%CMAKEROOT%\share

:: not every installation will have these; I (SMW) find them useful
set PATH=%PATH%;c:\Program Files (x86)\Zeus
set PATH=%PATH%;D:\DOS\gnuwin32\bin

:: set important environment variables
set FC=%MINGWBASE%\bin\gfortran
set CC=%MINGWBASE%\bin\gcc
set CXX=%MINGWBASE%\bin\g++.exe
set AR=%MINGWBASE%\bin\ar.exe
set NM=%MINGWBASE%\bin\nm.exe
set LD=%MINGWBASE%\bin\ld.exe
set STRIP=%MINGWBASE%\bin\strip.exe
set CMAKE_RANLIB=%MINGWBASE%\bin\ranlib.exe

set INCLUDE=%MINGWBASE%\include
set LIB=%MINGWBASE%\lib
set LIBRARY_PATH=%MINGWBASE%\lib

:: set compiler-specific link and compile flags
set LDFLAGS="-flto"
set CPPFLAGS="-DgFortran"

set CMAKE_INCLUDE_PATH=%INCLUDE%
set CMAKE_LIBRARY_PATH=%LIB%
set CTEST_OUTPUT_ON_FAILURE=1

:: add --trace to see copious details re: CMAKE

cmake ..\..\.. -G "MinGW Makefiles" ^
-DMINGWBASE=%MINGWBASE% ^
-DPLATFORM_TYPE=%PLATFORM_TYPE% ^
-DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-DCMAKE_INSTALL_PREFIX:PATH=%INSTALL_PREFIX% ^
-DCMAKE_MAKE_PROGRAM=%MINGWBASE%\bin\make.exe ^
-DCMAKE_RANLIB:FILEPATH=%MINGWBASE%\bin\ranlib.exe ^
-DCMAKE_C_COMPILER:FILEPATH=%MINGWBASE%\bin\gcc.exe ^
-DCMAKE_Fortran_COMPILER:FILEPATH=%MINGWBASE%\bin\gfortran.exe
