'''
 FILE: 
   pyhdfeosc.pyx
 DESCRIPTION:
   This is a limited interface to the the hdfeos api. 
 AUTHOR:
    Andrew Michaelis, amac@hyperplane.org
 LICENSE:
   This file is part of pyhdfeos.

   pyhdfeos is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
'''

import exceptions
cimport pyhdfeosc
from libc.string cimport memset

__version__ = '0.0.1'

# hdf / hdfeos defines
DFACC_READ = pyhdfeosc.DFACC_READ 
DFACC_WRITE = pyhdfeosc.DFACC_WRITE 
DFACC_CREATE = pyhdfeosc.DFACC_CREATE 
DFACC_ALL = pyhdfeosc.DFACC_ALL 
DFACC_RDONLY = pyhdfeosc.DFACC_RDONLY 
DFACC_RDWR = pyhdfeosc.DFACC_RDWR 
DFACC_CLOBBER = pyhdfeosc.DFACC_CLOBBER 
SUCCEED = pyhdfeosc.SUCCEED 
FAIL = pyhdfeosc.FAIL 
HDFE_GD_UL = pyhdfeosc.HDFE_GD_UL 
HDFE_GD_UR = pyhdfeosc.HDFE_GD_UR 
HDFE_GD_LL = pyhdfeosc.HDFE_GD_LL 
HDFE_GD_LR = pyhdfeosc.HDFE_GD_LR 
HDFE_CENTER  = pyhdfeosc.HDFE_CENTER  
HDFE_CORNER = pyhdfeosc.HDFE_CORNER 
HDFE_NOMERGE = pyhdfeosc.HDFE_NOMERGE
HDFE_AUTOMERGE = pyhdfeosc.HDFE_AUTOMERGE 
DFNT_FLOAT32  = pyhdfeosc.DFNT_FLOAT32
DFNT_FLOAT = pyhdfeosc.DFNT_FLOAT
DFNT_FLOAT64 = pyhdfeosc.DFNT_FLOAT64
DFNT_INT8   = pyhdfeosc.DFNT_INT8  
DFNT_UINT8 = pyhdfeosc.DFNT_UINT8
DFNT_INT16 = pyhdfeosc.DFNT_INT16
DFNT_UINT16 = pyhdfeosc.DFNT_UINT16
DFNT_INT32  = pyhdfeosc.DFNT_INT32
DFNT_UINT32 = pyhdfeosc.DFNT_UINT32
DFNT_UCHAR8 = pyhdfeosc.DFNT_UCHAR8
DFNT_UCHAR  = pyhdfeosc.DFNT_UCHAR
DFNT_CHAR8  = pyhdfeosc.DFNT_CHAR8
DFNT_CHAR   = pyhdfeosc.DFNT_CHAR
DFNT_CHAR16 = pyhdfeosc.DFNT_CHAR16
DFNT_UCHAR16  = pyhdfeosc.DFNT_UCHAR16 
GCTP_GEO = pyhdfeosc.GCTP_GEO 
GCTP_UTM = pyhdfeosc.GCTP_UTM 
GCTP_SPCS = pyhdfeosc.GCTP_SPCS 
GCTP_ALBERS = pyhdfeosc.GCTP_ALBERS 
GCTP_LAMCC = pyhdfeosc.GCTP_LAMCC 
GCTP_MERCAT = pyhdfeosc.GCTP_MERCAT 
GCTP_PS = pyhdfeosc.GCTP_PS 
GCTP_POLYC = pyhdfeosc.GCTP_POLYC 
GCTP_EQUIDC = pyhdfeosc.GCTP_EQUIDC 
GCTP_TM = pyhdfeosc.GCTP_TM 
GCTP_STEREO = pyhdfeosc.GCTP_STEREO 
GCTP_LAMAZ = pyhdfeosc.GCTP_LAMAZ 
GCTP_AZMEQD = pyhdfeosc.GCTP_AZMEQD 
GCTP_GNOMON = pyhdfeosc.GCTP_GNOMON 
GCTP_ORTHO = pyhdfeosc.GCTP_ORTHO 
GCTP_GVNSP = pyhdfeosc.GCTP_GVNSP 
GCTP_SNSOID = pyhdfeosc.GCTP_SNSOID 
GCTP_EQRECT = pyhdfeosc.GCTP_EQRECT 
GCTP_MILLER = pyhdfeosc.GCTP_MILLER 
GCTP_VGRINT = pyhdfeosc.GCTP_VGRINT 
GCTP_HOM = pyhdfeosc.GCTP_HOM 
GCTP_ROBIN = pyhdfeosc.GCTP_ROBIN 
GCTP_SOM = pyhdfeosc.GCTP_SOM 
GCTP_ALASKA = pyhdfeosc.GCTP_ALASKA 
GCTP_GOOD = pyhdfeosc.GCTP_GOOD 
GCTP_MOLL = pyhdfeosc.GCTP_MOLL 
GCTP_IMOLL = pyhdfeosc.GCTP_IMOLL 
GCTP_HAMMER = pyhdfeosc.GCTP_HAMMER 
GCTP_WAGIV = pyhdfeosc.GCTP_WAGIV 
GCTP_WAGVII = pyhdfeosc.GCTP_WAGVII 
GCTP_OBLEQA = pyhdfeosc.GCTP_OBLEQA 
GCTP_ISINUS1 = pyhdfeosc.GCTP_ISINUS1 
GCTP_CEA = pyhdfeosc.GCTP_CEA 
GCTP_BCEA = pyhdfeosc.GCTP_BCEA 
GCTP_ISINUS = pyhdfeosc.GCTP_ISINUS 

GCTP_PROJ_NAMES = { 'GCTP_GEO' : GCTP_GEO, 'GCTP_UTM' : GCTP_UTM, 'GCTP_SPCS' : GCTP_SPCS, 'GCTP_ALBERS' : GCTP_ALBERS, 'GCTP_LAMCC' : GCTP_LAMCC,
             'GCTP_MERCAT' : GCTP_MERCAT, 'GCTP_PS' : GCTP_PS, 'GCTP_POLYC' : GCTP_POLYC, 'GCTP_EQUIDC' : GCTP_EQUIDC, 'GCTP_TM' : GCTP_TM,
             'GCTP_STEREO' : GCTP_STEREO, 'GCTP_LAMAZ' : GCTP_LAMAZ, 'GCTP_AZMEQD' : GCTP_AZMEQD, 'GCTP_GNOMON' : GCTP_GNOMON,
             'GCTP_ORTHO' : GCTP_ORTHO, 'GCTP_GVNSP' : GCTP_GVNSP, 'GCTP_SNSOID' : GCTP_SNSOID, 'GCTP_EQRECT' : GCTP_EQRECT,
             'GCTP_MILLER' : GCTP_MILLER, 'GCTP_VGRINT' : GCTP_VGRINT, 'GCTP_HOM' : GCTP_HOM, 'GCTP_ROBIN' : GCTP_ROBIN, 'GCTP_SOM' : GCTP_SOM,
             'GCTP_ALASKA' : GCTP_ALASKA, 'GCTP_GOOD' : GCTP_GOOD, 'GCTP_MOLL' : GCTP_MOLL, 'GCTP_IMOLL' : GCTP_IMOLL, 'GCTP_HAMMER' : GCTP_HAMMER,
             'GCTP_WAGIV' : GCTP_WAGIV, 'GCTP_WAGVII' : GCTP_WAGVII, 'GCTP_OBLEQA' : GCTP_OBLEQA, 'GCTP_ISINUS1' : GCTP_ISINUS1, 'GCTP_CEA' : GCTP_CEA,
             'GCTP_BCEA' : GCTP_BCEA, 'GCTP_ISINUS' : GCTP_ISINUS }


# WARNING, see below, e.g. pyhdfeosc.float64 _projparms[16]
# since things like pyhdfeosc.float64 _projparms[MAX_PROJPARAMS] is a fail
MAX_PROJPARAMS = 16

#-----------------------------------------------------------
cdef int _GDopen(char *fname, int imode):
   cdef pyhdfeosc.int32 _hid
   cdef pyhdfeosc.intn _imode
   cdef int hid
   _imode = <pyhdfeosc.intn?> imode
   _hid = pyhdfeosc.GDopen(fname, _imode)
   hid = <int?> _hid
   return hid 
#_GDopen
def GDopen(fname, imode): 
   return _GDopen(fname, imode)

#-----------------------------------------------------------
cdef int _GDclose(int hid):
   cdef pyhdfeosc.int32 _hid
   cdef pyhdfeosc.intn _stat
   cdef int stat
   _hid = <pyhdfeosc.int32?> hid
   _stat = pyhdfeosc.GDclose(_hid)
   stat = <int?> _stat
   return stat 
#_GDclose
def GDclose(hid): 
   return _GDclose(hid)
   
#-----------------------------------------------------------
cdef int _GDattach(int h4id, char* gridname):
   cdef pyhdfeosc.int32 _hid
   cdef pyhdfeosc.int32 _gid
   cdef int gid
   _hid = <pyhdfeosc.int32?> h4id
   _gid = pyhdfeosc.GDattach(_hid, gridname)
   gid = <int?> _gid
   return gid
#_GDattach
def GDattach(h4id, gridname): 
   return _GDattach(h4id, gridname)

#-----------------------------------------------------------
cdef int _GDdetach(int gid):
   cdef pyhdfeosc.int32 _gid
   cdef pyhdfeosc.intn _stat
   cdef int stat
   _gid = <pyhdfeosc.int32?> gid
   _stat = pyhdfeosc.GDdetach(_gid)
   stat = <int?> _stat
   return stat 
#_GDdetach
def GDdetach(gid): 
   return _GDdetach(gid)

#---------------------------------------------------------------------------
cdef tuple _GDgridinfo(int gid):
   cdef int stat, xdimsize, ydimsize
   cdef double upleftptXL, upleftptYL, lowrightptXL, lowrightptYL
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _xdimsize, _ydimsize
   cdef pyhdfeosc.float64 _upleftpt[3]
   cdef pyhdfeosc.float64 _lowrightpt[3]
   _gid = <pyhdfeosc.int32?> gid
   _stat = pyhdfeosc.GDgridinfo(_gid, &_xdimsize, &_ydimsize, _upleftpt, _lowrightpt);
   xdimsize = <int?> _xdimsize
   ydimsize = <int?> _ydimsize
   upleftptXL = <double?> _upleftpt[0]
   upleftptYL = <double?> _upleftpt[1]
   lowrightptXL = <double?> _lowrightpt[0]
   lowrightptYL = <double?> _lowrightpt[1]
   stat = <int?> _stat
   return (stat, xdimsize, ydimsize, upleftptXL, upleftptYL, lowrightptXL, lowrightptYL)
#_GDgridinfo
def GDgridinfo(gid):
   return _GDgridinfo(gid)

#---------------------------------------------------------------------------
cdef tuple _GDprojinfo(int  gid):
   cdef int stat, i
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _projcode, _zonecode, _spherecode  
   cdef pyhdfeosc.float64 _projparms[16]
   cdef int projcode, zonecode, spherecode
   cdef list projparm = []
   memset(_projparms, 0, 16 * sizeof(double))
   _gid = <pyhdfeosc.int32?> gid
   _stat = pyhdfeosc.GDprojinfo(_gid, &_projcode, &_zonecode, &_spherecode, _projparms)
   projcode = <int?> _projcode
   zonecode = <int?> _zonecode 
   spherecode = <int?> _spherecode 
   for i in range(MAX_PROJPARAMS):
     projparm.append(<double?> _projparms[i])
   stat = <int?> _stat
   return (stat, projcode, zonecode, spherecode, projparm)
#_GDprojinfo
def GDprojinfo(gid):
   return _GDprojinfo(gid)

#---------------------------------------------------------------------------
cdef tuple _GDorigininfo(int gid):
   cdef int stat, ocode
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _ocode, _gid 
   _gid = <pyhdfeosc.int32?> gid
   _stat = pyhdfeosc.GDorigininfo(_gid, &_ocode)
   stat = <int?> _stat
   ocode = <int?> _ocode
   return (stat, ocode)
#_GDorigininfo
def GDorigininfo(int gid):
   return _GDorigininfo(gid)

#---------------------------------------------------------------------------
cdef tuple _GDpixreginfo(int gid):
   cdef int stat, ocode
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _pcode, _gid 
   _gid = <pyhdfeosc.int32?> gid
   _stat = pyhdfeosc.GDorigininfo(_gid, &_pcode)
   stat = <int?> _stat
   pcode = <int?> _pcode
   return (stat, pcode)
#_GDpixreginfo
def GDpixreginfo(int gid):
   return _GDpixreginfo(gid)

#---------------------------------------------------------------------------
cdef int _GDcreate(int fid, char* gridname, int xdimsize, int  ydimsize, double upleftptXL, double upleftptYL, double lowrightptXL, double lowrightptYL):
   cdef int gid
   cdef pyhdfeosc.int32 _gid, _xdimsize, _ydimsize, _fid
   cdef pyhdfeosc.float64 _upleftpt[3]
   cdef pyhdfeosc.float64 _lowrightpt[3]
   _fid = <pyhdfeosc.int32?> fid
   _xdimsize = <pyhdfeosc.int32?> xdimsize 
   _ydimsize = <pyhdfeosc.int32?> ydimsize 
   _upleftpt[0] = <pyhdfeosc.float64?> upleftptXL 
   _upleftpt[1] = <pyhdfeosc.float64?> upleftptYL 
   _lowrightpt[0] = <pyhdfeosc.float64?> lowrightptXL
   _lowrightpt[1] = <pyhdfeosc.float64?> lowrightptYL
   _gid = pyhdfeosc.GDcreate(_fid, gridname, _xdimsize, _ydimsize, _upleftpt, _lowrightpt)
   gid = <int?> _gid
   return (gid)
#_GDcreate
def GDcreate(fid, gridname, xdimsize, ydimsize, upleftptXL, upleftptYL, lowrightptXL, lowrightptYL):
   return _GDcreate(fid, gridname, xdimsize, ydimsize, upleftptXL, upleftptYL, lowrightptXL, lowrightptYL)

#---------------------------------------------------------------------------
cdef int _GDdefproj(int gid, int projcode, int zonecode, int spherecode, list projparm):
   cdef int stat, i
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _projcode, _zonecode, _spherecode
   cdef pyhdfeosc.float64 _projparms[16]
   _gid = <pyhdfeosc.int32?> gid
   _projcode = <pyhdfeosc.int32?> projcode 
   _zonecode = <pyhdfeosc.int32?> zonecode 
   _spherecode = <pyhdfeosc.int32?> spherecode 
   memset(_projparms, 0, 16 * sizeof(pyhdfeosc.float64))
   for i in range(MAX_PROJPARAMS):
     _projparms[i] = <pyhdfeosc.float64?> projparm[i]
   _stat = pyhdfeosc.GDdefproj(_gid, _projcode, _zonecode, _spherecode, _projparms)
   stat = <int?> _stat
   return stat
#_GDdefproj
def GDdefproj(gid, projcode, zonecode, spherecode, projparm):
   return _GDdefproj(gid, projcode, zonecode, spherecode, projparm)

#-------------------------------------------------------------------------------
cdef int _GDdeforigin(int gid, int origincode):
   cdef int stat
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _origincode
   _gid = <pyhdfeosc.int32?> gid
   _origincode = <pyhdfeosc.int32?> origincode 
   _stat = pyhdfeosc.GDdeforigin(_gid, _origincode)
   stat = <int?> _stat
   return stat
#_GDdeforigin
def GDdeforigin(gid, origincode):
   return _GDdeforigin(gid, origincode)

#-------------------------------------------------------------------------------
cdef int _GDdefpixreg(int gid, int pixregcode):
   cdef int stat
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _pixregcode
   _gid = <pyhdfeosc.int32?> gid
   _pixregcode = <pyhdfeosc.int32?> pixregcode
   _stat = pyhdfeosc.GDdefpixreg(_gid, _pixregcode)
   stat = <int?> _stat
   return stat
#_GDdefpixreg
def GDdefpixreg(gid, pixregcode):
   return _GDdefpixreg(gid, pixregcode)

#-------------------------------------------------------------------------------
cdef int _GDdefdim(int gid, char *dimname, int dim):
   cdef int stat
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _dim
   _gid = <pyhdfeosc.int32?> gid
   _dim = <pyhdfeosc.int32?> dim
   _stat = pyhdfeosc.GDdefdim(_gid, dimname, _dim)
   stat = <int?> _stat
   return stat
#_GDdefdim
def GDdefdim(gid, dimname, dim):
   return _GDdefdim(gid, dimname, dim)

#-------------------------------------------------------------------------------
cdef int _GDdeffield(int gid, char *fieldname, char *dimlist, int numbertype, int merge):
   cdef int stat
   cdef pyhdfeosc.intn _stat
   cdef pyhdfeosc.int32 _gid, _numbertype, _merge
   _gid = <pyhdfeosc.int32?> gid
   _merge = <pyhdfeosc.int32?> merge 
   _numbertype = <pyhdfeosc.int32?> numbertype
   _stat = pyhdfeosc.GDdeffield(_gid, fieldname, dimlist, _numbertype, _merge)
   stat = <int?> _stat
   return stat
#_GDdeffield
def GDdeffield(gid, fieldname, dimlist, numbertype, merge):
   return _GDdeffield(gid, fieldname, dimlist, numbertype, merge)

