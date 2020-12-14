FROM python:latest
COPY requirements.txt /app/
RUN pip install -r /app/requirements.txt
COPY . /app/

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]

CMD ["python", "app.py"]