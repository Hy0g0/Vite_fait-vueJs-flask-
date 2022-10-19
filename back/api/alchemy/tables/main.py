from sqlalchemy import create_engine

from sqlalchemy.orm import sessionmaker

#engine qui permet la connexion à notre base user:mdp @ host / base

engine = create_engine("mysql+mysqldb://phpmyadmin:Hugomarine94!@localhost/JobBoard?charset=utf8mb4") 



#création d'une séssion pour l'éxécution des requetes
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
