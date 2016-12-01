library(manipulate)
data("cars")
manipulate(
      plot(cars, xlim = c(x.min, x.max), type = type,
           axes = axes, ann = label),
      x.min = slider(0,15),
      x.max = slider(15,30, initial = 25),
      type = picker("p", "l", "b", "c", "o", "h", "s", "S", "n"),
      axes = checkbox(TRUE, "Draw Axes"),
      label = checkbox(FALSE, "Draw Labels"))

