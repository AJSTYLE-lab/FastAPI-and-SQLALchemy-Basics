#In this file you will write FastAPI code and will create validation 
from pydantic import BaseModel
from datetime import date

class EmployeeBase(BaseModel):
    first_name: str
    last_name: str
    email: str
    salary: float
    hire_date: date

class EmployeeCreate(EmployeeBase):
    pass

class EmployeeResponse(EmployeeBase):
    employee_id: int

    class Config:
        from_attributes = True