## GADM file formats
##
## The "geopackage" format is the a very good general spatial data file format (for vector data). It can be read by spatial packages in python and R (with the 'terra' or 'sf' package), and by GIS software such as QGIS and ArcGIS.
##
## A "shapefile" consist of at least four actual files (.shp, .shx, .dbf, .prj). This is an older, but still commonly used format that can used in R, python, and GIS software such as QGIS, ArcGIS, DIVA-GIS, and many other programs.
##
## A "Google Earth .kmz" file can be opened in Google Earth.
##
## "GeoJSON .json" files are useful for web mapping with javascript
##
## For easy use of these data in R you can use the geodata package, specifically the geodata::gadm() function. See http://www.rspatial.org/ to learn about using spatial data in R.
## Some files have been compressed and grouped in ZIP files. You can use programs such as 7-zip to decompress and ungroup these files.
##
## The coordinate reference system is longitude/latitude and the WGS84 datum.

p_URL_Geopackage      <- "https://geodata.ucdavis.edu/gadm/gadm4.1/gpkg/gadm41_DNK.gpkg"

p_URL_Shapefile       <- "https://geodata.ucdavis.edu/gadm/gadm4.1/shp/gadm41_DNK_shp.zip"

p_URL_GeoJSON_level_0 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/json/gadm41_DNK_0.json"
p_URL_GeoJSON_level_1 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/json/gadm41_DNK_1.json.zip"
p_URL_GeoJSON_level_2 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/json/gadm41_DNK_2.json.zip"

p_URL_KMZ_level_0 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/kmz/gadm41_DNK_0.kmz"
p_URL_KMZ_level_1 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/kmz/gadm41_DNK_1.kmz"
p_URL_KMZ_level_2 <- "https://geodata.ucdavis.edu/gadm/gadm4.1/kmz/gadm41_DNK_2.kmz"
