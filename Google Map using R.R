library(rCharts)
map <- Leaflet$new()
map$setView(c(19.0173,72.8305), zoom = 15)
map$marker(c(19.0173,72.8305), bindPopup = "<p> Siddhivinayak Mandir</p>")
map$marker(c(18.9939,72.8371), bindPopup = "<p> Ganesh Galli </p>")
map
