library(robis)
library(dplyr)
library(obistools)
library(ggplot2)
library(plotly)

aae <- occurrence("Abra aequalis")
ani <- occurrence("Abra nitida")
ase <- occurrence("Abra segmentum")
apr <- occurrence("Abra profundorum")

abra <- bind_rows(aae, ani, ase, apr)

xy <- lookup_xy(abra, shoredistance = FALSE, grids = TRUE, areas = FALSE)
abra <- bind_cols(abra, xy)

ggplot(abra) +
  geom_point(aes(x = sssalinity, y = sstemperature, color = species)) +
  scale_color_brewer(palette = "Spectral")

plot_ly(abra, x = ~sssalinity, y = ~sstemperature, z = ~-bathymetry, color = ~species, colors = c("#d7191c", "#fdae61", "#abd9e9", "#2c7bb6")) %>%
  add_markers()



