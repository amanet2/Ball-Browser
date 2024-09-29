from pydantic import BaseModel, Field

class serverInfoModel(BaseModel):
    ip: str
    name: str
