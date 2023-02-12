library(raster)

####--Virginia Locations--####

# Read in files
x1 = read.csv("zips.csv", header=T) # Zipcode centroids
x1 = read.csv("zcta.csv", header=T) # ZCTA centroids
y1 = read.csv("ssc.csv", header=T) # SSC weather stations

# Calculate distances between all pairs and identify minimum distances
d1 <- pointDistance(x1[,3:2], y1[,3:2], # Columns are SSC, rows are ZCTA/zip
                    lonlat=TRUE, allpairs=T) # Leading comma subset by columns
i <- apply(d1, 1, which.min) # 1 indicates rows, select minimum distance across rows(stations)

# Add station IDs and distances from points to SSC stations (distance = meters)
x1$SSC_ID = y1$SSC_ID[i]
x1$distance = d1[cbind(1:nrow(d1), i)]

# Plot 
plot(x1[,3:2], ylim=c(36,40), col="blue", pch=20)
points(y1[,3:2], col="red", pch=20)

for (i in 1:nrow(x1)) {
  j <- y1$SSC_ID==x1$SSC_ID[i]
  arrows(x1[i,3], x1[i,2], y1[j,3], y1[j,2],length=.01) 
}

text(y1[,3:2], labels=y1$SSC_ID, pos=3, cex=.75, col="red") 

write.csv(x1,"SSC VA mapped.csv")

##--Whole US--####

x2 = read.csv("US.lower.csv", header=T) # zipcode centroids
x2 = read.csv("usaZCTA.csv",header=T) # zcta centroids
y2 = read.csv("usa.ssc.csv", header=T) # SSC gps

d2 <- pointDistance(x2[,3:2], y2[,3:2], lonlat=TRUE, allpairs=T)
i2 <- apply(d2, 1, which.min) 

x2$ID = y2$ID[i2]
x2$distance = d2[cbind(1:nrow(d2), i2)]


plot(x2[,3:2], col="blue", pch=20)
points(y2[,3:2], col="red", pch=20)

for (i2 in 1:nrow(x2)) {
  j2 <- y2$ID==x2$ID[i2]
  arrows(x2[i2,3], x2[i2,2], y2[j2,3], y2[j2,2],length=.01) 
}

write.csv(x2,"ZCTA USA mapped.csv")
