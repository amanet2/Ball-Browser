import uvicorn
from typing import Union
from fastapi import FastAPI

app = FastAPI()
available_servers = []


@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/add")
async def read_reg(q: Union[str, None] = None):
    if q not in available_servers:
        available_servers.append(q)
        return f"added server {q} to available list"
    return f"server {q} already registered"


@app.get("/del")
async def read_reg(q: Union[str, None] = None):
    if q in available_servers:
        available_servers.remove(q)
        return f"removed server {q} from available list"
    return f"server {q} is not registered"


@app.get("/avail")
async def read_avail():
    return available_servers

if __name__ == "__main__":
   uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)