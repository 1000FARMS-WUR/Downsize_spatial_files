library(raster)
library(terra)
library(here)

ref <- rast("tmax_20170101.tif")

soil_clay0 <- rast("sol_clay_tot_psa_m_30m_0..20cm_2001..2017_v0.13_wgs84.tif")

soil_text0 <- rast("sol_texture.class_m_30m_0..20cm_2001..2017_v0.13_wgs84.tif")

soil_log0 <- rast("sol_log.oc_m_30m_0..20cm_2001..2017_v0.13_wgs84.tif")

soil_clay <- terra::resample(soil_clay0,ref)

soil_text <- terra::resample(soil_text0,ref)

soil_log <- terra::resample(soil_log0,ref)

layout(rbind(1:2))
plot(soil_clay0)
plot(soil_clay)

terra::writeRaster(soil_clay,"soil_clay.tif", overwrite=TRUE)

terra::writeRaster(soil_text,"soil_text.tif", overwrite=TRUE)

terra::writeRaster(soil_log,"soil_log.tif", overwrite=TRUE)