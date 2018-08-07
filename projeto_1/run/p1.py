import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import style
from matplotlib import pyplot as plt

style.use('ggplot')

df=pd.read_csv("48_SMG.csv",index_col='TIME', parse_dates=True)
#df1=pd.read_csv("48_SMG_wc.csv",index_col='TIME',parse_dates=True)


df.plot(y="PREC") # Plot population against the index (years)

plt.plot(df.index, df["PREC"], label="PREC")

plt.xlabel(df.index.name)
plt.xlim(min(df.index), max(df.index))

df.plot.bar()
plt.grid()
plt.show()
plt.savefig('graph3.png')

time = [0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
#revenue = [200, 400, 650, 800, 850]
costs = [9.06252,6.55460,9.64472,6.86933,6.59972,5.41885,5.59019,3.27747,2.68218,0,4.38955,4.24953,6.03150,2.97174,6.20385,3.92044,4.04131,8.83436,5.31920,4.36725,3.44829,5.69593,3.16621,5.10772, 5.73958,]

##plt.plot(time, revenue, color='purple', linestyle='--')
plt.plot(time, costs, color='#82edc9', marker='s', label='Inline label')
plt.legend()


plt.show()
plt.savefig('graph1.png')
