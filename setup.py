"""Setup/install script for pyhdfeos"""

import os
import sys 
import distutils
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

version = "0.0.1"
name = "pyhdfeos"

libraries = ['hdfeos', 'mfhdf', 'df', 'Gctp', 'jpeg', 'z', 'm']
extra_compile_args = []
extra_link_args = []
define_macros = []

ext_modules = [Extension("pyhdfeos", ["pyhdfeosc.pyx"], libraries=libraries)]

long_description = """A slim python interface to the hdfeos library (HDF4) api, high level only."""

setup (# dist meta-data
         name = name,
         version = version,
         description = long_description,
         long_description=long_description,
         author = "Andrew Michaelis",
         author_email = "amac@hyperplane.org",
         license = "", 
         platforms = "Linux/Unix",
         url = "https://github.com/HyperplaneOrg/pyhdfeos",
         py_modules=[],
         cmdclass = {'build_ext': build_ext},
         ext_modules = ext_modules,
         scripts=[]
       )   

inst_prefix = None
try:
   iopts = distutils.core._setup_distribution.command_options['install']
   inst_prefix = iopts['prefix'][1]
except:
   pass

#EOF
