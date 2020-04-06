#!/usr/bin/env python
# coding: utf-8

# # SIR Modeling in Python, based on Numberphile 
# 

# This notebook is designed to be a bare-bones introudction to SIR modeling in Python. 
# 
# I am using the example from Numberphile video: https://www.youtube.com/watch?v=k6nLfCbAzgo where Ben Sparks discusses simple ODE modeling in Geogebra using SIR models as the example.
# There is a Geogebra workbook demonstrating this, as in the video, here:  https://www.geogebra.org/classic/aqpv5df7
# 
# also taking examples from https://scipython.com/book/chapter-8-scipy/additional-examples/the-sir-epidemic-model/

import numpy as np
from scipy.integrate import odeint
import matplotlib.pyplot as plt
import pandas as pd

# In the numberphile example, Ben uses transm and recov for beta and gamma, so I have replaced them here. If you want to set it back, just change all transm to beta and all recov to gamma.
N = 1
Istart = 0.01
Sstart = N - Istart
Rstart = 0
transm = 3.25
recov  = 0.30
maxT = 20

t = np.linspace(0, maxT, maxT)

def deriv(SIR, t, N, transm, recov):
    S, I, R = SIR
    dSdt = -transm * S * I 
    dIdt = transm * S * I  - recov * I
    dRdt = recov * I
    return dSdt, dIdt, dRdt

SIR0 = Sstart, Istart, Rstart
ret = odeint(deriv, SIR0, t, args=(N, transm, recov))
S, I, R = ret.T

plotData = pd.DataFrame(ret.T)
plotData = plotData.transpose()
plotData.columns = ['S','I','R']

with pd.plotting.plot_params.use('x_compat',True):
    plotData['S'].plot(color='g')
    plotData['I'].plot(color='r')
    plotData['R'].plot(color='b')

