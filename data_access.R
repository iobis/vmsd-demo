library(robis)
library(ggplot2)
library(dplyr)
library(leaflet)

# Lagis

lag <- occurrence("Lagis")
world <- map_data("world")

ggplot() +
  geom_polygon(data = world, aes(x = long, y = lat, group = group), fill = "#dddddd") +
  geom_point(data = lag, aes(x = decimalLongitude, y = decimalLatitude, color = species)) +
  coord_fixed(1) +
  scale_color_brewer(palette = "Paired")

# Abra

asi <- occurrence("Abra sibogai")
ase <- occurrence("Abra segmentum")
aae <- occurrence("Abra aequalis")

map_leaflet(asi, popup = function(x) { return(x["scientificName"]) }, color = "#ff00ff") %>%
  addCircleMarkers(data = ase, ~decimalLongitude, ~decimalLatitude, radius = 3, weight = 1, color = "#99cc00", popup = ase$scientificName) %>%
  addCircleMarkers(data = aae, ~decimalLongitude, ~decimalLatitude, radius = 3, weight = 1, color = "#0099ff", popup = aae$scientificName)

# Pterois

pre <- occurrence("Pterois volitans", enddate = "1999-12-31")
post <- occurrence("Pterois volitans", startdate = "2000-01-01")

map_leaflet(pre, popup = function(x) { return(x["year"]) }, color = "#99cc00") %>%
  addCircleMarkers(data = post, ~decimalLongitude, ~decimalLatitude, radius = 3, weight = 1, color = "#cc3300", popup = post$scientificName)
  
