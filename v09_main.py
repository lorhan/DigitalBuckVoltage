#%%


k=7364
wz = 11.952e3
wp = 82.54e3

b2,b1,b0 = (k/(wz**2)),(2*k/wz),k
a3,a2,a1,a0 = (1/(wp**2)),(2/wp),1,0


print("{" + f"{b2},{b1},{b0}" + "}")
print("{" + f"{a3},{a2},{a1},{a0}" + "}")

# %%
import numpy as np

Vin = 30
Vo = 15
R = 5
C = 400e-6
L = 200e-6
r = 0.1 

fc = 5e3
PM = 60

s = 1j*2*np.pi*fc


Gc_at_fc = (Vin/(L*C))*(1+(s*r*C))/(s**2 + s*(r/L + 1/(R+C)) + 1/(L*C))




kboost = 2.628
k = 1/np.abs(Gc_at_fc)
kc = k*wz/kboost
print(kc)




#%%
# =============================================================================
# CONTROLLING MODELICA WITH PYTHON
# =============================================================================

from OMPython import ModelicaSystem
import matplotlib.pyplot as plt
import os


# Change the working directory so that the output files will be placed in this new directory and not pollute the directory we want to keep clean
os.chdir("ModelicaFiles/")

mod=ModelicaSystem('BuckVoltage.mo',"BuckVoltage")

#%%

# to see the parameters available: print(mod.getParameters())
mod.setParameters("tf.a[1] = 2")
mod.setParameters("vref.k=15")
mod.setSimulationOptions(["stopTime=10e-3"])
mod.simulate()

#%%

L_i, C_v = mod.getSolutions(["L.i","C.v"])
plt.plot(C_v)

# %%
