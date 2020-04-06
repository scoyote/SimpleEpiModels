#Modified from: http://rstudio-pubs-static.s3.amazonaws.com/6852_c59c5a2e8ea3456abbeb017185de603e.html

## Load deSolve package
library(deSolve)
library(ggplot2)
N      <- 1
Istart <- 0.01
Sstart <- N-Istart
Rstart <- 0
transm <- 3.25   # beta 
recov  <- 0.3     # gamma 
maxT   <- 20

init       <- c(S = Sstart, I = Istart, R = Rstart)
parameters <- c(transm, recov)
times      <- seq(0, maxT, by = 1)

## Create an SIR function (adapted from deSolve Examples)
sir <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -transm * S * I
    dI <-  transm * S * I - recov * I
    dR <-                   recov * I
    return(list(c(dS, dI, dR)))
  })
}
# Run ODE Solver
results <- ode(y = init, times = times, func = sir, parms = parameters)

#plot SIR Function
plotds <- data.frame(results)
names(plotds) <- c('time','S','I','R')

ggplot(data=plotds) + 
  geom_line(aes(x=time,y=S),color='green') +
  geom_line(aes(x=time,y=I),color='darkred') +
  geom_line(aes(x=time,y=R),color='blue') +
  theme_bw()








