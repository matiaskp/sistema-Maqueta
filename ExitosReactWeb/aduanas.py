import pandas as pd

df = pd.read_csv("DatosCSV.csv",delimiter=";")

print(df[2:7])

print(df.loc[2])

print(df["TOTAL"])

print(df["TOTAL"].sum())

print(df.loc[df["TOTAL"] ==  7970450])


