# %% library
import os
import sys
import nmap
import pandas as pd
from io import StringIO
import numpy as np

if not os.geteuid() == 0:
    sys.exit("\nrun as root please\n")

# %% IP address, input or args [uncomment]
ip_addr = sys.argv[1]
#ip_addr = input('IP Address: ')

# %% scanning hosts with OS & Service Version
nm = nmap.PortScanner()
nm.scan(hosts=ip_addr,ports='1-65535',arguments='-O -sV -T4')
hosts=nm.all_hosts()

# %% generate nmap csv file
recon = nm.csv()

# %%  read generated csv
recon = StringIO(nm.csv())
df = pd.read_csv(recon, header=0, sep=';')

# %% export as csv with name ip_addr.csv
df.to_csv(ip_addr+'.csv')

# %% 
df = df.fillna(0)

# %%
df.head()

