from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from database import SessionLocal
from models import Employee
from schemas import EmployeeCreate, EmployeeResponse
from typing import List

app = FastAPI()

# Dependency to get DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/employees", response_model=List[EmployeeResponse])
def get_employees(db: Session = Depends(get_db)):
    return db.query(Employee).all()

@app.post("/employees", response_model=EmployeeResponse)
def create_employee(employee: EmployeeCreate, db: Session = Depends(get_db)):
    db_employee = Employee(**employee.dict())
    db.add(db_employee)
    db.commit()
    db.refresh(db_employee)
    return db_employee