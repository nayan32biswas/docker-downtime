FROM python:3.10

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

WORKDIR /app/server/
COPY requirements.txt /app/server/

RUN pip install -r requirements.txt

ADD ./ /app/server/


# CMD uvicorn app.main:app --host 0.0.0.0 --port 8000 --workers 4
# CMD gunicorn app.main:app --workers 4 --worker-class uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000


# RUN chmod +x ./server.sh
# ENTRYPOINT ["./server.sh"]
