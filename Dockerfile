# Get a pre-built docker image with python312
FROM python:3.12
# set the working dir of DOCKER, not your local dir
WORKDIR /app
# copy the py requirements over to docker VM
COPY requirements.txt requirements.txt
# override the default PORT environment var with my uvicorn/fastapi project's
ENV PORT=8000
# install requirements. A container doesn't need a virtualenv
RUN pip install -r requirements.txt
# copy all files to container
COPY . .
# exec the uvicorn CMD start command, in this fashion
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1"]
