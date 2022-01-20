FROM python:3.9.5

ADD example.py uvloop-0.16.0+fortanix-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl /app/

# Install all of the standard dependencies, and then replace the uvloop
# package with the patched version.
RUN pip install uvicorn[standard] \
    && pip install /app/uvloop-0.16.0+fortanix-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl

WORKDIR /app

RUN uvicorn --help

CMD ["uvicorn", "example:app", "--host", "0.0.0.0", "--port", "8000"]

