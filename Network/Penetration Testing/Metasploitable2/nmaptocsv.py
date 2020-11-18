# ARCHAICT // NMAPTOCSV
# Please run this as sudo, it's because of -O and -sV
# argument, they need root privilege to run.

# %% library
import os
import sys
import nmap
import pandas as pd
from io import StringIO
import numpy as np

# %% IP address
ip_addr = '192.168.56.101'  # input('IP Address: ')

# %% library
nm = nmap.PortScanner()
nm.scan(hosts=ip_addr,ports='1-65535',arguments='-O -sV -T4')
hosts=nm.all_hosts()

# %% nmap csv file
recon = nm.csv()

# %% 
recon = StringIO(nm.csv())
df = pd.read_csv(recon, header=0, sep=';')
df.to_csv('content/csv/'+ip_addr+'.csv')

# %% pandas dataframe
#df.head()
