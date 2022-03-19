import os
from time import sleep
from typing import Any

from fastapi import FastAPI, status

app: Any = FastAPI()


PORT = os.environ.get("PORT", None)


@app.get("/", status_code=status.HTTP_200_OK)
def home():
    sleep(5)
    return {"message": f"Hello Port {PORT}"}
