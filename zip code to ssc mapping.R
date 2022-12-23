## Zip code matching to SSC station ##
## Joe Morina 12/05/2022 ##
library(raster)

x1 = read.csv("zips.csv", header=T) # zip code centroids (lat/lon) for VA

y1 = read.csv("ssc.csv", header=T) # SSC stations (lat/lon) for VA and neighboring state

d1 <- pointDistance(x1[,3:2], y1[,3:2], lonlat=TRUE, allpairs=T) # calculate distance between all pairs
i <- apply(d1, 1, which.min) # select station with the closest distance to zip code

x1$SSC_ID = y1$SSC_ID[i]
x1$distance = d1[cbind(1:nrow(d1), i)] # add distance (m) to nearest SSC for each zip code
x1

write.csv(x1,"zipcode ssc.csv") ## save dataframe as csv

#Visual Representation 
plot(x1[,3:2], ylim=c(36,40), col="blue", pch=20)
points(y1[,3:2], col="red", pch=20)
for (i in 1:nrow(x1)) {
  j <- y1$SSC_ID==x1$SSC_ID[i]
  arrows(x1[i,3], x1[i,2], y1[j,3], y1[j,2],length=.01) 
}

text(y1[,3:2], labels=y1$SSC_ID, pos=3, cex=.75, col="red")


