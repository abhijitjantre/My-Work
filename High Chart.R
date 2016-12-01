library(rCharts)
library(MASS)
data(survey)
h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", data = MASS::survey, type = c("line", 
                                                                      "bubble", "scatter"), group = "Clap", size = "Age")
h1
