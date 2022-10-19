from TablesDeclare import Users
from main import SessionLocal

session = SessionLocal()
result = session.query(Users).all()
print(result[0].iduser)