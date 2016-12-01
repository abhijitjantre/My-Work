library(rCharts)
data(iris)
str(iris)
names(iris) <- gsub("\\.","",names(iris))
r1 <- rPlot(SepalLength ~ SepalWidth | Species, data = iris, color="Species", type = "point")
r1
