#! /bin/sh

set -ue
module load intel/2023.2.0 netcdf szip hdf5
set -x

fflags=$( nf-config --fflags )
flibs=$( nf-config --flibs )

ifort $fflags -I. -c -o mkncgbbepx.o mkncgbbepx.f90 -g -traceback
ifort $fflags -o mkncgbbepx.exe mkncgbbepx.o -g -traceback $flibs
