# Cognizant DN 5.0 Python FSE
# Module 3: Database Integration
# ORM Exercise: Models Schema

from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from database import Base

# Define your SQLAlchemy Models here
# Example:
# class Student(Base):
#     __tablename__ = "students"
#     id = Column(Integer, primary_key=True, index=True)
#     name = Column(String(100), nullable=False)
#     email = Column(String(100), unique=True, index=True)
