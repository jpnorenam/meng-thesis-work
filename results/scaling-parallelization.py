import matplotlib.pyplot as plt
import pandas as pd

df = pd.read_csv('results/data/bm-diakoptics-decoupled.csv')
plt.figure()
df.plot(x='number of buses', y=['real-time timestep', '1-thread', '2-threads','4-threads','6-threads','8-threads','10-threads','12-threads'])
plt.xlabel('number of system buses')
plt.ylabel('mean timestep duration (s)')
plt.ylim([0, 15E-5])
plt.grid()
plt.show()