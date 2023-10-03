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


from OMPython import OMCSessionZMQ
omc = OMCSessionZMQ()


# omc.sendExpression("getVersion()")

# omc.sendExpression("cd()")


# omc.sendExpression("loadModel(Modelica)")
omc.sendExpression("loadFile(\"BuckVoltage.mo\")")
# omc.sendExpression("getClassNames()")
omc.sendExpression("instantiateModel(BuckVoltage)")
omc.sendExpression("getClassNames()")


#%%
omc.sendExpression("loadFile(\"/usr/share/doc/omc/testmodels/BouncingBall.mo\")")
omc.sendExpression("instantiateModel(BouncingBall)")
# omc.sendExpression("loadFile(getInstallationDirectoryPath() + \"/usr/share/doc/omc/testmodels/BouncingBall.mo\")")

# %%
/usr/share/doc/omc/testmodels