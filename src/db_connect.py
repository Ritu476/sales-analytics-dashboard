from sqlalchemy import create_engine
import pandas as pd


DB_USER = "postgres"
DB_PASSWORD = "1234"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "sales_analytics_db"


def get_engine():
    connection_string = (
        f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )
    return create_engine(connection_string)


def read_query(query: str) -> pd.DataFrame:
    engine = get_engine()
    with engine.connect() as conn:
        df = pd.read_sql(query, conn)
    return df


if __name__ == "__main__":
    test_query = "SELECT * FROM fact_sales LIMIT 5;"
    df = read_query(test_query)
    print(df)