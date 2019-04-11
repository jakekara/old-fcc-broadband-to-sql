#/usr/bin/env python

import pandas as pd

df = pd.read_csv("data/fbd_us_without_satellite_jun2016_v1.csv")

df.to_csv("data/fbd_us_without_satellite_jun2016_v1.psv",sep="|",index=False)
