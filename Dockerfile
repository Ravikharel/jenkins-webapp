FROM python:slim
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
EXPOSe 5000
CMD ["python3","app.py"]