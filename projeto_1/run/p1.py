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
