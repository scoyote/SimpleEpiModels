Simple Epidemiological Modeling in SAS, R, and Python
First off, this article is not going to show you the trajectory of the current coronavirus pandemic. I think we have enough people doing this with results all over the place. I became interested in epidemiology as a mathematics undergraduate student in the early 1990s, and one of my first jobs was calculating confidence intervals for data in EpiInfo for a team of practicing acute epidemiologists.
I dusted off the epidemiology in my head and started looking for code examples that would get me a head start on doing some analysis. As usual, I found a lot of completed analyses, a lot of self-congratulatory complicated code, but very little that was simple enough to be a building block for my knowledge. For me, this can lead to the unfortunate situation of accepting that code works without knowing everything that it is doing, and I learned long ago not to fall into this trap. It will bite you badly at some point. 

I am a big fan of Brady Haran’s Numberphile YouTube channel, and he posted a nice simple video (https://youtu.be/k6nLfCbAzgo) of mathematician Ben Sparks working through how to build a SIR (Susceptible, Infected, Recovered), epidemiological model, using Geogebra. Finally, this PharmaSug paper is a great place to start, and I gleaned much from it for this article: https://www.pharmasug.org/proceedings/china2014/SP/PharmaSUG-China-2014-SP03.pdf.

Solving the SIR model means solving an ordinary differential equation problem, and most analytical software handles this pretty succinctly. I work for SAS, and most of the time, my customers want to use SAS to solve their analytical problems. My background and experience are a bit more varied, and I like to explore how to do things using various tools as it helps me help them incorporate their code into SAS workflows in the “use the tool you love” mentality. This exercise has reinforced to me that SAS PROC MODEL is a deeply developed tool with a rich set of solvers all in one place, backed up by SASs vast academic center of excellence.

So now would be an excellent time to take a look at the YouTube video and the Geogebra workbook: https://www.geogebra.org/m/aqpv5df7. I created this Geogebra workbook as precisely as in the video as possible, so the parameters are not formally named.

SAS
There are several ways to construct this example using SAS software. SAS PROC IML contains a rich set of matrix-based tools if you wanted to build an ODE solver anywhere from scratch to the fully parameterized solver that simply needs to be called. For this example, I decided to focus on PROC MODEL, which is an interface to a large selection of solvers that can also be simple or very complex. Lastly, for SIR models in SAS, the tried and true data step is also an option.

R
There are also a number of libraries that solve ordinary differential equations. I opted for the desolve library. T

Python


Conclusion
The code for each of these is remarkably similar, which is good 
