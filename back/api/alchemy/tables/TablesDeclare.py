import datetime
from sqlalchemy import DATE, INTEGER, Boolean, Column, ForeignKey, Integer,VARCHAR
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Company(Base):
    __tablename__ = "Company"
    idcompany= Column(Integer, primary_key=True,default=None)
    companyName = Column(VARCHAR(50),default=None)
    mail = Column(VARCHAR(50),default=None)

    adverts = relationship( "Advertisement" , back_populates="companies")
    users = relationship( "Users" , back_populates="companies")

    def as_dict(self):
        return {c.name: str(getattr(self, c.name)) for c in self.__table__.columns}

class Advertisement(Base):
    __tablename__ = "Advertisement"

    id = Column(Integer, primary_key=True,default=None)
    advertisementCategory = Column(VARCHAR(50),default=None)
    publishedDate = Column(DATE, default=datetime.datetime.now())
    advertisementName = Column(VARCHAR(255), default=None)
    advertisementDescription = Column(VARCHAR(255), default=None)
    salary = Column(INTEGER, default=0)
    contractType = Column(VARCHAR(255), default=None)
    advertisementlocation = Column(VARCHAR(255), default=None)
    idcompany = Column(INTEGER , ForeignKey("Company.idcompany"))

    companies = relationship("Company", back_populates="adverts")
    infos = relationship("Interactions", back_populates="adverts")

    def as_dict(self):
        return {c.name: str(getattr(self, c.name)) for c in self.__table__.columns}

class Users(Base):
    __tablename__ = "Users"

    iduser = Column(Integer, primary_key=True,default=None)
    userName = Column(VARCHAR(50), default=None)
    userFirstName = Column(VARCHAR(50), default=None)
    isAdmin = Column(Boolean, default=False)
    mail = Column(VARCHAR(50), default=None)
    phone = Column(Integer, default=None)
    company = Column(INTEGER, ForeignKey("Company.idcompany"),default=None)
    mdp = Column(VARCHAR(100), default=None)

    companies = relationship("Company", back_populates="users")
    infos = relationship("Interactions", back_populates="people")

    def as_dict(self):
        return {c.name: str(getattr(self, c.name)) for c in self.__table__.columns}

class Interactions(Base):
    __tablename__ = "InteractionsInfos"

    id = Column(Integer, primary_key=True, default=None)
    msgPostuler = Column(VARCHAR(50), default=None)
    advertisement = Column(Integer, ForeignKey("Advertisement.id"))
    userid  = Column(Integer, ForeignKey("Users.iduser"))

    adverts = relationship( "Advertisement" , back_populates="infos")
    people = relationship("Users", back_populates="infos")

    def as_dict(self):
        return {c.name: str(getattr(self, c.name)) for c in self.__table__.columns}
