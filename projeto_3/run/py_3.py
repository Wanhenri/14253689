import pandas as pd
import csv
import matplotlib.pyplot as plt
from matplotlib import style
from matplotlib import pyplot as plt


# Realizando o teste usando somente la_plata ##
# d1 - imerg la_plata
# d2 - 24Z NCEP la_plata
# d3 - 24 SMG la_plata 

x = []
y = []

with open('data/d1.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        x.append(float(row[0]))
        y.append(float(row[1]))

z=[]

with open('data/d2.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
      
        z.append(float(row[6]))

p=[]

with open('data/d3.csv','r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
       
        p.append(float(row[6]))

plt.subplot(2, 2, 1)
plt.plot(x,y, label='IMERGE - La_plata')
plt.plot(x,z, label='24h 12Z NCEP la_plata')
plt.plot(x,p, label='24h 12Z SMG la_plata')
plt.xlim(xmin=1, xmax=25)
plt.ylim(ymin=-2, ymax=30)
plt.xlabel('Dias')
plt.ylabel('')
plt.title('Serie temporal da Area La_Plata')
plt.legend()
plt.grid()

plt.subplot(2, 2, 2)
plt.plot(x,y, label='IMERGE - La_plata')
plt.plot(x,z, label='24h 12Z NCEP la_plata')
plt.plot(x,p, label='24h 12Z SMG la_plata')
plt.xlim(xmin=1, xmax=25)
plt.ylim(ymin=-2, ymax=30)
plt.xlabel('Dias')
plt.ylabel('')
plt.title('Serie temporal da Area La_Plata')
plt.legend()
plt.grid()

plt.subplot(2, 2, 3)
plt.plot(x,y, label='IMERGE - La_plata')
plt.plot(x,z, label='24h 12Z NCEP la_plata')
plt.plot(x,p, label='24h 12Z SMG la_plata')
plt.xlim(xmin=1, xmax=25)
plt.ylim(ymin=-2, ymax=30)
plt.xlabel('Dias')
plt.ylabel('')
plt.title('Serie temporal da Area La_Plata')
plt.legend()
plt.grid()

plt.subplot(2, 2, 4)
plt.plot(x,y, label='IMERGE - La_plata')
plt.plot(x,z, label='24h 12Z NCEP la_plata')
plt.plot(x,p, label='24h 12Z SMG la_plata')
plt.xlim(xmin=1, xmax=25)
plt.ylim(ymin=-2, ymax=30)
plt.xlabel('Dias')
plt.ylabel('')
plt.title('Serie temporal da Area La_Plata')
plt.legend()
plt.grid()

plt.tight_layout()
plt.show()
plt.savefig('graph3.png')
