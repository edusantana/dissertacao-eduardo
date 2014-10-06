# convert factor to numeric for convenience
turma = read.table("/home/santana/workspaces/ruby/moodle-log-ufpb-virtual/functions/weka/R/319.data", header=TRUE)
turma$Tree <- as.numeric(turma$Tree)
ntrees <- max(turma$Tree)

# get the range for the x and y axis
xrange <- range(turma$age)
yrange <- range(turma$circumference)

# set up the plot
plot(xrange, yrange, type="n", xlab="Semanas",
   ylab="Classificado corretamente (%)" )
colors <- rainbow(ntrees, s = 1, v = 1)
linetype <- c(1:ntrees)
plotchar <- seq(18,18+ntrees,1)

# add lines
for (i in 1:ntrees) {
  tree <- subset(turma, Tree==i)
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
    lty=linetype[i], col=colors[i], pch=plotchar[i])
}

# add a title and subtitle
title("Definição X", "example of line plot")

assign('legenda' , c('ZeroR', 'OneR', 'J48', 'NaiveBayes', 'SMO', 'SimpleLogistic', 'Vote'))

# add a legend
legend(xrange[1], yrange[2], legenda, cex=0.8, col=colors,
   pch=plotchar, lty=linetype, title="Algorítmos")
