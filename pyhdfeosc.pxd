#  This file is part of pyhdfeos.
#
#  pyhdfeos is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.

cdef extern from "hdfi.h":
   # The typing here is fairly safe but could possibily fail on corner cases
   ctypedef char char8 
   ctypedef unsigned char uchar8 
   ctypedef short int     int16
   ctypedef unsigned short int uint16
   ctypedef int           intn 
   ctypedef unsigned int  uintn 
   ctypedef unsigned int  uint32
   ctypedef int           int32
   ctypedef double float64
   ctypedef float  float32

cdef extern from "hdf.h":
   cdef int DFACC_READ 
   cdef int DFACC_WRITE 
   cdef int DFACC_CREATE 
   cdef int DFACC_ALL 
   cdef int DFACC_RDONLY 
   cdef int DFACC_RDWR 
   cdef int DFACC_CLOBBER 
   cdef int SUCCEED 
   cdef int FAIL
   
cdef extern from "mfhdf.h":
   cdef int SD_NOFILL 
   cdef int SD_FILL 

cdef extern from "hntdefs.h":
   cdef int DFNT_FLOAT32 
   cdef int DFNT_FLOAT
   cdef int DFNT_FLOAT64
   cdef int DFNT_INT8  
   cdef int DFNT_UINT8
   cdef int DFNT_INT16
   cdef int DFNT_UINT16
   cdef int DFNT_INT32 
   cdef int DFNT_UINT32
   cdef int DFNT_UCHAR8
   cdef int DFNT_UCHAR 
   cdef int DFNT_CHAR8 
   cdef int DFNT_CHAR  
   cdef int DFNT_CHAR16
   cdef int DFNT_UCHAR16 

cdef extern from "HdfEosDef.h":
   cdef int HDFE_GD_UL
   cdef int HDFE_GD_UR
   cdef int HDFE_GD_LL
   cdef int HDFE_GD_LR
   cdef int HDFE_CENTER 
   cdef int HDFE_CORNER
   cdef int HDFE_NOMERGE
   cdef int HDFE_AUTOMERGE 
   cdef int GCTP_GEO
   cdef int GCTP_UTM
   cdef int GCTP_SPCS
   cdef int GCTP_ALBERS
   cdef int GCTP_LAMCC
   cdef int GCTP_MERCAT
   cdef int GCTP_PS
   cdef int GCTP_POLYC
   cdef int GCTP_EQUIDC
   cdef int GCTP_TM
   cdef int GCTP_STEREO
   cdef int GCTP_LAMAZ
   cdef int GCTP_AZMEQD
   cdef int GCTP_GNOMON
   cdef int GCTP_ORTHO
   cdef int GCTP_GVNSP
   cdef int GCTP_SNSOID
   cdef int GCTP_EQRECT
   cdef int GCTP_MILLER
   cdef int GCTP_VGRINT
   cdef int GCTP_HOM
   cdef int GCTP_ROBIN
   cdef int GCTP_SOM
   cdef int GCTP_ALASKA
   cdef int GCTP_GOOD
   cdef int GCTP_MOLL
   cdef int GCTP_IMOLL
   cdef int GCTP_HAMMER
   cdef int GCTP_WAGIV
   cdef int GCTP_WAGVII
   cdef int GCTP_OBLEQA
   cdef int GCTP_ISINUS1
   cdef int GCTP_CEA
   cdef int GCTP_BCEA
   cdef int GCTP_ISINUS
  
   # These are esentially cut and paste HdfEosDef.h

   # For more info on these prototypes see the hdfeos lib GDapi.c file 
   # pyhdfeosc.pyx has limited info also...
   int32 GDopen(char *, intn)
   int32 GDattach(int32, char *)
   intn GDdetach(int32)
   intn GDclose(int32)
   intn GDgridinfo(int32, int32*, int32*, float64*, float64*)
   intn GDprojinfo(int32, int32*, int32*, int32*, float64*)
   intn GDorigininfo(int32, int32*)
   intn GDpixreginfo(int32, int32*)
   int32 GDcreate(int32, char *, int32, int32, float64 [], float64 [])
   intn GDdefproj(int32, int32, int32, int32, float64*)
   intn GDdeforigin(int32, int32)
   intn GDdefpixreg(int32, int32)
   intn GDdefdim(int32, char*, int32)
   intn GDdeffield(int32 , char*, char*, int32 , int32)

