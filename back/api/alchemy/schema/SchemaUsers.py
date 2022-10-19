from pydantic import BaseModel,Field

class SchemaUsers ( BaseModel):
    iduser : int = Field(default=None)
    userName : str = Field(default=None)
    userFirstName : str = Field(default=None)
    isAdmin : bool = Field(default=False)
    mail : str = Field(default=None)
    phone : int = Field(default=None)
    company : int = Field(default=None)
    mdp : str = Field(default=None)