# pyhdfeos

## Introduction
The pyhdfeos packages is a slim python interface to the HDF-EOS library. HDF-EOS is NASA's standard file
archive format to store Earth Observing System (EOS) satellite data such as [MODIS](https://modis.gsfc.nasa.gov), 
from the Terra and Aqua platforms. The HDF-EOS library, or HDF-EOS2, is based on the Hierarchical Data Format
(HDF) version 4, HDF4 (not HDF5), provided by the HDF Group.

## Installing
The pyhdfeos package requires [Cython](http://cython.org), [HDF-EOS2](http://hdfeos.org) 
and [HDF4](https://support.hdfgroup.org/release4/obtain.html) to build and install. Make 
sure your LDFLAGS and CPPFLAGS are set before the build process is invoked, bash export e.g.
   ```shell
   export LDFLAGS="-L/opt/hdfeos/lib -L/opt/hdf/lib"
   export CPPFLAGS=-I/opt/hdfeos/include -I/opt/hdf/include"
   ```

   ```python
    python setup.py build_ext -i
    python setup.py install --prefix=/usr/local/
   ```

Note, if errors like: libhdfeos.a(GDapi.o): relocation R_X86_64_32 against  ...
come up in the build phase then the compiled hdfeos code was not fully position independent.
You must recompile the libhdfeos.a as position-independent, with the equivalent gcc -fPIC flag,
and then try to rebuild pyhdfeos. 

Also note the that the HDF-EOS library install does not install the headers, e.g. HDFEOSVersion.h,
by default. 

## Examples
See examples/ on how to use this module.

## Bugs
Please use [ISSUES](https://github.com/HyperplaneOrg/pyhdfeos/issues) to create new issues for problems encountered.

## License
GNU General Public License v3.0
