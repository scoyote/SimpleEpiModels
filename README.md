# Simple Epidemiological Modeling in SAS, R, and Python
First off, this article is not going to show you the trajectory of the current coronavirus pandemic. I think we have enough people doing this with results all over the place.

I became interested in epidemiology as a mathematics undergraduate student in the early 1990s, and one of my first jobs was calculating confidence intervals for data in EpiInfo for a team of practicing acute epidemiologists. I dusted off the epidemiology in my head and started looking for code examples that would get me a head start on doing some analysis. As usual, I found a lot of completed analyses, a lot of self-congratulatory complicated code, but very little that was simple enough to be a building block for my knowledge. For me, this can lead to the unfortunate situation of accepting that code works without knowing everything that it is doing, and I learned long ago not to fall into this trap. It will bite you badly at some point. 

I am a big fan of Brady Haran’s Numberphile YouTube channel, and he posted a nice simple video (https://youtu.be/k6nLfCbAzgo) of mathematician Ben Sparks working through how to build a SIR (Susceptible, Infected, Recovered), epidemiological model, using Geogebra.

Solving the SIR model means solving an ordinary differential equation problem, and most analytical software handles this pretty succinctly. I work for SAS, and most of the time, my clients want to use SAS to solve their analytical problems. My background and experience are a bit more varied, and I like to explore how to do things using various tools as it helps me help them incorporate their code into SAS workflows in the “use the tool you love” mentality. This exercise has reinforced to me that SAS PROC MODEL is a deeply developed tool with a rich set of solvers all in one place, backed up by SASs vast academic center of excellence.

So now would be an excellent time to take a look at the YouTube video and the Geogebra workbook: https://www.geogebra.org/m/aqpv5df7. I created this Geogebra workbook as precisely as in the video as possible, so the parameters are not formally named.

## SAS
There are several ways to construct this example using SAS software. SAS PROC IML contains a rich set of matrix-based tools if you wanted to build an ODE solver anywhere from scratch to the fully parameterized solver that simply needs to be called. For this example, I decided to focus on PROC MODEL, which is an interface to a large selection of solvers that can also be simple or very complex. Lastly, for SIR models in SAS, the tried and true data step is also an option. I have provided a link to a paper at the bottom of this section that demonstrates the data step approach.

This PharmaSug paper is a great place to start, and I gleaned much from it for this article: https://www.pharmasug.org/proceedings/china2014/SP/PharmaSUG-China-2014-SP03.pdf

If you do not have access to SAS software, you can get a free learning version here: https://www.sas.com/en_us/software/university-edition.html

## R

There are also a number of libraries that solve ordinary differential equations. I opted for the deSolve library. Notice that the R code is very similar to the PROC MODEL code in its general configuration. You set some initial values, then specify the first derivatives explicitly. The ode function then uses these to solve the system.

## Python
The python version of this code is again very similar to both the SAS and R manifestations. I chose the odeint function from scipy.integrate as the solver, and I am sure there are many other tools out there that are accessible from python.

## Slightly Off-Topic: SAS, R and Python Integrated

If you have SAS Viya, you can also access the SAS solvers using R or Python code using the libraries provided by our GitHub repositories. 

https://github.com/sassoftware/python-swat

https://github.com/sassoftware/R-swat

SAS has put a lot of energy into embracing what our customers want when it comes to other free and open-source analytical solutions. What this means is SAS is working to build interfaces in both directions so that an analyst can have the most amount of flexibility in how they work with code. Another example is model management. Our model management solution. SAS Open Model Manager, accepts and keeps up with code written in just about anything and streamlines the relationship between modeling and DevOps.

The times have definitely changed. I listened to an internal tech talk recently given by a SAS employee who mentioned that they had never written a data step but do their work entirely in Python, running on a SAS Viya cluster. If you haven't kept up with SAS over the last ten years, you will be very surprised by the additions to the platform. As always though, SAS remains backward compatibility as much as is possible. You can still run those programs you wrote in 1995 without worry:)
