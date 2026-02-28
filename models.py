#In this file you will define the table name with columns and their datatype only.

from sqlalchemy import Column, Integer, String, Numeric, Date
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Employee(Base):
    __tablename__ = "employees"
    employee_id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String)
    last_name = Column(String)
    email = Column(String)
    salary = Column(Numeric)
    hire_date = Column(Date)