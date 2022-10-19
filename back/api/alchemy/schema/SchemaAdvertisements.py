from pydantic import BaseModel,Field
from datetime import datetime

class SchemaAdvertisements ( BaseModel):

    id : int =Field(default=None)
    advertisementCategory : str = Field(default=None)
    publishedDate : datetime = Field(default=datetime.datetime.now())
    advertisementname : str = Field(default=None)
    advertisementDescription : str = Field(default=None)
    salary : int = Field(default=None)
    contractType : str = Field(default=None)
    advertisementlocation : str = Field(default=None)
    idcompany : int = Field(default=None)
