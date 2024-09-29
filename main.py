# import uvicorn
from typing import Union
from fastapi import FastAPI, HTTPException

from models import serverInfoModel

app = FastAPI()
server_info_map = {}


@app.get("/")
async def read_root():
    return "OK"


@app.get("/add")
async def read_add(ip: str = None, name: str = "ballgame"):
    if ip not in server_info_map.keys():
        server_info_map[ip] = name
        return f"added server '{name}' (IP:{ip}) to available list"
    raise HTTPException(status_code=500, detail="server already registered")


@app.get("/del")
async def read_del(ip: str = None):
    if ip in server_info_map.keys():
        server_info_map.remove(ip)
        return f"removed server {ip} from available list"
    raise HTTPException(status_code=404, detail="server not found")


@app.get("/list")
async def read_list():
    return server_info_map

# if __name__ == "__main__":
#    uvicorn.run("main:app", host="127.0.0.1", port=8000, reload=True)