# Calculating distances between points 

The objective of this script is to calculate distances between points on the WGS ellipsoid using the Raster package. In this example, zip code/ZCTAs of the state of Virginia were mapped to the nearest Spatial Synoptic Classification (SSC) weather station to assess specific weather patterns. In particular, this project is examining weather-type classifications that are associated with extreme heat. The GPS coordinates for SSC stations were obtained from http://sheridan.geog.kent.edu/ssc3.html. Zip code and ZCTA centroids were obtained from geonames.org and nber.org, respectively. 

SSC stations within and bordering the state of VA had their GPS coordinates collected. Three stations were originally included in the analysis, but were dropped due to the large spans of missing data. This resulted in a total of 15 SSC stations for the VA heat event analysis. The centroids of all Virginia zip codes were obtained from the GeoNames database, and the centroids for all Virginia and the contiguous USA ZCTAs were obtained from NBER. Each zip code or ZCTA is assigned to the closest SSC station.

Once each centroid has been mapped to the nearest SSC weather station, heat event data for each station will be applied to the appropriate zip/ZCTA, which allows for spatial and temporal patterns of heat event days for the state of Virginia between 2016-2020 to be assessed. This will then be linked to heat-specific illnesses and emergency room admittance to assess the monetary burden of heat events on public health. 

<p align="center">
<img width="640" alt="Screen Shot 2023-03-09 at 2 54 06 PM" src="https://user-images.githubusercontent.com/121312601/224139019-76029183-0695-4169-9fcb-ab8ea3c0eec9.png">
</p>

<p align="center">
Figure 1. Graphical representation of point mapping for ZCTA/zip code centroids to the closest SSC weather station. 
</p>

