for: https://repl.it/@ssgoh


import matplotlib as mpl
from matplotlib import pyplot as plt

time = [0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
revenue = [200, 400, 650, 800, 850]
costs = [9.06252,6.55460,9.64472,6.86933,6.59972,5.41885,5.59019,3.27747,2.68218,0,4.38955,4.24953,6.03150,2.97174,6.20385,3.92044,4.04131,8.83436,5.31920,4.36725,3.44829,5.69593,3.16621,5.10772, 5.73958,]

#plt.plot(time, revenue, color='purple', linestyle='--')
plt.plot(time, costs, color='#82edc9', marker='s')
plt.show()
plt.savefig('graph.png')

###########################################

import pandas as pd
import matplotlib.pyplot as plt
Year = ['1975','1976','1977','1978']
Computers =[1000,1500,1400,1450]
Printers =[800,1000,1200,1000]
Monitors=[500,600,200,700]

data = { 'Computers':Computers,
  'Printers':Printers,
  'Monitors':Monitors 
}

df2 = pd.DataFrame(data,  index=Year)
print(df2)

df2.plot.bar()
plt.grid()
plt.show()
plt.savefig('graph2.png')

#######################################

"""
===============
Basic pie chart
===============

Demo of a basic pie chart plus a few additional features.

In addition to the basic pie chart, this demo shows a few optional features:

    * slice labels
    * auto-labeling the percentage
    * offsetting a slice with "explode"
    * drop-shadow
    * custom start angle

Note about the custom start angle:

The default ``startangle`` is 0, which would start the "Frogs" slice on the
positive x-axis. This example sets ``startangle = 90`` such that everything is
rotated counter-clockwise by 90 degrees, and the frog slice starts on the
positive y-axis.
"""
import matplotlib.pyplot as plt

# Pie chart, where the slices will be ordered and plotted counter-clockwise:
labels = 'Frogs', 'Hogs', 'Dogs', 'Logs'
sizes = [15, 30, 45, 10]
explode = (0, 0.1, 0, 0)  # only "explode" the 2nd slice (i.e. 'Hogs')

fig1, ax1 = plt.subplots()
ax1.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%',
        shadow=True, startangle=90)
ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.

plt.show()
plt.savefig('graph')

##################################

import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import style
style.use('ggplot')
df=pd.read_csv("Data/Results.csv",index_col='Year',parse_dates=True)
df[['Chinese','Malay','Indian','Others','Overall']].plot()
print(df.head())
plt.show()
plt.plot()
plt.savefig('graph11')

Results.csv
Year,Malay,Chinese,Indian,Others,Overall
1997,59.8,69.9,79.8,79.2,69.4
1998,58.2,71.2,77.8,82.1,70.2
1999,61.4,74.8,82,82.5,73.8
2000,66.4,77.1,83.7,87.5,76.3
2001,70.9,80.4,87.1,87.6,79.8
2002,72.7,82.3,86.1,86.8,81.4
2003,74.8,85,88.5,89.9,84.1
2004,76.7,85.6,89.9,89.9,85
2005,85.1,85.5,92.2,92.8,86
2006,80.6,86.8,92.4,92.1,86.5
2007,79.3,86.9,90.3,90.7,86.1
2008,79.5,87.7,90.2,90.6,86.8
2009,82.1,87.2,91.1,91.3,86.9
2010,80.8,87.3,89.5,88.4,86.6
2011,82.6,88,91.1,90.1,87.6
2012,83.3,87.8,91.1,90,87.6
2013,84.9,89.4,92.6,90.9,89.1
2014,82.6,88.6,92.1,90.3,88.2
2015,82.6,89.2,90.3,91.3,88.6
2016,85.3,89.1,91.5,92.9,89

