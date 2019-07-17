import pyhdf.SD as pyhdfSD
try:
  from osgeo import osr
except ImportError:
  import osr

class ArrayToHdfEOS2(object):
  def __init__(self,hdfFn):
    self.epsgID = None   # 4326
    self.proj4Str = None # '+proj=longlat +datum=WGS84 +no_defs'
    self.ulX = None
    self.ulY = None
    self.resolution = None
    self.sd = pyhdfSD.SD(hdfFn,pyhdfSD.SDC.WRITE|pyhdfSD.SDC.CREATE)

  def set_hdf_att(self):
    attSRS = self.sd.attr('Projection')
    attTrans = self.sd.attr('TransformationMatrix')
    attGdal = self.sd.attr('Signature')
    outSRS = osr.SpatialReference()
    if self.epsgID!=None:
      outSRS.ImportFromEPSG(self.epsgID)
    elif self.proj4Str!=None:
      outSRS.ImportFromProj4(self.proj4Str)
    outSRS = outSRS.ExportToWkt()
    print outSRS
    attSRS.set(pyhdfSD.SDC.CHAR,outSRS)
    transformationMatrix = (self.ulX,self.resolution,0,self.ulY,0,-self.resolution)
    attTrans.set(pyhdfSD.SDC.FLOAT32,transformationMatrix)
    gdalSignature = 'Created with GDAL (http://www.remotesensing.org/gdal/)'
    attGdal.set(pyhdfSD.SDC.CHAR,gdalSignature)

  def arry2sds(self,inArr,sdsName):
    sds = self.sd.create(sdsName,pyhdfSD.SDC.INT16,(inArr.shape[0],inArr.shape[1]))
    sds.setfillvalue(0)
    sds.units = 'unitless'
    sds[:] = inArr
    sds.endaccess()

  def close_sd(self):
    self.sd.end()

"""
--Example--
from osgeo import gdal_array
from GTiff2hdfEOS2 import ArrayToHdfEOS2

band = gdal_array.LoadFile('output/HS_H08_20170710_0040_B06_FLDK_R20.tif')

hdfFile = ArrayToHdfEOS2('test001.hdf')
hdfFile.epsgID = 4326
hdfFile.ulX,hdfFile.ulY = (80.7,60)
hdfFile.resolution = 0.02
hdfFile.set_hdf_att()
hdfFile.arry2sds(band,'Himawari AHI B02')
hdfFile.arry2sds(band,'Himawari AHI B03')
hdfFile.arry2sds(band,'Himawari AHI B04')
hdfFile.close_sd()
"""
