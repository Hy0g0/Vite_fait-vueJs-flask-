from pydantic import BaseModel,Field


class SchemaAdvertisement ( BaseModel):
    id : int = Field(default=None)
    actiontype : str = Field(default=None)
    advertisement : int = Field(default=None)
    userid : int = Field(default=None)