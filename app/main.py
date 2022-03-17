import os
from typing import Any, List

from fastapi import FastAPI, status

app: Any = FastAPI()


def comma_separated_str_to_list(comma_separated_str: str) -> List[str]:
    return comma_separated_str.split(",")


ALLOWED_HOSTS = comma_separated_str_to_list(
    os.environ.get("ALLOWED_HOSTS", "http://localhost:8080")
)


@app.get("/", status_code=status.HTTP_200_OK)
def home():
    return {"message": "Hello World"}
