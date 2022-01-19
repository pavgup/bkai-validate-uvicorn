FROM python:3.9.5

ADD . /app

RUN pip install uvicorn[standard]

WORKDIR /app

RUN uvicorn --help

CMD ["uvicorn", "example:app", "--host", "0.0.0.0", "--port", "8000"]

