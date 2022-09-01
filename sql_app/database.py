from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

SQLALCHEMY_DATABASE_URL = "postgresql://logikaadmin:logikaadmin123@localhost/statistics-db"  # not local
# SQLALCHEMY_DATABASE_URL = "postgresql://admin:password@localhost/logika" # local

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()
