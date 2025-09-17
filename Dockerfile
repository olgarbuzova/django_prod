FROM python:3.10-alpine

ENV PYTHONUNBUFFERED=1

WORKDIR /app

ADD requirements.txt requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY mysite .

CMD ["gunicorn", "mysite.wsgi:application", "--bind", "0.0.0.0:8000"]