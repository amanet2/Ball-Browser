FROM python:3.12

WORKDIR /app
COPY requirements.txt requirements.txt
EXPOSE 8000
RUN python3 -m venv venv
ENV PATH="/app/venv/bin:$PATH"
RUN venv/bin/pip install -r requirements.txt
COPY . .
# As an example here we're running the web service with one worker on uvicorn.
CMD ["venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1"]
# CMD exec uvicorn main:app --host 0.0.0.0 --port 8000 --workers 1
