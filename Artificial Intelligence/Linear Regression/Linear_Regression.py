import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm
from statmodels.formula.api import ols
%matplotlib inline

x = [[2, 3], [2, 5], [20, 8], [44, 2], [22, 84], [28, 18], [20, 18], [20, 17]]
y = [8, 15, 22, 24, 25, 20, 48, 23]
x, y = np.array(x), np.array(y)

x = sm.add_constant(x)
model = sm.OLS(y, x)

results = model.fit()
print(results.summary())
