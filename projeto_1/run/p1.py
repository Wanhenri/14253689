import pandas as pd
import matplotlib.pyplot as plt
from matplotlib import style
from matplotlib import pyplot as plt


time = [0, 1, 2, 3, 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
style.use('ggplot')

df=pd.read_csv("48_SMG.csv",index_col='TIME', parse_dates=True)


df1=pd.read_csv("48_SMG_wc.csv",index_col='TIME',parse_dates=True)


df.plot(y="PREC") # Plot population against the index (years)

plt.plot(df.index, df["PREC"], label="PREC")

plt.xlabel(df.index.name)
plt.xlim(min(df.index), max(df.index))

df.plot.bar()
plt.grid()
plt.show()
plt.savefig('graph3.png')
