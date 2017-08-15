'''
 AUTHOR:
    Andrew Michaelis, amac@hyperplane.org
 LICENSE:
   This file is part of pyhdfeos.

   pyhdfeos is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
'''

import pyhdfeos

#-------------------------------------------------------
def read_hdfeos(fname, gridname):
   hid = pyhdfeos.GDopen(fname, pyhdfeos.DFACC_READ) 
   print hid
   gid = pyhdfeos.GDattach(hid, gridname)
   print 'GID', gid
   ginfo = pyhdfeos.GDgridinfo(gid)
   print 'GINFO', ginfo

   pinfo = pyhdfeos.GDprojinfo(gid)
   print 'PINFO', pinfo

   oinfo = pyhdfeos.GDorigininfo(gid)
   print 'OINFO', oinfo

   pxinfo = pyhdfeos.GDpixreginfo(gid)
   print 'PINFO', pxinfo

   pyhdfeos.GDdetach(gid)

   status = pyhdfeos.GDclose(hid)
   print status
   return  ginfo, pinfo, oinfo, pxinfo 
#read_hdfeos

#-------------------------------------------------------
def write_hdfeos(fname, gridnm, dat):
   print fname, dat
   hid = pyhdfeos.GDopen(fname, pyhdfeos.DFACC_CREATE) 
   print hid
   ginfo = dat[0]
   gid = pyhdfeos.GDcreate(hid, gridnm, ginfo[1] , ginfo[2], ginfo[3], ginfo[4], ginfo[5], ginfo[6])
   print 'New GID', gid

   pinfo = dat[1]
   print pinfo
   stat = pyhdfeos.GDdefproj(gid, pinfo[1], pinfo[2], pinfo[3], pinfo[4])
   print 'Stat', stat

   stat = pyhdfeos.GDdeforigin(gid, dat[2][0])
   print 'Stat', stat

   stat = pyhdfeos.GDdefpixreg(gid, dat[3][0])
   print 'Stat', stat

   stat = pyhdfeos.GDdefdim(gid, "XDim", ginfo[1])
   print 'Stat', stat

   stat = pyhdfeos.GDdefdim(gid, "YDim", ginfo[2])
   print 'Stat', stat

   stat = pyhdfeos.GDdeffield(gid, "ndvi", 'YDim,XDim', pyhdfeos.DFNT_FLOAT32, pyhdfeos.HDFE_NOMERGE)
   print 'Stat', stat

   pyhdfeos.GDdetach(gid)
   status = pyhdfeos.GDclose(hid)
   print status
#write_hdfeos


#-------------------------------------------------------
if __name__ == "__main__":
   dat = read_hdfeos("LC08_L1TP_044033_20170614_20170615_01_RT.hdf", "Grid")
   write_hdfeos("hdfeos-test.hdf", "Grid", dat)

