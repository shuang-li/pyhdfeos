# pyhdfeos

## Introduction
The pyhdfeos packages is a slim python interface to the HDF-EOS library. HDF-EOS is NASA's standard file
archive format to store Earth Observing System (EOS) satellite data such as [MODIS](https://modis.gsfc.nasa.gov), 
from the Terra and Aqua platforms. The HDF-EOS library, or HDF-EOS2, is based on the Hierarchical Data Format
(HDF) version 4, HDF4 (not HDF5), provided by the HDF Group.

## Installing
The pyhdfeos package requires [Cython](http://cython.org), HDF-EOS2[(http://hdfeos.org)] 
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

## Bugs
Please use [ISSUES](https://github.com/HyperplaneOrg/pyhdfeos/issues) to create new issues for problems encounterd.

## License
GNU General Public License v3.0
