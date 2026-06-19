# Cognizant DN 5.0 Python FSE
# Module 3: Database Integration
# ORM Exercise: Database Configuration

import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Load environment variables
load_dotenv()

DB_TYPE = os.getenv("DB_TYPE", "mysql")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "3306")
DB_NAME = os.getenv("DB_NAME", "college_db")
DB_USER = os.getenv("DB_USER", "root")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")

# Build Database Connection URL
# e.g., mysql+mysqlconnector://root:password@localhost:3306/college_db
if DB_TYPE == "mysql":
    DATABASE_URL = f"mysql+mysqlconnector://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
elif DB_TYPE == "postgresql":
    DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
else:
    # Default to sqlite local database for development safety
    DATABASE_URL = "sqlite:///local_college.db"

# Create Engine
engine = create_engine(DATABASE_URL, echo=True)

# Create Session Local factory
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Declarative Base
Base = declarative_base()

def get_db():
    """Dependency helper to manage session lifetime."""
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
