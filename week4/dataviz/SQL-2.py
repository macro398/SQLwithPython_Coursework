# %%
import sqlite3
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

con = sqlite3.connect('sakila.db')


def sql_to_df(sql_query):
    df = pd.read_sql(sql_query, con)
    return df
# %%
query = '''
    SELECT 
        strftime('%Y-%m', payment_date) AS
        Date, ROUND(SUM(amount), 0) AS Sales
    FROM payment
    GROUP BY Date
    ORDER BY Date ASC;
'''
sales_per_month = sql_to_df(query)
sales_per_month
# %%
sales_per_month = sales_per_month.set_index("Date")
sales_per_month.plot()
# %%
sales_per_month = sales_per_month.iloc[0:4]
sales_per_month.plot()
# %%
fig, ax = plt.subplots(figsize=(10,5))
ax.plot(sales_per_month, "bo-")
ax.set_ylim(ymin=0, ymax=32000)
ax.set_title("Sales Per Month")
ax.set_ylabel("Sales")

for date,sales in sales_per_month["Sales"].items():
    ax.annotate(str("${:,.0f}".format(sales)),
    xy =(date,sales+1000),
    fontweight="semibold",
    fontsize = 12)

plt.show()
# %%
