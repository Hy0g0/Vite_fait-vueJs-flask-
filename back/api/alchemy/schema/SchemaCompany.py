from pydantic import BaseModel,Field

class SchemaCompany ( BaseModel):
    idcompany : int = Field(default=None)
    companyName : str = Field(default=None)
    mail : str = Field(default=None)