# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Linux)

# which compilers to use for C and C++
SET(CMAKE_FORCE_C_COMPILER x86_64-w64-mingw32-gcc GNU)
SET(CMAKE_FORCE_CXX_COMPILER x86_64-w64-mingw32-g++ GNU)
SET(CMAKE_RC_COMPILER x86_64-w64-mingw32-windres GNU)
SET(CMAKE_FORCE_Fortran_COMPILER x86_64-w64-mingw32-gfortran GNU)


# where is the target environment located
SET(CMAKE_FIND_ROOT_PATH  /usr/x86_64-w64-mingw32 ${CMAKE_SOURCE_DIR}/include/win_x64/gfortran )

set( SYS_ROOT /usr/x86-64-w64-mingw32/sys-root/mingw )
set( SYS_LIB ${SYS_ROOT}/lib )
set( SYS_INCLUDE ${SYS_ROOT}/include )
set( SWB_LIB ${CMAKE_SOURCE_DIR}/lib/win_x64/gfortran )
set( SWB_INCLUDE ${CMAKE_SOURCE_DIR}/include/win_x64/gfortran )

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
