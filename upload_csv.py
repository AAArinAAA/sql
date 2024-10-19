import pandas as pd
from sqlalchemy import create_engine

path = 'data.csv'
df = pd.read_csv(path)
df = df.rename(
    columns = 
    {
      'artist' : 'Artist',
      'genre'  : 'Genre',
      'time'   : 'Time'
    }
)
df = df.dropna(axis=0, subset=['Report_date'])
df['Time'] = df['Time'].str.replace(',', '.').astype(float)
table_name = 'music'
engine = create_engine('postgresql+psycopg2://root:12345@localhost:5432/postgres')
df.to_sql(table_name, engine, if_exists='replace', index=False)
print("Data loaded successfully into PostgreSQL.")
